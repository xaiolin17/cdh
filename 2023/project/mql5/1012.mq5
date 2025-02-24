//+------------------------------------------------------------------+
//|                                                     .mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <GetAllData\StructAll.mqh>
#include <GetAllData\DataSaveAll.mqh>
#include <GetAllData\CurrentAssignmentStruct.mqh>
#include <GetAllData\AssignmentCycle.mqh>
#include <Trade\Trade.mqh>
CTrade         m_trade;

double balance_curr;
double equity_curr;

uchar type_dire = 1;       //初始方向
double index_close_arr[5];
double index_open_arr[5];
double index_high_arr[5];
double index_low_arr[5];

double index_close_arr_15[8];
double index_open_arr_15[8];
double index_high_arr_15[8];
double index_low_arr_15[8];

double max_arr[];
double min_arr[];
int type_num = 0;

input double lotss=0.01;        // 交易量手数
input ulong  EXPERT_MAGIC=123456;  // EA幻数
//shift
int kdata_shift_num = 1;
//count
int copy_count_num =  20;

//交易量
double trade_lot;
//时间变化判断
datetime time_change = TimeCurrent();
datetime time_buysell = TimeCurrent();
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
//|                     买请求                                       |
//+------------------------------------------------------------------+
bool buy(double max_bar, double min_bar)
  {
   MqlTradeRequest request= {};
   MqlTradeResult  result= {};

   double atr_arr[];
   ATR(atr_arr,_Symbol,PERIOD_D1,5,copy_count_num);

//request.position =0;                // 关闭情况下的持仓单号
   request.action=TRADE_ACTION_PENDING;         // 设置开单
   request.symbol=Symbol();                      // 交易品种
   request.volume=trade_lot;                      // 交易量
   request.price=max_bar;
   request.sl= NormalizeDouble(min_bar+(max_bar-min_bar)*0.05,_Digits);
   request.tp= NormalizeDouble(max_bar+(max_bar-min_bar)*2,_Digits);
   request.deviation=0;                        // 可允许的价格偏差
   request.type=ORDER_TYPE_BUY_LIMIT;                // 订单类型
   request.type_filling=ORDER_FILLING_IOC;
   request.magic=EXPERT_MAGIC;            // 交易的幻数

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
bool sell(double sl_num,double tp_num)
  {
   MqlTradeRequest request= {};
   MqlTradeResult  result= {};

   double atr_arr[];
   ATR(atr_arr,_Symbol,PERIOD_D1,5,copy_count_num);

//request.position =0;                // 关闭情况下的持仓单号
   request.action=TRADE_ACTION_DEAL;         // 设置开单
   request.symbol=Symbol();                      // 交易品种
   request.volume=trade_lot;                      // 交易量
   request.price=SymbolInfoDouble(Symbol(),SYMBOL_BID);
   request.sl= NormalizeDouble(request.price + sl_num,_Digits);
   request.tp= NormalizeDouble(request.price - tp_num,_Digits);
   request.deviation=0;                        // 可允许的价格偏差
   request.type=ORDER_TYPE_SELL_LIMIT;                // 订单类型
   request.type_filling=ORDER_FILLING_IOC;
   request.magic=EXPERT_MAGIC;            // 交易的幻数

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
//+------------------------------------------------------------------+
void Close_WIN()
  {
//---
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
void Close_ALL()
  {
//---
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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {

   
//wenzi(0,"ACCOUNT_BALANCE",0,280, 5,"blande "+DoubleToString(AccountInfoDouble(ACCOUNT_BALANCE),2),"Trebuchet MS",8,clrWhiteSmoke,"",0);
//wenzi(0,"ACCOUNT_EQUITY",0,390, 5,"equity "+DoubleToString(AccountInfoDouble(ACCOUNT_EQUITY),2),"Trebuchet MS",8,clrWhiteSmoke,"",0);
//wenzi(0,"ACCOUNT_PROFIT",0,500, 5,"profit "+DoubleToString(AccountInfoDouble(ACCOUNT_PROFIT),2),"Trebuchet MS",8,clrWhiteSmoke,"",0);
   balance_curr = AccountInfoDouble(ACCOUNT_BALANCE);
   equity_curr = AccountInfoDouble(ACCOUNT_EQUITY);


   for(int i=0; i<5; i++)
     {
      index_close_arr[i] = iClose(Symbol(), PERIOD_H1, i);
      index_open_arr[i] = iOpen(Symbol(), PERIOD_H1, i);
      index_high_arr[i] = iHigh(Symbol(), PERIOD_H1, i);
      index_low_arr[i] = iLow(Symbol(), PERIOD_H1, i);
     }

   for(int i=0; i<8; i++)
     {
      index_close_arr_15[i] = iClose(Symbol(), PERIOD_M15, i);
      index_open_arr_15[i] = iOpen(Symbol(), PERIOD_M15, i);
      index_high_arr_15[i] = iHigh(Symbol(), PERIOD_M15, i);
      index_low_arr_15[i] = iLow(Symbol(), PERIOD_M15, i);

     }
   double max_bar = 0;
   int min_num = ArrayMinimum(index_close_arr);
   double min_bar = index_close_arr[min_num];

   for(int i=min_num; i<8; i++)
     {
      //max_bar = index_open_arr[ArrayMaximum(index_open_arr)];
      //min_bar = index_close_arr[ArrayMinimum(index_close_arr)];
      if(index_open_arr_15[i] - index_close_arr_15[i] < 0)
        {
         max_bar = index_high_arr_15[i];
        }

      else
        {
         type_num = type_num + 1;
         if(type_num>1)
           {
            break;
           }

        }

      if(index_close_arr_15[0]>max_bar)
        {

         if(max_bar == 0)
           {
            return;
           }
         else
           {
            buy(max_bar,min_bar);
           }

        }

     }
}

//+------------------------------------------------------------------+
   void OnTrade()
     {

     }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
