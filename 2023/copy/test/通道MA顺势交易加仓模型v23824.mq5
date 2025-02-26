//+------------------------------------------------------------------+
//|                                              Moving Averages.mq5 |
//|                             Copyright 2000-2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2000-2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade\Trade.mqh>
CTrade     ExtTrade;
input double MaximumRisk        = 0.02;    // Maximum Risk in percentage
input double DecreaseFactor     = 3;       // Descrease factor
input double UseFixlot          = 0.1;     //用固定手数
input int PositionAll           = 9;      //单边限制持仓 次数
input  double  Addpow           = 1.1;  //浮亏-加仓.倍率
input ENUM_TIMEFRAMES ChartPd   = PERIOD_M5; //运行周期Runing Chart
input int   myMA                = 50; 
input double VolatilityStop     = 50; //波幅>固定值
input double VolatilityLimit    = 200;  //波幅<固定值Limit
input double VolatilityLimitDay = 2500; //日波幅<固定值
input bool MA_controltrend      = true; //控制趋势
input bool IndicatorClose       = false; //指标平仓
input int  Spacing              = 200; //浮亏加仓间格
//input int  MinGrid          = 50;//最小加仓间格
input int StopLoss              = 1700;  //止损.点Stoploss (in Pips)
input int TakeProfit            = 0;   //止盈.点TakeProfit (in Pips)
input ENUM_TIMEFRAMES Interval  = PERIOD_M5; //开单间隔
input bool Trail_all            = true;//-全部移损.点子 Tralstop_ALL
input int TrailingStop          = 500;
input int TrailingStep          = 100;
input bool Trailing             = false;//单笔移损.点子 Tralstop
input int Pendingdis            = 50;  //挂单间距（0=notuse）
input int  EA_MAGIC             = 23824; //EA识别号magic

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

int    MaPeriod       = 3;      // Moving Average period
int    MovingShift    = 0;       // Moving Average shift
int    mHandleH=0,mHandleL=0,mHandle26=0;
bool   ExtHedging=false;

