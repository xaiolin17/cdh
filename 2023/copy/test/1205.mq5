//
#include <GetAllData\StructAll.mqh>
#include <GetAllData\CurrentAssignmentStruct.mqh>
#include <GetAllData\AssignmentCycle.mqh>
#include <Trade\Trade.mqh>
CTrade         m_trade;

double balance_curr;
double equity_curr;


double index_close_arr_1h[5];
double index_open_arr_1h[5];
double index_high_arr_1h[5];
double index_low_arr_1h[5];

double index_close_arr_5m[8];
double index_open_arr_5m[8];
double index_high_arr_5m[8];
double index_low_arr_5m[8];

double max_arr[];
double min_arr[];
int type_num = 0;

input double lotss=0.01;        // 交易量手数
input int  EXPERT_MAGIC1=12345;  // EA幻数
input int  EXPERT_MAGIC2=54321;  // EA幻数
input int TrailingStop          = 450;
input int TrailingStep          = 200;
// shift
int kdata_shift_num = 1;
// count
int copy_count_num =  20;
//交易量
double trade_lot;
//时间变化判断
datetime time_change = TimeCurrent();
datetime time_change_H1 = TimeCurrent();
datetime time_change_H4 = TimeCurrent();

double close_h1;
double open_h1;
double high_h1;
double low_h1;

double sellPri;
double buyPri;

double sellPriYS;
double buyPriYS;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

//--- 设置正确的交易量
   double min_lot = SymbolInfoDouble(_Symbol,SYMBOL_VOLUME_MIN);
   trade_lot=lotss > min_lot ? lotss:min_lot;


   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {

  }

//+------------------------------------------------------------------+
void TrailingStopBuy(double start,double step,string symbol)
  {

   double trallstart=TrailingStop;
   double trallstep=TrailingStep;
     {
      int t=PositionsTotal();
      if(trallstart>0&&trallstep>0)
         for(int i=t-1; i>=0; i--)
           {
            if(PositionGetTicket(i)>0)
               if(PositionGetString(POSITION_SYMBOL)==symbol)
                  if(PositionGetInteger(POSITION_MAGIC)==EXPERT_MAGIC1)
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
                          }
                       }
                    }
           }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingStopSell(double start,double step,string symbol)
  {

   double trallstart=TrailingStop;
   double trallstep=TrailingStep;
     {
      int t=PositionsTotal();
      if(trallstart>0&&trallstep>0)
         for(int i=t-1; i>=0; i--)
           {
            if(PositionGetTicket(i)>0)
               if(PositionGetString(POSITION_SYMBOL)==symbol)
                  if(PositionGetInteger(POSITION_MAGIC)==EXPERT_MAGIC2)
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
                          }
                       }
                    }
           }
     }
  }