datetime opbuyt=0,opsellt=0;
long spread=SymbolInfoInteger(_Symbol,SYMBOL_SPREAD);
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit(void)
  {
//--- 显示AccountInfoDouble()函数中所有有效信息
   printf("ACCOUNT_BALANCE =  %G",AccountInfoDouble(ACCOUNT_BALANCE));
   printf("ACCOUNT_CREDIT =  %G",AccountInfoDouble(ACCOUNT_CREDIT));
   printf("ACCOUNT_PROFIT =  %G",AccountInfoDouble(ACCOUNT_PROFIT));
   printf("ACCOUNT_EQUITY =  %G",AccountInfoDouble(ACCOUNT_EQUITY));
   printf("ACCOUNT_MARGIN =  %G",AccountInfoDouble(ACCOUNT_MARGIN));
   printf("ACCOUNT_MARGIN_FREE =  %G",AccountInfoDouble(ACCOUNT_MARGIN_FREE));
   printf("ACCOUNT_MARGIN_LEVEL =  %G",AccountInfoDouble(ACCOUNT_MARGIN_LEVEL));
   printf("ACCOUNT_MARGIN_SO_CALL = %G",AccountInfoDouble(ACCOUNT_MARGIN_SO_CALL));
   printf("ACCOUNT_MARGIN_SO_SO = %G",AccountInfoDouble(ACCOUNT_MARGIN_SO_SO));
   
//--- prepare trade class to control positions if hedging mode is active
   ExtHedging=((ENUM_ACCOUNT_MARGIN_MODE)AccountInfoInteger(ACCOUNT_MARGIN_MODE)==ACCOUNT_MARGIN_MODE_RETAIL_HEDGING);
   ExtTrade.SetExpertMagicNumber(EA_MAGIC);
   ExtTrade.SetMarginMode();
   ExtTrade.SetTypeFillingBySymbol(_Symbol);
//--- Moving Average indicator
   mHandleH=iMA(_Symbol,ChartPd,MaPeriod,MovingShift,MODE_LWMA,PRICE_HIGH);
   mHandleL=iMA(_Symbol,ChartPd,MaPeriod,MovingShift,MODE_LWMA,PRICE_LOW);
   mHandle26=iMA(_Symbol,ChartPd,myMA,0,MODE_SMA,PRICE_CLOSE);
   if(mHandleH==INVALID_HANDLE||mHandleL==INVALID_HANDLE||mHandle26==INVALID_HANDLE)
     {
      printf("Error creating MA indicator");
      return(INIT_FAILED);
     }

//--- ok
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
double buyopr,buylots,buyprofits;
double sellopr,selllots,sellprofits; 
int buyc,sellc;
void OnTick(void)
  {
//---
   
   if(AccountInfoDouble(ACCOUNT_BALANCE)<=0)ExpertRemove();
   
   
   buyc=buydan(buyopr,buylots,buyprofits);
   sellc=selldan(sellopr,selllots,sellprofits);
//ChartOpen(_Symbol, ChartPd);
   static datetime chartset=0;
   if(TimeCurrent()-chartset>PERIOD_M5*60)
     {
      ChartSetSymbolPeriod(0,_Symbol, ChartPd);
      chartset=TimeCurrent();
     }

if(TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
  {
   Trail_all(_Symbol);
   
   if(Pendingdis)
     {
      MODIFY_PENDING(_Symbol,50,Pendingdis,StopLoss,TakeProfit);
      GetPengding(_Symbol,EA_MAGIC);
     }
   if(IndicatorClose)
      CheckForClose();

   //if(SelectPosition()==false)
      CheckForOpen();
//Comment(bg,"   ",sg,"   ",(string)SelectPosition());
   TrailingStop(TrailingStop,TrailingStep,_Symbol);
   }
//---
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   Comment("");
  }

//+------------------------------------------------------------------+
//| Check for open position conditions                               |
//+------------------------------------------------------------------+
void CheckForOpen()
  {

//--- get current Moving Average
   double   maH[3],maL[4],ma26[5];
   if(CopyBuffer(mHandleH,0,0,2,maH)==false||CopyBuffer(mHandleL,0,0,2,maL)==false||CopyBuffer(mHandle26,0,0,2,ma26)==false)
     {
      Print("CopyBuffer from iMA failed, no data");
      PlaySound("expert.wav");
      return;
     }


//--- check signals
    double midma[9],close[9],open[9];
   ENUM_ORDER_TYPE signal=WRONG_VALUE;
    
   double bid=SymbolInfoDouble(_Symbol,SYMBOL_BID);
   double ask=SymbolInfoDouble(_Symbol,SYMBOL_ASK);
   close[0]=iClose(_Symbol,ChartPd,0);
   close[1]=iClose(_Symbol,ChartPd,1);
   open[0]=iOpen(_Symbol,ChartPd,0);
   open[1]=iOpen(_Symbol,ChartPd,1);
   midma[1]=maL[1]+(maH[1]-maL[1])/2;
     double freebuy=0,freesell=0;
     bool abb=OrderCalcMargin(ORDER_TYPE_BUY,_Symbol,TradeSizeOptimized(buyc),ask,freebuy);
     bool ass=OrderCalcMargin(ORDER_TYPE_BUY,_Symbol,TradeSizeOptimized(sellc),bid,freesell);
     
// buy conditions
   if(buyc+bg<PositionAll&&bg==0)
      if(iHigh(_Symbol,PERIOD_D1,0)-iClose(_Symbol,PERIOD_D1,0)<VolatilityLimitDay*_Point)
         if(close[1]>ma26[0]||!MA_controltrend)
            if(close[0]-iLow(_Symbol,ChartPd,0)<VolatilityLimitDay*_Point&&TimeCurrent()-opbuyt>Interval*60)
               if(ask<maL[1]-VolatilityStop*_Point||(buyc==0&&bg==0&&MathAbs(ask-midma[1])<VolatilityLimit*_Point))
                  if(gridstop(_Symbol,POSITION_TYPE_BUY,Spacing,ask))
                   if(AccountInfoDouble(ACCOUNT_MARGIN_FREE)>2*freebuy)
                    if((maL[0]>maL[1]&&maH[0]>maH[1]) ==false)
                    {
                     signal=ORDER_TYPE_BUY;
                     if(TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
                       {  
                        if(!Pendingdis)
                           OrderSends(_Symbol,signal,TradeSizeOptimized(buyc),StopLoss,TakeProfit,string(EA_MAGIC),EA_MAGIC);
                        if(Pendingdis)
                           OrderSendp(_Symbol,ORDER_TYPE_BUY_STOP,TradeSizeOptimized(buyc),Pendingdis,StopLoss,TakeProfit,string(EA_MAGIC)+perd(ChartPd),EA_MAGIC);
                        opbuyt=TimeCurrent();
                       }
                    }

// sell conditions
   if(sellc+sg<PositionAll&&sg==0)
      if(iClose(_Symbol,PERIOD_D1,0)-iLow(_Symbol,PERIOD_D1,0)<VolatilityLimitDay*_Point)
        if(close[1]<ma26[0]||!MA_controltrend)
            if(iHigh(_Symbol,ChartPd,0)-bid<VolatilityLimitDay*_Point&&TimeCurrent()-opsellt>Interval*60)
               if(bid>maH[1]+VolatilityStop*_Point||(sellc==0&&sg==0&&MathAbs(bid-midma[1])<VolatilityLimit*_Point))
                  if(gridstop(_Symbol,POSITION_TYPE_SELL,Spacing,bid))
                  if(AccountInfoDouble(ACCOUNT_MARGIN_FREE)>2*freesell)
                  if((maL[0]<maL[1]&&maH[0]<maH[1]) ==false)
                    {
                     signal=ORDER_TYPE_SELL;
                     if(TerminalInfoInteger(TERMINAL_TRADE_ALLOWED))
                       {
                        if(!Pendingdis)
                           OrderSends(_Symbol,signal,TradeSizeOptimized(sellc),StopLoss,TakeProfit,string(EA_MAGIC),EA_MAGIC);
                        if(Pendingdis)
                           OrderSendp(_Symbol,ORDER_TYPE_SELL_STOP,TradeSizeOptimized(sellc),Pendingdis,StopLoss,TakeProfit,string(EA_MAGIC)+perd(ChartPd),EA_MAGIC);
                        opsellt=TimeCurrent();
                       }
                    }

   Comment("\n "
           ,"幻数 "+string(EA_MAGIC),"   窗口 "+perd(ChartPd),"  "
           ,"\n "
           //,maL[0],"   ",maL[1],"   ",maH[0],"   ",maH[1]
           
          );
//---
  }

//+------------------------------------------------------------------+
//| Check for close position conditions                              |
//+------------------------------------------------------------------+
void CheckForClose()
  {

   if(TerminalInfoInteger(TERMINAL_TRADE_ALLOWED)==false)
      return;
//--- get current Moving Average
   double   maH[1],maL[1];
   if(CopyBuffer(mHandleH,0,0,1,maH)!=1||CopyBuffer(mHandleL,0,0,1,maL)!=1)
     {
      Print("CopyBuffer from iMA failed, no data");
      return;
     }
//--- positions already selected before
   bool signal_c=false;
   long type=PositionGetInteger(POSITION_TYPE);

   double close0=iClose(_Symbol,ChartPd,0);
   if(type==(long)POSITION_TYPE_BUY && close0>maH[0])
     {
      signal_c=true;
      //ExtTrade.PositionClose(_Symbol,3);

      CloseAllBuy(EA_MAGIC);
     }

   if(type==(long)POSITION_TYPE_SELL && close0<maL[0])
     {
      signal_c=true;
      //ExtTrade.PositionClose(_Symbol,3);

      CloseAllSell(EA_MAGIC);
     }
//---
  }
//+------------------------------------------------------------------+
//| Position select depending on netting or hedging                  |
//+------------------------------------------------------------------+
bool SelectPosition()
  {
   bool res=false;
//--- check position in Hedging mode

   uint total=PositionsTotal();
   for(uint i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);// 持仓价格
      string position_symbol=PositionGetSymbol(i);
      if(_Symbol==position_symbol && EA_MAGIC==PositionGetInteger(POSITION_MAGIC))
        {
         res=true;
         break;
        }
     }
//--- result for Hedging mode
   return(res);
  }
//+------------------------------------------------------------------+
//| Calculate optimal lot size                                       |
//+------------------------------------------------------------------+
double TradeSizeOptimized(int c)
  {
   double price=0.0;
   double margin=0.0;
//--- select lot size
   if(!SymbolInfoDouble(_Symbol,SYMBOL_ASK,price))
      return(0.0);
   if(!OrderCalcMargin(ORDER_TYPE_BUY,_Symbol,1.0,price,margin))
      return(0.0);
   if(margin<=0.0)
      return(0.0);

   double lot=NormalizeDouble(AccountInfoDouble(ACCOUNT_MARGIN_FREE)*MaximumRisk/margin,2);

//--- calculate number of losses orders without a break
   if(DecreaseFactor>0)
     {
      //--- select history for access
      HistorySelect(0,TimeCurrent());
      //---
      int    orders=HistoryDealsTotal();  // total history deals
      int    losses=0;                    // number of losses orders without a break

      for(int i=orders-1; i>=0; i--)
        {
         ulong ticket=HistoryDealGetTicket(i);
         if(ticket==0)
           {
            Print("HistoryDealGetTicket failed, no trade history");
            break;
           }
         //--- check symbol
         if(HistoryDealGetString(ticket,DEAL_SYMBOL)!=_Symbol)
            continue;
         //--- check Expert Magic number
         if(HistoryDealGetInteger(ticket,DEAL_MAGIC)!=EA_MAGIC)
            continue;
         //--- check profit
         double profit=HistoryDealGetDouble(ticket,DEAL_PROFIT);
         if(profit>0.0)
            break;
         if(profit<0.0)
            losses++;
        }
      //---
      if(losses>1)
         lot=NormalizeDouble(lot-lot*losses/DecreaseFactor,2);
     }
//--- normalize and check limits
   double stepvol=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_STEP);
   lot=stepvol*NormalizeDouble(lot/stepvol,0);

   double minvol=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   if(lot<minvol)
      lot=minvol;

   double maxvol=SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MAX);
   if(lot>maxvol)
      lot=maxvol;

   if(UseFixlot)
      lot=UseFixlot;
   if(Addpow)
   {
   lot = UseFixlot * MathPow(Addpow,c); 
   if(Addpow==1.1)lot = UseFixlot + c*UseFixlot; 
   }
    
      
//--- return trading volume
   return(lot);
  }