//+------------------------------------------------------------------+
double AveragePrice(string symbol,ENUM_POSITION_TYPE type,int magic)
  {
   double AveragePrc = 0;
   double Count = 0;
   int t=PositionsTotal();
   for(int i=t-1; i>=0; i--)
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
//|                     买请求                                       |
//+------------------------------------------------------------------+
bool buy(double x)
  {
   MqlTradeRequest request= {};
   MqlTradeResult  result= {};

//request.position =0;                // 关闭情况下的持仓单号
   request.action=TRADE_ACTION_PENDING;         // 设置开单
   request.symbol=Symbol();                      // 交易品种
   request.volume=x;                      // 交易量
   request.price=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   request.sl= NormalizeDouble(request.price - 5,_Digits);
   request.tp= NormalizeDouble(request.price + 5,_Digits);
   request.deviation=0;                        // 可允许的价格偏差
   request.type=ORDER_TYPE_BUY_LIMIT;                // 订单类型
   request.type_filling=ORDER_FILLING_IOC;
   request.magic=EXPERT_MAGIC1;            // 交易的幻数

   printf("发送交易请求:买入价格 %f, 止损 %f, 止盈 %f\n当前价格：%f",request.price,request.sl,request.tp,SymbolInfoDouble(Symbol(),SYMBOL_ASK));
//--- 发送交易请求
   if(!OrderSend(request,result))
     {
      //--- 显示数据失败
      PrintFormat("OrderSend %s %s %.2f at %.5f error %d",request.symbol,ORDER_TYPE_BUY_LIMIT,trade_lot,request.price,GetLastError());

     }
//--- 交易请求结束
   return true;
  }

//+------------------------------------------------------------------+
//|                     卖请求                                       |
//+------------------------------------------------------------------+
bool sell(double x)
  {
   MqlTradeRequest request= {};
   MqlTradeResult  result= {};

//request.position =0;                // 关闭情况下的持仓单号
   request.action=TRADE_ACTION_DEAL;         // 设置开单
   request.symbol=Symbol();                      // 交易品种
   request.volume=x;                      // 交易量
   request.price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   request.sl= NormalizeDouble(request.price + 5,_Digits);
   request.tp= NormalizeDouble(request.price - 5,_Digits);
   request.deviation=0;                        // 可允许的价格偏差
   request.type=ORDER_TYPE_SELL_LIMIT;                // 订单类型
   request.type_filling=ORDER_FILLING_IOC;
   request.magic=EXPERT_MAGIC2;            // 交易的幻数

   printf("发送交易请求:\n买入价格 %f, 止损 %f, 止盈 %f",request.price,request.sl,request.tp);
//--- 发送交易请求
   if(!OrderSend(request,result))
     {
      //--- 显示数据失败
      PrintFormat("OrderSend %s %s %.2f at %.5f error %d",request.symbol,ORDER_TYPE_BUY,trade_lot,request.price,GetLastError());

     }
//--- 交易请求结束
   return true;
  }

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void Close_WIN()
  {

   ulong ticket=0;
   int tot= PositionsTotal();
   if(tot<=0)
      return;

   for(int i=tot-1; i>=0; i--)
     {
      if((ticket=PositionGetTicket(i))>0)
        {
         if(PositionGetSymbol(i)==_Symbol)
            if(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)>1.0)
              {
               m_trade.PositionClose(ticket);
              }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_D()
  {

   ulong ticket=0;
   int tot= PositionsTotal();
   if(tot<=0)
      return;

   for(int i=tot-1; i>=0; i--)
     {
      if((ticket=PositionGetTicket(i))>0)
        {
         if(PositionGetSymbol(i)==_Symbol)
            if(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)< -4)
              {
               m_trade.PositionClose(ticket);
              }
        }
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Close_ALL()
  {

   ulong ticket=0;
   int tot= PositionsTotal();
   if(tot<=0)
      return;

   for(int i=tot-1; i>=0; i--)
     {
      if((ticket=PositionGetTicket(i))>0)
        {
         if(PositionGetSymbol(i)==_Symbol)
            //if(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)>1.0)
           {
            m_trade.PositionClose(ticket);
           }
        }
     }
  }
//
void OnTick()
  {

   TrailingStopBuy(TrailingStop,TrailingStep,_Symbol);
   TrailingStopSell(TrailingStop,TrailingStep,_Symbol);
   
   double buyjunjia=AveragePrice(_Symbol,POSITION_TYPE_BUY,EXPERT_MAGIC1);
   double selljunjia=AveragePrice(_Symbol,POSITION_TYPE_SELL,EXPERT_MAGIC2);
   
   if(buyjunjia!=0 || selljunjia!=0){
      return;
   }
//判定时间变动
   datetime time_change_tick_M5 = iTime(NULL,PERIOD_M5,0);
   if(time_change == time_change_tick_M5)
     {
      return;
     }
// Print("iOpen(Symbol(), PERIOD_CURRENT, 1)    ===== ",iOpen(Symbol(), PERIOD_CURRENT, 1));
   time_change = time_change_tick_M5;

   for(int i=20; i<120; i++)
     {
      close_h1 =iClose(Symbol(), PERIOD_H1, i);
      open_h1 =iOpen(Symbol(), PERIOD_H1, i);
      high_h1 =iHigh(Symbol(), PERIOD_H1, i);
      low_h1 =iLow(Symbol(), PERIOD_H1, i);
      
      if(close_h1-open_h1>10.22){
         sellPri = low_h1;
         buyPri = high_h1;
      }
      else{
         return;
      }
     }
   if(sellPriYS==sellPri){
      return;
   }
   
   if(iClose(Symbol(), PERIOD_M5, 1) > buyPri){
      buy(lotss);
   }
   if(iClose(Symbol(), PERIOD_M5, 1) < low_h1){
      sell(lotss);
   }
   
   sellPriYS = sellPri;
   buyPriYS = buyPri;
//wenzi(0,"ACCOUNT_BALANCE",0,280, 5,"blande "+DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2),"Trebuchet MS",8,clrWhiteSmoke,"",0);
//wenzi(0,"ACCOUNT_EQUITY",0,390, 5,"equity "+DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2),"Trebuchet MS",8,clrWhiteSmoke,"",0);
//wenzi(0,"ACCOUNT_PROFIT",0,500, 5,"profit "+DoubleToString(AccountInfoDouble(ACCOUNT_PROFIT),2),"Trebuchet MS",8,clrWhiteSmoke,"",0);
// 余额
   balance_curr = AccountInfoDouble(ACCOUNT_BALANCE);
// 净值
   equity_curr = AccountInfoDouble(ACCOUNT_EQUITY);


   


   /*
      if(iClose(Symbol(), PERIOD_H1, 1)-iOpen(Symbol(), PERIOD_H1, 1) > 21.11)
        {
         buy(trade_lot);

        }
      if(iOpen(Symbol(), PERIOD_H1, 1) - iClose(Symbol(), PERIOD_H1, 1)> 21.11)
        {
         sell(trade_lot);

        }
   */


   /*
      for(int i=0; i<5; i++)
        {
         index_close_arr_1h[i] = iClose(Symbol(), PERIOD_H1, i);
         index_open_arr_1h[i] = iOpen(Symbol(), PERIOD_H1, i);
         index_high_arr_1h[i] = iHigh(Symbol(), PERIOD_H1, i);
         index_low_arr_1h[i] = iLow(Symbol(), PERIOD_H1, i);
        }

      for(int i=0; i<8; i++)
        {
         index_close_arr_15[i] = iClose(Symbol(), PERIOD_M15, i);
         index_open_arr_15[i] = iOpen(Symbol(), PERIOD_M15, i);
         index_high_arr_15[i] = iHigh(Symbol(), PERIOD_M15, i);
         index_low_arr_15[i] = iLow(Symbol(), PERIOD_M15, i);

        }
      */
  }

//+------------------------------------------------------------------+
void OnTrade()
  {

  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