//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStop(double start,double step,string symbol)
  {
   if(Trailing==false)
      return;

   double trallstart=TrailingStop;
   double trallstep=TrailingStep;

//if(SymbolInfoTick(symbol,last_tick))
// if(last_tick.time>TimeCurrent()-1*60)
     {
      int t=PositionsTotal();
      if(trallstart>0&&trallstep>0)
         for(int i=t-1; i>=0; i--)
           {
            if(PositionGetTicket(i)>0)
               if(PositionGetString(POSITION_SYMBOL)==symbol)
                  if(PositionGetInteger(POSITION_MAGIC)==EA_MAGIC)
                    {
                     long type=PositionGetInteger(POSITION_TYPE);
                     double bid=SymbolInfoDouble(symbol,SYMBOL_BID);
                     double ask=SymbolInfoDouble(symbol,SYMBOL_ASK);
                     long dig=SymbolInfoInteger(symbol,SYMBOL_DIGITS);
                     double pot=SymbolInfoDouble(symbol,SYMBOL_POINT);
                     int minstop=(int)SymbolInfoInteger(symbol,SYMBOL_TRADE_STOPS_LEVEL);
                     double Opr=PositionGetDouble(POSITION_PRICE_OPEN);
                     double sl=PositionGetDouble(POSITION_SL);
                     double tp=PositionGetDouble(POSITION_TP);
                     if(type==POSITION_TYPE_BUY)
                       {
                        if(bid-Opr>=pot*trallstart && sl<bid-pot*trallstep)
                          {
                           MqlTradeRequest request= {};
                           MqlTradeResult  result= {};
                           request.action=TRADE_ACTION_SLTP;
                           request.position=PositionGetTicket(i);
                           request.symbol=symbol;
                           request.sl=NormalizeDouble(bid-pot*trallstep,_Digits);
                           request.tp=tp;
                           if(!OrderSend(request,result))
                              PrintFormat("OrderSend error %d",GetLastError());
                          }
                       }
                     if(type==POSITION_TYPE_SELL)
                       {
                        if(Opr-ask>=pot*trallstart && sl>ask+pot*trallstep)
                          {

                           MqlTradeRequest request= {};
                           MqlTradeResult  result= {};
                           request.action=TRADE_ACTION_SLTP;
                           request.position=PositionGetTicket(i);
                           request.symbol=symbol;
                           request.sl=NormalizeDouble(ask+pot*trallstep,_Digits);
                           request.tp=tp;
                           if(!OrderSend(request,result))
                              PrintFormat("OrderSend error %d",GetLastError());
                          }
                       }
                    }
           }
     }
  }
//--------------------------------------------------------------------+
void CloseAllSell(int magic)
  {

   ulong ticket=0;
   int tot= PositionsTotal();
   if(tot<=0)
      return;
   for(int i=tot-1; i>=0; i--)
     {
      if((ticket=PositionGetTicket(i))>0&&(PositionGetInteger(POSITION_MAGIC)==magic||magic==-1))
        {
         if(PositionGetSymbol(i)==_Symbol && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
           {
            ExtTrade.PositionClose(ticket);
           }
        }
     }
  }
//--------------------------------------------------------------------+
void CloseAllBuy(int magic)
  {

   ulong ticket=0;
   int tot= PositionsTotal();
   if(tot<=0)
      return;
   for(int i=tot-1; i>=0; i--)
     {
      if((ticket=PositionGetTicket(i))>0&&(PositionGetInteger(POSITION_MAGIC)==magic||magic==-1))
        {
         if(PositionGetSymbol(i)==_Symbol && (PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY))
           {
            ExtTrade.PositionClose(ticket);
           }
        }
     }
  }

//+------------------------------------------------------------------+
int bg=0;//获取挂单buystop的个数
int sg=0;//获取挂单sellstop的个数
//+------------------------------------------------------------------+
void GetPengding(string symbol,long magic)
  {
   ulong    ticket=0;
   double   open_price;
   double   initial_volume;
   datetime time_setup;
   string   type;
   long     order_magic;
//--- 订单属性返回值的变量
   bg=0;//获取挂单buystop的个数
   sg=0;//获取挂单sellstop的个数
   for(int i=0; i<OrdersTotal(); i++)
     {
      //--- 通过列表中的仓位返回订单报价
      ticket=OrderGetTicket(i);
      //--- 返回订单属性
      open_price    =OrderGetDouble(ORDER_PRICE_OPEN);
      time_setup    =(datetime)OrderGetInteger(ORDER_TIME_SETUP);
      symbol        =OrderGetString(ORDER_SYMBOL);
      order_magic   =OrderGetInteger(ORDER_MAGIC);
      // positionID    =OrderGetInteger(ORDER_POSITION_ID);
      initial_volume=OrderGetDouble(ORDER_VOLUME_INITIAL);
      type          =EnumToString(ENUM_ORDER_TYPE(OrderGetInteger(ORDER_TYPE)));
      string ordcom=OrderGetString(ORDER_COMMENT);

      if(symbol==symbol && order_magic==magic)
        {
         if(type=="ORDER_TYPE_BUY_STOP")
           {
            bg++;
           }
         if(type=="ORDER_TYPE_SELL_STOP")
           {
            sg++;
           }
        }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint OrderSends(string symbol,ENUM_ORDER_TYPE type,double lot,long slpips,long tppips,string comm,long magic)
  {
   double point=SymbolInfoDouble(_Symbol,SYMBOL_POINT);                // value of point
   long digits=SymbolInfoInteger(_Symbol,SYMBOL_DIGITS);                // 小数位数 (精确度)
   double ask=SymbolInfoDouble(symbol,SYMBOL_ASK);
   double bid=SymbolInfoDouble(symbol,SYMBOL_BID);
   double price=ORDER_TYPE_SELL?bid:ask;
   double sl=type==ORDER_TYPE_SELL?bid+slpips*point:ask-slpips*point;
   if(slpips==0)
      sl=0;
   double tp=type==ORDER_TYPE_SELL?bid-tppips*point:ask+tppips*point;
   if(tppips==0)
      tp=0;
//OrderSends(_Symbol,ORDER_TYPE_SELL,lot,bid);
//--- 准备请求
   MqlTradeRequest request= {};
   MqlTradeResult result= {};
   request.action=TRADE_ACTION_DEAL;         //
   request.magic=magic;                      // ORDER_MAGIC
   request.symbol=symbol;                      // 交易品种
   request.volume=lot;                          // 0.1为单位的交易量
   request.sl=sl;                                // 指定止损价位
   request.tp=tp;                                // 指定盈利价位
   request.type_filling=ORDER_FILLING_IOC;
//--- 形成订单类型
   request.type=type;                // 订单类型
   request.deviation=5;
   request.comment=comm;
//--- 形成挂单价格
   request.price=NormalizeDouble(price,_Digits);  // 开仓价
//--- 发送交易请求

   bool res=OrderSend(request,result);
   if(!res)
      Print(GetLastError());
//--- 编写服务器回复到日志
//   Print(__FUNCTION__,":",result.comment,"->",clot);
   if(result.retcode==10016)
      Print(result.bid,result.ask,result.price);
//--- 返回交易服务器回复的代码
   return result.retcode;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint OrderSendp(string symbol,ENUM_ORDER_TYPE type,double lot,long penddis,long slpips,long tppips,string comm,long magic)
  {
   penddis=MathMax(stoplv,penddis);
   double point=SymbolInfoDouble(symbol,SYMBOL_POINT);                // value of point
   long digits=SymbolInfoInteger(symbol,SYMBOL_DIGITS);                // 小数位数 (精确度)
   double ask=SymbolInfoDouble(symbol,SYMBOL_ASK);
   double bid=SymbolInfoDouble(symbol,SYMBOL_BID);
   double price=0,sl=0,tp=0;
   if(type==ORDER_TYPE_SELL_STOP)
     {
      price=bid-penddis*point;
      sl=price+slpips*point;
      tp=price-tppips*point;
     }
   if(type==ORDER_TYPE_BUY_STOP)
     {
      price=ask+penddis*point;
      sl=price-slpips*point;
      tp=price+tppips*point;
     }
   if(slpips==0)
      sl=0;
   if(tppips==0)
      tp=0;
//OrderSendp(_Symbol,ORDER_TYPE_BUY_STOP,lot,ask);
//--- 准备请求
   MqlTradeRequest request= {};
   MqlTradeResult result= {};
   request.action=TRADE_ACTION_PENDING;         // 设置挂单
   request.magic=magic;                        // ORDER_MAGIC
   request.symbol=symbol;                      // 交易品种
   request.volume=lot;                          // 0.1为单位的交易量
   request.sl=sl;                                // 指定止损价位
   request.tp=tp;                                // 指定盈利价位
//--- 形成订单类型
   request.type=type;                          // 订单类型
   request.deviation=5;
   request.comment=comm;
//--- 形成挂单价格
   request.price=NormalizeDouble(price,_Digits);  // 开仓价
//--- 发送交易请求

   bool res=OrderSend(request,result);
   if(!res)
      Print(GetLastError());
//--- 编写服务器回复到日志
//   Print(__FUNCTION__,":",result.comment,"->",lot);
   if(result.retcode==10016)
      Print(result.bid,result.ask,result.price);
//--- 返回交易服务器回复的代码
   return result.retcode;
  }
//+------------------------------------------------------------------+
void MODIFY_PENDING(string symbol,int step,long penddis,long slpips, long tppips)
  {
   penddis=MathMax(stoplv,penddis);
//--- 声明并初始化交易请求和交易请求结果
   MqlTradeRequest request= {};
   MqlTradeResult  result= {};
   int total=OrdersTotal(); // 已下挂单的总数
//--- 重做所有已下的挂单
   for(int i=0; i<total; i++)
   if(OrderGetTicket(i)>0)
   if(OrderGetString(ORDER_SYMBOL)==symbol)
     {
      //--- 订单参数
      ulong  order_ticket=OrderGetTicket(i);                             // 订单价格
      string order_symbol=OrderGetString(ORDER_SYMBOL);                  // 交易品种
      int    digits=(int)SymbolInfoInteger(order_symbol,SYMBOL_DIGITS);  // 小数位数
      ulong  magic=OrderGetInteger(ORDER_MAGIC);                         // 订单的幻数
      double volume=OrderGetDouble(ORDER_VOLUME_CURRENT);                // 订单的当前交易量
      double sl=OrderGetDouble(ORDER_SL);                                // 订单的当前止损
      double tp=OrderGetDouble(ORDER_TP);                                // 订单的当前止赢
      ENUM_ORDER_TYPE type=(ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE); // 订单类型
      // 以点数从当前价抵消下单
      double oldop=OrderGetDouble(ORDER_PRICE_OPEN);
      double price;                                                      // 订单触动价
      double point=SymbolInfoDouble(order_symbol,SYMBOL_POINT);          // 点值
      //--- 输出订单信息
      /*Print(//"#%I64u %s  %s  %.2f  %s  sl: %s  tp: %s  [%I64d]",
                  order_ticket,"   ",
                  order_symbol,"   ",
                  EnumToString(type),"   ",
                  volume,"   ",
                  DoubleToString(PositionGetDouble(POSITION_PRICE_OPEN),digits),"   ",
                  DoubleToString(sl,digits),"   ",
                  DoubleToString(tp,digits),"   ",
                  magic); */
                  
      request.tp = 0;
      request.sl = 0;
      bool ok=false;
      //--- 如果幻数匹配，不定义止损和止赢
      if(magic==EA_MAGIC&&order_symbol==symbol)
        {
         request.action=TRADE_ACTION_MODIFY;                           // 交易操作类型
         request.order = OrderGetTicket(i);                            // 订单价格
         request.symbol   =symbol;                                   // symbol
         request.deviation=5;                                          // 允许价格偏差
         //--- 根据持仓类型设置价格水平，订单的止损和止赢
         if(type==ORDER_TYPE_BUY_LIMIT)
           {
            price = SymbolInfoDouble(symbol,SYMBOL_ASK)-penddis*point;
            if(tppips!=0)
               request.tp = NormalizeDouble(price+tppips*point,digits);
            if(slpips!=0)
               request.sl = NormalizeDouble(price-slpips*point,digits);
            request.price    =NormalizeDouble(price,digits);                // 正常开盘价
           ok=true;
           }
         else
            if(type==ORDER_TYPE_SELL_LIMIT)
              {
               price = SymbolInfoDouble(symbol,SYMBOL_BID)+penddis*point;
               if(tppips!=0)
                  request.tp = NormalizeDouble(price-tppips*point,digits);
               if(slpips!=0)
                  request.sl = NormalizeDouble(price+slpips*point,digits);
               request.price    =NormalizeDouble(price,digits);                 // 正常开盘价
              ok=true;
              }
            else
               if(type==ORDER_TYPE_BUY_STOP)
                 {
                  price = SymbolInfoDouble(symbol,SYMBOL_ASK)+penddis*point;
                  if(price<oldop-step*point)
                    {
                     if(tppips!=0)
                        request.tp = NormalizeDouble(price+tppips*point,digits);
                     if(slpips!=0)
                        request.sl = NormalizeDouble(price-slpips*point,digits);
                     request.price    =NormalizeDouble(price,digits);                 // 正常开盘价
                    ok=true;
                    }
                 }
               else
                  if(type==ORDER_TYPE_SELL_STOP)
                    {
                     price = SymbolInfoDouble(symbol,SYMBOL_BID)-penddis*point;
                     if(price>oldop+step*point)
                       {
                        if(tppips!=0)
                           request.tp = NormalizeDouble(price-tppips*point,digits);
                        if(slpips!=0)
                           request.sl = NormalizeDouble(price+slpips*point,digits);
                        request.price    =NormalizeDouble(price,digits);                 // 正常开盘价
                       ok=true;
                       }
                    }
         //--- 发送请求
         if(ok==true)
         if(OrderSend(request,result))
            PrintFormat("MODIFY_PENDING OK %d",GetLastError());  // 如果不能发送请求，输出错误代码
         //--- 操作信息
         //PrintFormat("retcode=%u  deal=%I64u  order=%I64u",result.retcode,result.deal,result.order);
         //--- 归零请求和结果值
         ZeroMemory(request);
         ZeroMemory(result);
        }
     }
  }

//-----------------------------------------------------------------------
string perd(int period)
  {
   string PERD="";
   if(period>=1)
     {
      if(period==1)
         return "M1";
      if(period==5)
         return "M5";
      if(period==15)
         return "M15";
      if(period==30)
         return "M30";
      if(period==16385)
         return "H1";
      if(period==60)
         return "H1";
      if(period==16388)
         return "H4";
      if(period==240)
         return "H4";
      if(period==16408)
         return "D1";
      if(period==1440)
         return "D1";
      if(period==32769)
         return "W1";
      if(period==49153)
         return "WN";
     }
   return PERD;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int buydan(double &Opr,double &lots,double &profits)
  {
   int a=0;
   Opr=0;
   lots=0;
   profits=0;
   for(int i=0; i<PositionsTotal(); i++)
     {
      if(PositionGetSymbol(i)==_Symbol && PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
        {
         a++;
         Opr=PositionGetDouble(POSITION_PRICE_OPEN);
         lots=PositionGetDouble(POSITION_VOLUME)+lots;
         profits=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)+profits;
        }

     }
   return(a);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int selldan(double &Opr,double &lots,double &profits)
  {
   int a=0;
   Opr=0;
   lots=0;
   profits=0;
   for(int i=0; i<PositionsTotal(); i++)
     {
      if(PositionGetSymbol(i)==_Symbol&& PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
        {
         a++;
         Opr=PositionGetDouble(POSITION_PRICE_OPEN);
         lots=PositionGetDouble(POSITION_VOLUME)+lots;
         profits=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)+profits;
        }

     }
   return(a);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
bool gridstop(string symb,ENUM_POSITION_TYPE type,int space,double price)
  {
   int t=PositionsTotal();
   double pot=SymbolInfoDouble(symb,SYMBOL_POINT);
   for(int i=t-1; i>=0; i--)
     {
      if(PositionGetTicket(i)>0)
        {
         if(PositionGetString(POSITION_SYMBOL) == _Symbol)
           {
            if(PositionGetInteger(POSITION_TYPE)==type||type==-1)
              {
               double priceopen=PositionGetDouble(POSITION_PRICE_OPEN);
               if(MathAbs(price-priceopen)<space*pot)
                 {
                  return false;
                 }
              }
           }
        }
     }
   return true;
  }


//-------------------------------------------------------------------------+

static double oldbuy,oldsell;
int stoplv=(int)SymbolInfoInteger(_Symbol,SYMBOL_TRADE_STOPS_LEVEL); 
void Trail_all(string symb)
  {

   if(Trail_all==false)
      return;
   double stopbuy=0,stopsell=0,newbuy=0,newsell=0;
   double trail=TrailingStop;
   double step=MathMax(TrailingStep,stoplv+2);
   double pot=SymbolInfoDouble(symb,SYMBOL_POINT);
   double bid=SymbolInfoDouble(symb,SYMBOL_BID);
   double ask=SymbolInfoDouble(symb,SYMBOL_ASK);
   int dig=(int)SymbolInfoInteger(symb,SYMBOL_DIGITS);
//---追踪止盈点子---
      stopbuy = bid-step*pot;
      stopsell = ask+step*pot;
      //---------
      if(buyc>=1)
        {
         if(stopbuy>AveragePrice(_Symbol,POSITION_TYPE_BUY,EA_MAGIC)+trail*pot)
           {
            newbuy=NormalizeDouble(stopbuy,dig);
            if(newbuy>oldbuy||oldbuy==0)
              {
               int t=PositionsTotal();
               for(int i=t-1; i>=0; i--)
                 {
                  if(PositionGetTicket(i)>0&&PositionGetString(POSITION_SYMBOL)==symb)
                    {
                     double sl=PositionGetDouble(POSITION_SL);
                     double tp=PositionGetDouble(POSITION_TP);
                     if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY)
                       {
                        if(PositionGetInteger(POSITION_MAGIC)==EA_MAGIC||EA_MAGIC<=0)
                          {
                           MqlTradeRequest request= {1};
                           MqlTradeResult  result= {0};
                           request.action=TRADE_ACTION_SLTP;
                           request.position=PositionGetTicket(i);
                           request.symbol=symb;
                           request.sl=newbuy;
                           request.tp=0;
                           if(!OrderSend(request,result))
                              PrintFormat("ModifySL buy-- error %d",GetLastError());
                          }
                       }
                    }
                 }
               oldbuy=newbuy;
              }
           }
        }
      if(buyc==0)
         oldbuy=0;

      //----------
      if(sellc>=1)
        {
         if(stopsell<AveragePrice(_Symbol,POSITION_TYPE_SELL,EA_MAGIC)-trail*pot)
           {
            newsell=NormalizeDouble(stopsell,dig);
            if(newsell<oldsell||oldsell==0)
              {
               int t=PositionsTotal();
               for(int i=t-1; i>=0; i--)
                 {
                  if(PositionGetTicket(i)>0&&PositionGetString(POSITION_SYMBOL)==symb)
                    {
                     double sl=PositionGetDouble(POSITION_SL);
                     double tp=PositionGetDouble(POSITION_TP);
                     if(PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL)
                       {
                        if(PositionGetInteger(POSITION_MAGIC)==EA_MAGIC||EA_MAGIC<=0)
                          {
                           MqlTradeRequest request= {1};
                           MqlTradeResult  result= {0};
                           request.action=TRADE_ACTION_SLTP;
                           request.position=PositionGetTicket(i);
                           request.symbol=symb;
                           request.sl=newsell;
                           request.tp=0;
                           if(!OrderSend(request,result))
                              PrintFormat("ModifySL sell-- error %d",GetLastError());
                          }
                       }
                    }
                 }
               oldsell=newsell;
              }
           }
        }
      if(sellc==0)
         oldsell=0;
  }
  
double AveragePrice(string symbol,ENUM_POSITION_TYPE type,int magic)
  {
   double AveragePrc = 0;
   double Count = 0;
   int t=PositionsTotal();
      for(int i=t-1;i>=0;i--)
        {
      if(PositionGetTicket(i)>0)
         {
         if(PositionGetString(POSITION_SYMBOL) == symbol && (PositionGetInteger(POSITION_MAGIC) == magic||magic==0))
            {
            if(PositionGetInteger(POSITION_TYPE) == type)
               {
               AveragePrc += PositionGetDouble(POSITION_PRICE_OPEN)*PositionGetDouble(POSITION_VOLUME);
               Count += PositionGetDouble(POSITION_VOLUME);
               }
             }
          }
        }
   if(AveragePrc != 0 && Count != 0)
      return(NormalizeDouble(AveragePrc / Count, (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)));
   else
      return(0);
  }
//+------------------------------------------------------------------+
//| 程序结束                                                         |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
input datetime 程序最终编译时间=__DATETIME__;
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//------------------------------------------------------------------+
double ATR_1(string symbol,ENUM_TIMEFRAMES PER=PERIOD_D1)
  {
   double adr=0;
   int nK=30;
   MqlDateTime mqtime;
   double s=0.0;
   for(int a=1; a<=nK; a++) //振幅
     {
      datetime dt = iTime(symbol,PER,a);
      TimeToStruct(dt,mqtime);
      if(mqtime.day_of_week!=0 && mqtime.day_of_week!=6)
        {s=s+(iHigh(symbol,PER,a)-iLow(symbol,PER,a));}
      if(a==nK)
         adr=NormalizeDouble(s/nK,_Digits);
     } //Print(adr," bars  ",bars, "  ", mqtime.day_of_week);
   return adr;
  }