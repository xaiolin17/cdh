//+------------------------------------------------------------------+
//|                                              AssignmentCycle.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#include <GetAllData\StructAll.mqh>
#include <GetAllData\technicalIndexAll.mqh>
#include <GetAllData\IndexType.mqh>

//---统一对结构体进行赋值

//+------------------------------------------------------------------+
//|        保存数据到结构体数组                                      |
//+------------------------------------------------------------------+
bool DepositCycle(ENUM_TIMEFRAMES timeframe_currently,int kdata_shift,int count_num,double history_min,double history_max,double &high_history[],double &low_history[],CycleData &Cdata[])
  {

//---保存K线数据
   CycleData currentCandle;
   
   currentCandle.volume = iVolume(Symbol(), timeframe_currently, kdata_shift);
   
   double close_ = iClose(Symbol(), timeframe_currently, kdata_shift);
   double close_1 = iClose(Symbol(), timeframe_currently, kdata_shift+1);
   double close_2 = iClose(Symbol(), timeframe_currently, kdata_shift+2);
   double close_3 = iClose(Symbol(), timeframe_currently, kdata_shift+3);
   double close_4 = iClose(Symbol(), timeframe_currently, kdata_shift+4);
   double close_5 = iClose(Symbol(), timeframe_currently, kdata_shift+5);
   double close_6 = iClose(Symbol(), timeframe_currently, kdata_shift+6);
   double close_7 = iClose(Symbol(), timeframe_currently, kdata_shift+7);
   double close_8 = iClose(Symbol(), timeframe_currently, kdata_shift+8);
   double close_9 = iClose(Symbol(), timeframe_currently, kdata_shift+9);
   double close_10 = iClose(Symbol(), timeframe_currently, kdata_shift+10);
   
   double open_ = iOpen(Symbol(), timeframe_currently, kdata_shift);
   double open_1 = iOpen(Symbol(), timeframe_currently, kdata_shift+1);
   double open_2 = iOpen(Symbol(), timeframe_currently, kdata_shift+2);
   double open_3 = iOpen(Symbol(), timeframe_currently, kdata_shift+3);
   double open_4 = iOpen(Symbol(), timeframe_currently, kdata_shift+4);
   double open_5 = iOpen(Symbol(), timeframe_currently, kdata_shift+5);
   double open_6 = iOpen(Symbol(), timeframe_currently, kdata_shift+6);
   double open_7 = iOpen(Symbol(), timeframe_currently, kdata_shift+7);
   double open_8 = iOpen(Symbol(), timeframe_currently, kdata_shift+8);
   double open_9 = iOpen(Symbol(), timeframe_currently, kdata_shift+9);
   double open_10 = iOpen(Symbol(), timeframe_currently, kdata_shift+10);
   
   double high_ = iHigh(Symbol(), timeframe_currently, kdata_shift);
   double high_1 = iHigh(Symbol(), timeframe_currently, kdata_shift+1);
   double high_2 = iHigh(Symbol(), timeframe_currently, kdata_shift+2);
   double high_3 = iHigh(Symbol(), timeframe_currently, kdata_shift+3);
   double high_4 = iHigh(Symbol(), timeframe_currently, kdata_shift+4);
   double high_5 = iHigh(Symbol(), timeframe_currently, kdata_shift+5);
   double high_6 = iHigh(Symbol(), timeframe_currently, kdata_shift+6);
   double high_7 = iHigh(Symbol(), timeframe_currently, kdata_shift+7);
   double high_8 = iHigh(Symbol(), timeframe_currently, kdata_shift+8);
   double high_9 = iHigh(Symbol(), timeframe_currently, kdata_shift+9);
   double high_10 = iHigh(Symbol(), timeframe_currently, kdata_shift+10);
   
   double low_ = iLow(Symbol(), timeframe_currently, kdata_shift);
   double low_1 = iLow(Symbol(), timeframe_currently, kdata_shift+1);
   double low_2 = iLow(Symbol(), timeframe_currently, kdata_shift+2);
   double low_3 = iLow(Symbol(), timeframe_currently, kdata_shift+3);
   double low_4 = iLow(Symbol(), timeframe_currently, kdata_shift+4);
   double low_5 = iLow(Symbol(), timeframe_currently, kdata_shift+5);
   double low_6 = iLow(Symbol(), timeframe_currently, kdata_shift+6);
   double low_7 = iLow(Symbol(), timeframe_currently, kdata_shift+7);
   double low_8 = iLow(Symbol(), timeframe_currently, kdata_shift+8);
   double low_9 = iLow(Symbol(), timeframe_currently, kdata_shift+9);
   double low_10 = iLow(Symbol(), timeframe_currently, kdata_shift+10);
   
   
   //处于历史的区间位置
   if(low_ < history_min)
     {
      history_min = low_;
     }
   if(high_ > history_max)
     {
      history_max = high_;
     }
   currentCandle.his_interval = (close_ - history_min)/(history_max - history_min);

//时间区域位置情况 动态数组
   ArrayResize(high_history, ArraySize(high_history) + 1);
   high_history[ArraySize(high_history) - 1] = high_;
   ArrayResize(low_history, ArraySize(low_history) + 1);
   low_history[ArraySize(low_history) - 1] = low_;
   
   //10日内位置
   int index_max;
   int index_min;
   if(ArraySize(high_history)>10)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-10,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-10,ArraySize(low_history));
     }
   else
     {
      index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   currentCandle.interval_10 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);
//20日内位置
   if(ArraySize(high_history)>20)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-20,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-20,ArraySize(low_history));
     }
   else
     {
      index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   currentCandle.interval_20 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);
//30日内位置
   if(ArraySize(high_history)>30)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-30,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-30,ArraySize(low_history));
     }
   else
     {
      int index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      int index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   currentCandle.interval_30 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);
   
//--------------------------------------------------------------指标数据-------------------------------------------------------------------------------------------
   Print("计算指标数据 ",timeframe_currently);
//--- 计算ATR
   double atr5_arr[];
   double atr10_arr[];
   ATR(atr5_arr,_Symbol,timeframe_currently,5,count_num);
   ATR(atr10_arr,_Symbol,timeframe_currently,10,count_num);

   currentCandle.atr5 = atr5_arr[kdata_shift];
   currentCandle.atr10 = atr10_arr[kdata_shift];

   currentCandle.atr5_change1 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+1])/atr5_arr[kdata_shift+1])*100;     //ATR变化率
   currentCandle.atr5_change2 = ((atr5_arr[kdata_shift+1] - atr5_arr[kdata_shift+2])/atr5_arr[kdata_shift+2])*100;
   currentCandle.atr5_change3 = ((atr5_arr[kdata_shift+2] - atr5_arr[kdata_shift+3])/atr5_arr[kdata_shift+3])*100;
   currentCandle.atr5_change4 = ((atr5_arr[kdata_shift+3] - atr5_arr[kdata_shift+4])/atr5_arr[kdata_shift+4])*100;
   currentCandle.atr5_change5 = ((atr5_arr[kdata_shift+4] - atr5_arr[kdata_shift+5])/atr5_arr[kdata_shift+5])*100;
   currentCandle.atr5_change6 = ((atr5_arr[kdata_shift+5] - atr5_arr[kdata_shift+6])/atr5_arr[kdata_shift+6])*100;
   currentCandle.atr5_change7 = ((atr5_arr[kdata_shift+6] - atr5_arr[kdata_shift+7])/atr5_arr[kdata_shift+7])*100;
   currentCandle.atr5_change8 = ((atr5_arr[kdata_shift+7] - atr5_arr[kdata_shift+8])/atr5_arr[kdata_shift+8])*100;
   currentCandle.atr5_change9 = ((atr5_arr[kdata_shift+8] - atr5_arr[kdata_shift+9])/atr5_arr[kdata_shift+9])*100;
   currentCandle.atr5_change10 = ((atr5_arr[kdata_shift+9] - atr5_arr[kdata_shift+10])/atr5_arr[kdata_shift+10])*100;

   currentCandle.atr5_current_change1 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+1])/atr5_arr[kdata_shift+1])*100;
   currentCandle.atr5_current_change2 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+2])/atr5_arr[kdata_shift+2])*100;
   currentCandle.atr5_current_change3 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+3])/atr5_arr[kdata_shift+3])*100;
   currentCandle.atr5_current_change4 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+4])/atr5_arr[kdata_shift+4])*100;
   currentCandle.atr5_current_change5 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+5])/atr5_arr[kdata_shift+5])*100;
   currentCandle.atr5_current_change6 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+6])/atr5_arr[kdata_shift+6])*100;
   currentCandle.atr5_current_change7 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+7])/atr5_arr[kdata_shift+7])*100;
   currentCandle.atr5_current_change8 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+8])/atr5_arr[kdata_shift+8])*100;
   currentCandle.atr5_current_change9 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+9])/atr5_arr[kdata_shift+9])*100;
   currentCandle.atr5_current_change10 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+10])/atr5_arr[kdata_shift+10])*100;

   currentCandle.atr10_change1 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+1])/atr10_arr[kdata_shift+1])*100;
   currentCandle.atr10_change2 = ((atr10_arr[kdata_shift+1] - atr10_arr[kdata_shift+2])/atr10_arr[kdata_shift+2])*100;
   currentCandle.atr10_change3 = ((atr10_arr[kdata_shift+2] - atr10_arr[kdata_shift+3])/atr10_arr[kdata_shift+3])*100;
   currentCandle.atr10_change4 = ((atr10_arr[kdata_shift+3] - atr10_arr[kdata_shift+4])/atr10_arr[kdata_shift+4])*100;
   currentCandle.atr10_change5 = ((atr10_arr[kdata_shift+4] - atr10_arr[kdata_shift+5])/atr10_arr[kdata_shift+5])*100;
   currentCandle.atr10_change6 = ((atr10_arr[kdata_shift+5] - atr10_arr[kdata_shift+6])/atr10_arr[kdata_shift+6])*100;
   currentCandle.atr10_change7 = ((atr10_arr[kdata_shift+6] - atr10_arr[kdata_shift+7])/atr10_arr[kdata_shift+7])*100;
   currentCandle.atr10_change8 = ((atr10_arr[kdata_shift+7] - atr10_arr[kdata_shift+8])/atr10_arr[kdata_shift+8])*100;
   currentCandle.atr10_change9 = ((atr10_arr[kdata_shift+8] - atr10_arr[kdata_shift+9])/atr10_arr[kdata_shift+9])*100;
   currentCandle.atr10_change10 = ((atr10_arr[kdata_shift+9] - atr10_arr[kdata_shift+10])/atr10_arr[kdata_shift+10])*100;

   currentCandle.atr10_current_change1 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+1])/atr10_arr[kdata_shift+1])*100;
   currentCandle.atr10_current_change2 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+2])/atr10_arr[kdata_shift+2])*100;
   currentCandle.atr10_current_change3 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+3])/atr10_arr[kdata_shift+3])*100;
   currentCandle.atr10_current_change4 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+4])/atr10_arr[kdata_shift+4])*100;
   currentCandle.atr10_current_change5 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+5])/atr10_arr[kdata_shift+5])*100;
   currentCandle.atr10_current_change6 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+6])/atr10_arr[kdata_shift+6])*100;
   currentCandle.atr10_current_change7 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+7])/atr10_arr[kdata_shift+7])*100;
   currentCandle.atr10_current_change8 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+8])/atr10_arr[kdata_shift+8])*100;
   currentCandle.atr10_current_change9 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+9])/atr10_arr[kdata_shift+9])*100;
   currentCandle.atr10_current_change10 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+10])/atr10_arr[kdata_shift+10])*100;
   
   
   currentCandle.atr5_changeValue1 = atr5_arr[kdata_shift] - atr5_arr[kdata_shift+1];     //ATR变化值
   currentCandle.atr5_changeValue2 = atr5_arr[kdata_shift+1] - atr5_arr[kdata_shift+2];
   currentCandle.atr5_changeValue3 = atr5_arr[kdata_shift+2] - atr5_arr[kdata_shift+3];
   currentCandle.atr5_changeValue4 = atr5_arr[kdata_shift+3] - atr5_arr[kdata_shift+4];
   currentCandle.atr5_changeValue5 = atr5_arr[kdata_shift+4] - atr5_arr[kdata_shift+5];
   currentCandle.atr5_changeValue6 = atr5_arr[kdata_shift+5] - atr5_arr[kdata_shift+6];
   currentCandle.atr5_changeValue7 = atr5_arr[kdata_shift+6] - atr5_arr[kdata_shift+7];
   currentCandle.atr5_changeValue8 = atr5_arr[kdata_shift+7] - atr5_arr[kdata_shift+8];
   currentCandle.atr5_changeValue9 = atr5_arr[kdata_shift+8] - atr5_arr[kdata_shift+9];
   currentCandle.atr5_changeValue10 = atr5_arr[kdata_shift+9] - atr5_arr[kdata_shift+10];
   
   currentCandle.atr10_changeValue1 = atr10_arr[kdata_shift] - atr10_arr[kdata_shift+1];     //ATR变化值
   currentCandle.atr10_changeValue2 = atr10_arr[kdata_shift+1] - atr10_arr[kdata_shift+2];
   currentCandle.atr10_changeValue3 = atr10_arr[kdata_shift+2] - atr10_arr[kdata_shift+3];
   currentCandle.atr10_changeValue4 = atr10_arr[kdata_shift+3] - atr10_arr[kdata_shift+4];
   currentCandle.atr10_changeValue5 = atr10_arr[kdata_shift+4] - atr10_arr[kdata_shift+5];
   currentCandle.atr10_changeValue6 = atr10_arr[kdata_shift+5] - atr10_arr[kdata_shift+6];
   currentCandle.atr10_changeValue7 = atr10_arr[kdata_shift+6] - atr10_arr[kdata_shift+7];
   currentCandle.atr10_changeValue8 = atr10_arr[kdata_shift+7] - atr10_arr[kdata_shift+8];
   currentCandle.atr10_changeValue9 = atr10_arr[kdata_shift+8] - atr10_arr[kdata_shift+9];
   currentCandle.atr10_changeValue10 = atr10_arr[kdata_shift+9] - atr10_arr[kdata_shift+10];
   
//ArrayPrint(atr5_arr);
//ArrayPrint(atr10_arr);
//----------------------------------------ATR反映情况类型判定----------------------------------------
   currentCandle.atr_5_10_type = TypeATR(atr5_arr,atr10_arr,kdata_shift);
   
//macd
   double macd_arr[];
   MACD(macd_arr,_Symbol,timeframe_currently,12,26,9,PRICE_CLOSE,count_num);

   currentCandle.macd = macd_arr[kdata_shift];

   currentCandle.macd_change1 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+1])/(MathAbs(macd_arr[kdata_shift+1])+1E-15))*100;     //macd变化率
   currentCandle.macd_change2 = ((macd_arr[kdata_shift+1] - macd_arr[kdata_shift+2])/(MathAbs(macd_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.macd_change3 = ((macd_arr[kdata_shift+2] - macd_arr[kdata_shift+3])/(MathAbs(macd_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.macd_change4 = ((macd_arr[kdata_shift+3] - macd_arr[kdata_shift+4])/(MathAbs(macd_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.macd_change5 = ((macd_arr[kdata_shift+4] - macd_arr[kdata_shift+5])/(MathAbs(macd_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.macd_change6 = ((macd_arr[kdata_shift+5] - macd_arr[kdata_shift+6])/(MathAbs(macd_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.macd_change7 = ((macd_arr[kdata_shift+6] - macd_arr[kdata_shift+7])/(MathAbs(macd_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.macd_change8 = ((macd_arr[kdata_shift+7] - macd_arr[kdata_shift+8])/(MathAbs(macd_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.macd_change9 = ((macd_arr[kdata_shift+8] - macd_arr[kdata_shift+9])/(MathAbs(macd_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.macd_change10 = ((macd_arr[kdata_shift+9] - macd_arr[kdata_shift+10])/(MathAbs(macd_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.macd_current_change1 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+1])/(MathAbs(macd_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.macd_current_change2 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+2])/(MathAbs(macd_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.macd_current_change3 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+3])/(MathAbs(macd_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.macd_current_change4 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+4])/(MathAbs(macd_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.macd_current_change5 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+5])/(MathAbs(macd_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.macd_current_change6 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+6])/(MathAbs(macd_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.macd_current_change7 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+7])/(MathAbs(macd_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.macd_current_change8 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+8])/(MathAbs(macd_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.macd_current_change9 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+9])/(MathAbs(macd_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.macd_current_change10 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+10])/(MathAbs(macd_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.macd_changeValue1 = macd_arr[kdata_shift] - macd_arr[kdata_shift+1];      //macd变化值
   currentCandle.macd_changeValue2 = macd_arr[kdata_shift+1] - macd_arr[kdata_shift+2];
   currentCandle.macd_changeValue3 = macd_arr[kdata_shift+2] - macd_arr[kdata_shift+3];
   currentCandle.macd_changeValue4 = macd_arr[kdata_shift+3] - macd_arr[kdata_shift+4];
   currentCandle.macd_changeValue5 = macd_arr[kdata_shift+4] - macd_arr[kdata_shift+5];
   currentCandle.macd_changeValue6 = macd_arr[kdata_shift+5] - macd_arr[kdata_shift+6];
   currentCandle.macd_changeValue7 = macd_arr[kdata_shift+6] - macd_arr[kdata_shift+7];
   currentCandle.macd_changeValue8 = macd_arr[kdata_shift+7] - macd_arr[kdata_shift+8];
   currentCandle.macd_changeValue9 = macd_arr[kdata_shift+8] - macd_arr[kdata_shift+9];
   currentCandle.macd_changeValue10 = macd_arr[kdata_shift+9] - macd_arr[kdata_shift+10];
   
//ArrayPrint(macd_arr);
//----------------------------------------MACD反映情况类型判定----------------------------------------
   currentCandle.macd_type = TypeMACD(macd_arr,kdata_shift);

//SMA
   double sma5_arr[];
   double sma10_arr[];
   MA(sma5_arr,_Symbol,timeframe_currently,5,0,MODE_SMA,PRICE_CLOSE,count_num);
   MA(sma10_arr,_Symbol,timeframe_currently,10,0,MODE_SMA,PRICE_CLOSE,count_num);

   currentCandle.sma5 = sma5_arr[kdata_shift];
   currentCandle.sma10 = sma10_arr[kdata_shift];

   currentCandle.sma5_change1 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+1])/sma5_arr[kdata_shift+1])*100;     //sma变化率
   currentCandle.sma5_change2 = ((sma5_arr[kdata_shift+1] - sma5_arr[kdata_shift+2])/sma5_arr[kdata_shift+2])*100;
   currentCandle.sma5_change3 = ((sma5_arr[kdata_shift+2] - sma5_arr[kdata_shift+3])/sma5_arr[kdata_shift+3])*100;
   currentCandle.sma5_change4 = ((sma5_arr[kdata_shift+3] - sma5_arr[kdata_shift+4])/sma5_arr[kdata_shift+4])*100;
   currentCandle.sma5_change5 = ((sma5_arr[kdata_shift+4] - sma5_arr[kdata_shift+5])/sma5_arr[kdata_shift+5])*100;
   currentCandle.sma5_change6 = ((sma5_arr[kdata_shift+5] - sma5_arr[kdata_shift+6])/sma5_arr[kdata_shift+6])*100;
   currentCandle.sma5_change7 = ((sma5_arr[kdata_shift+6] - sma5_arr[kdata_shift+7])/sma5_arr[kdata_shift+7])*100;
   currentCandle.sma5_change8 = ((sma5_arr[kdata_shift+7] - sma5_arr[kdata_shift+8])/sma5_arr[kdata_shift+8])*100;
   currentCandle.sma5_change9 = ((sma5_arr[kdata_shift+8] - sma5_arr[kdata_shift+9])/sma5_arr[kdata_shift+9])*100;
   currentCandle.sma5_change10 = ((sma5_arr[kdata_shift+9] - sma5_arr[kdata_shift+10])/sma5_arr[kdata_shift+10])*100;

   currentCandle.sma5_current_change1 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+1])/sma5_arr[kdata_shift+1])*100;
   currentCandle.sma5_current_change2 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+2])/sma5_arr[kdata_shift+2])*100;
   currentCandle.sma5_current_change3 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+3])/sma5_arr[kdata_shift+3])*100;
   currentCandle.sma5_current_change4 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+4])/sma5_arr[kdata_shift+4])*100;
   currentCandle.sma5_current_change5 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+5])/sma5_arr[kdata_shift+5])*100;
   currentCandle.sma5_current_change6 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+6])/sma5_arr[kdata_shift+6])*100;
   currentCandle.sma5_current_change7 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+7])/sma5_arr[kdata_shift+7])*100;
   currentCandle.sma5_current_change8 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+8])/sma5_arr[kdata_shift+8])*100;
   currentCandle.sma5_current_change9 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+9])/sma5_arr[kdata_shift+9])*100;
   currentCandle.sma5_current_change10 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+10])/sma5_arr[kdata_shift+10])*100;

   currentCandle.sma10_change1 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+1])/sma10_arr[kdata_shift+1])*100;
   currentCandle.sma10_change2 = ((sma10_arr[kdata_shift+1] - sma10_arr[kdata_shift+2])/sma10_arr[kdata_shift+2])*100;
   currentCandle.sma10_change3 = ((sma10_arr[kdata_shift+2] - sma10_arr[kdata_shift+3])/sma10_arr[kdata_shift+3])*100;
   currentCandle.sma10_change4 = ((sma10_arr[kdata_shift+3] - sma10_arr[kdata_shift+4])/sma10_arr[kdata_shift+4])*100;
   currentCandle.sma10_change5 = ((sma10_arr[kdata_shift+4] - sma10_arr[kdata_shift+5])/sma10_arr[kdata_shift+5])*100;
   currentCandle.sma10_change6 = ((sma10_arr[kdata_shift+5] - sma10_arr[kdata_shift+6])/sma10_arr[kdata_shift+6])*100;
   currentCandle.sma10_change7 = ((sma10_arr[kdata_shift+6] - sma10_arr[kdata_shift+7])/sma10_arr[kdata_shift+7])*100;
   currentCandle.sma10_change8 = ((sma10_arr[kdata_shift+7] - sma10_arr[kdata_shift+8])/sma10_arr[kdata_shift+8])*100;
   currentCandle.sma10_change9 = ((sma10_arr[kdata_shift+8] - sma10_arr[kdata_shift+9])/sma10_arr[kdata_shift+9])*100;
   currentCandle.sma10_change10 = ((sma10_arr[kdata_shift+9] - sma10_arr[kdata_shift+10])/sma10_arr[kdata_shift+10])*100;

   currentCandle.sma10_current_change1 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+1])/sma10_arr[kdata_shift+1])*100;
   currentCandle.sma10_current_change2 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+2])/sma10_arr[kdata_shift+2])*100;
   currentCandle.sma10_current_change3 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+3])/sma10_arr[kdata_shift+3])*100;
   currentCandle.sma10_current_change4 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+4])/sma10_arr[kdata_shift+4])*100;
   currentCandle.sma10_current_change5 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+5])/sma10_arr[kdata_shift+5])*100;
   currentCandle.sma10_current_change6 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+6])/sma10_arr[kdata_shift+6])*100;
   currentCandle.sma10_current_change7 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+7])/sma10_arr[kdata_shift+7])*100;
   currentCandle.sma10_current_change8 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+8])/sma10_arr[kdata_shift+8])*100;
   currentCandle.sma10_current_change9 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+9])/sma10_arr[kdata_shift+9])*100;
   currentCandle.sma10_current_change10 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+10])/sma10_arr[kdata_shift+10])*100;

   currentCandle.sma5_changeValue1 = sma5_arr[kdata_shift] - sma5_arr[kdata_shift+1];     //sma变化值
   currentCandle.sma5_changeValue2 = sma5_arr[kdata_shift+1] - sma5_arr[kdata_shift+2];
   currentCandle.sma5_changeValue3 = sma5_arr[kdata_shift+2] - sma5_arr[kdata_shift+3];
   currentCandle.sma5_changeValue4 = sma5_arr[kdata_shift+3] - sma5_arr[kdata_shift+4];
   currentCandle.sma5_changeValue5 = sma5_arr[kdata_shift+4] - sma5_arr[kdata_shift+5];
   currentCandle.sma5_changeValue6 = sma5_arr[kdata_shift+5] - sma5_arr[kdata_shift+6];
   currentCandle.sma5_changeValue7 = sma5_arr[kdata_shift+6] - sma5_arr[kdata_shift+7];
   currentCandle.sma5_changeValue8 = sma5_arr[kdata_shift+7] - sma5_arr[kdata_shift+8];
   currentCandle.sma5_changeValue9 = sma5_arr[kdata_shift+8] - sma5_arr[kdata_shift+9];
   currentCandle.sma5_changeValue10 = sma5_arr[kdata_shift+9] - sma5_arr[kdata_shift+10];
   
   currentCandle.sma10_changeValue1 = sma10_arr[kdata_shift] - sma10_arr[kdata_shift+1];
   currentCandle.sma10_changeValue2 = sma10_arr[kdata_shift+1] - sma10_arr[kdata_shift+2];
   currentCandle.sma10_changeValue3 = sma10_arr[kdata_shift+2] - sma10_arr[kdata_shift+3];
   currentCandle.sma10_changeValue4 = sma10_arr[kdata_shift+3] - sma10_arr[kdata_shift+4];
   currentCandle.sma10_changeValue5 = sma10_arr[kdata_shift+4] - sma10_arr[kdata_shift+5];
   currentCandle.sma10_changeValue6 = sma10_arr[kdata_shift+5] - sma10_arr[kdata_shift+6];
   currentCandle.sma10_changeValue7 = sma10_arr[kdata_shift+6] - sma10_arr[kdata_shift+7];
   currentCandle.sma10_changeValue8 = sma10_arr[kdata_shift+7] - sma10_arr[kdata_shift+8];
   currentCandle.sma10_changeValue9 = sma10_arr[kdata_shift+8] - sma10_arr[kdata_shift+9];
   currentCandle.sma10_changeValue10 = sma10_arr[kdata_shift+9] - sma10_arr[kdata_shift+10];
   
//ArrayPrint(sma5_arr);
//ArrayPrint(sma10_arr);
//----------------------------------------SMA反映情况类型判定----------------------------------------
   currentCandle.sma_5_10_type = TypeSMA(sma5_arr, sma10_arr, close_, kdata_shift);

//EMA
   double ema5_arr[];
   double ema10_arr[];
   MA(ema5_arr,_Symbol,timeframe_currently,5,0,MODE_EMA,PRICE_CLOSE,count_num);
   MA(ema10_arr,_Symbol,timeframe_currently,10,0,MODE_EMA,PRICE_CLOSE,count_num);

   currentCandle.ema5 = ema5_arr[kdata_shift];
   currentCandle.ema10 = ema10_arr[kdata_shift];

   currentCandle.ema5_change1 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+1])/ema5_arr[kdata_shift+1])*100;     //ema变化率
   currentCandle.ema5_change2 = ((ema5_arr[kdata_shift+1] - ema5_arr[kdata_shift+2])/ema5_arr[kdata_shift+2])*100;
   currentCandle.ema5_change3 = ((ema5_arr[kdata_shift+2] - ema5_arr[kdata_shift+3])/ema5_arr[kdata_shift+3])*100;
   currentCandle.ema5_change4 = ((ema5_arr[kdata_shift+3] - ema5_arr[kdata_shift+4])/ema5_arr[kdata_shift+4])*100;
   currentCandle.ema5_change5 = ((ema5_arr[kdata_shift+4] - ema5_arr[kdata_shift+5])/ema5_arr[kdata_shift+5])*100;
   currentCandle.ema5_change6 = ((ema5_arr[kdata_shift+5] - ema5_arr[kdata_shift+6])/ema5_arr[kdata_shift+6])*100;
   currentCandle.ema5_change7 = ((ema5_arr[kdata_shift+6] - ema5_arr[kdata_shift+7])/ema5_arr[kdata_shift+7])*100;
   currentCandle.ema5_change8 = ((ema5_arr[kdata_shift+7] - ema5_arr[kdata_shift+8])/ema5_arr[kdata_shift+8])*100;
   currentCandle.ema5_change9 = ((ema5_arr[kdata_shift+8] - ema5_arr[kdata_shift+9])/ema5_arr[kdata_shift+9])*100;
   currentCandle.ema5_change10 = ((ema5_arr[kdata_shift+9] - ema5_arr[kdata_shift+10])/ema5_arr[kdata_shift+10])*100;

   currentCandle.ema5_current_change1 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+1])/ema5_arr[kdata_shift+1])*100;
   currentCandle.ema5_current_change2 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+2])/ema5_arr[kdata_shift+2])*100;
   currentCandle.ema5_current_change3 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+3])/ema5_arr[kdata_shift+3])*100;
   currentCandle.ema5_current_change4 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+4])/ema5_arr[kdata_shift+4])*100;
   currentCandle.ema5_current_change5 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+5])/ema5_arr[kdata_shift+5])*100;
   currentCandle.ema5_current_change6 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+6])/ema5_arr[kdata_shift+6])*100;
   currentCandle.ema5_current_change7 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+7])/ema5_arr[kdata_shift+7])*100;
   currentCandle.ema5_current_change8 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+8])/ema5_arr[kdata_shift+8])*100;
   currentCandle.ema5_current_change9 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+9])/ema5_arr[kdata_shift+9])*100;
   currentCandle.ema5_current_change10 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+10])/ema5_arr[kdata_shift+10])*100;

   currentCandle.ema10_change1 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+1])/ema10_arr[kdata_shift+1])*100;
   currentCandle.ema10_change2 = ((ema10_arr[kdata_shift+1] - ema10_arr[kdata_shift+2])/ema10_arr[kdata_shift+2])*100;
   currentCandle.ema10_change3 = ((ema10_arr[kdata_shift+2] - ema10_arr[kdata_shift+3])/ema10_arr[kdata_shift+3])*100;
   currentCandle.ema10_change4 = ((ema10_arr[kdata_shift+3] - ema10_arr[kdata_shift+4])/ema10_arr[kdata_shift+4])*100;
   currentCandle.ema10_change5 = ((ema10_arr[kdata_shift+4] - ema10_arr[kdata_shift+5])/ema10_arr[kdata_shift+5])*100;
   currentCandle.ema10_change6 = ((ema10_arr[kdata_shift+5] - ema10_arr[kdata_shift+6])/ema10_arr[kdata_shift+6])*100;
   currentCandle.ema10_change7 = ((ema10_arr[kdata_shift+6] - ema10_arr[kdata_shift+7])/ema10_arr[kdata_shift+7])*100;
   currentCandle.ema10_change8 = ((ema10_arr[kdata_shift+7] - ema10_arr[kdata_shift+8])/ema10_arr[kdata_shift+8])*100;
   currentCandle.ema10_change9 = ((ema10_arr[kdata_shift+8] - ema10_arr[kdata_shift+9])/ema10_arr[kdata_shift+9])*100;
   currentCandle.ema10_change10 = ((ema10_arr[kdata_shift+9] - ema10_arr[kdata_shift+10])/ema10_arr[kdata_shift+10])*100;

   currentCandle.ema10_current_change1 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+1])/ema10_arr[kdata_shift+1])*100;
   currentCandle.ema10_current_change2 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+2])/ema10_arr[kdata_shift+2])*100;
   currentCandle.ema10_current_change3 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+3])/ema10_arr[kdata_shift+3])*100;
   currentCandle.ema10_current_change4 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+4])/ema10_arr[kdata_shift+4])*100;
   currentCandle.ema10_current_change5 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+5])/ema10_arr[kdata_shift+5])*100;
   currentCandle.ema10_current_change6 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+6])/ema10_arr[kdata_shift+6])*100;
   currentCandle.ema10_current_change7 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+7])/ema10_arr[kdata_shift+7])*100;
   currentCandle.ema10_current_change8 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+8])/ema10_arr[kdata_shift+8])*100;
   currentCandle.ema10_current_change9 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+9])/ema10_arr[kdata_shift+9])*100;
   currentCandle.ema10_current_change10 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+10])/ema10_arr[kdata_shift+10])*100;

//ArrayPrint(ema5_arr);
//ArrayPrint(ema10_arr);
//----------------------------------------EMA反映情况类型判定----------------------------------------
   currentCandle.ema_5_10_type = TypeEMA(ema5_arr, ema10_arr, close_, kdata_shift);

//SMMA
   double smma5_arr[];
   double smma10_arr[];
   MA(smma5_arr,_Symbol,timeframe_currently,5,0,MODE_SMMA,PRICE_CLOSE,count_num);
   MA(smma10_arr,_Symbol,timeframe_currently,10,0,MODE_SMMA,PRICE_CLOSE,count_num);

   currentCandle.smma5 = smma5_arr[kdata_shift];
   currentCandle.smma10 = smma10_arr[kdata_shift];

   currentCandle.smma5_change1 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+1])/smma5_arr[kdata_shift+1])*100;     //smma变化率
   currentCandle.smma5_change2 = ((smma5_arr[kdata_shift+1] - smma5_arr[kdata_shift+2])/smma5_arr[kdata_shift+2])*100;
   currentCandle.smma5_change3 = ((smma5_arr[kdata_shift+2] - smma5_arr[kdata_shift+3])/smma5_arr[kdata_shift+3])*100;
   currentCandle.smma5_change4 = ((smma5_arr[kdata_shift+3] - smma5_arr[kdata_shift+4])/smma5_arr[kdata_shift+4])*100;
   currentCandle.smma5_change5 = ((smma5_arr[kdata_shift+4] - smma5_arr[kdata_shift+5])/smma5_arr[kdata_shift+5])*100;
   currentCandle.smma5_change6 = ((smma5_arr[kdata_shift+5] - smma5_arr[kdata_shift+6])/smma5_arr[kdata_shift+6])*100;
   currentCandle.smma5_change7 = ((smma5_arr[kdata_shift+6] - smma5_arr[kdata_shift+7])/smma5_arr[kdata_shift+7])*100;
   currentCandle.smma5_change8 = ((smma5_arr[kdata_shift+7] - smma5_arr[kdata_shift+8])/smma5_arr[kdata_shift+8])*100;
   currentCandle.smma5_change9 = ((smma5_arr[kdata_shift+8] - smma5_arr[kdata_shift+9])/smma5_arr[kdata_shift+9])*100;
   currentCandle.smma5_change10 = ((smma5_arr[kdata_shift+9] - smma5_arr[kdata_shift+10])/smma5_arr[kdata_shift+10])*100;

   currentCandle.smma5_current_change1 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+1])/smma5_arr[kdata_shift+1])*100;
   currentCandle.smma5_current_change2 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+2])/smma5_arr[kdata_shift+2])*100;
   currentCandle.smma5_current_change3 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+3])/smma5_arr[kdata_shift+3])*100;
   currentCandle.smma5_current_change4 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+4])/smma5_arr[kdata_shift+4])*100;
   currentCandle.smma5_current_change5 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+5])/smma5_arr[kdata_shift+5])*100;
   currentCandle.smma5_current_change6 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+6])/smma5_arr[kdata_shift+6])*100;
   currentCandle.smma5_current_change7 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+7])/smma5_arr[kdata_shift+7])*100;
   currentCandle.smma5_current_change8 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+8])/smma5_arr[kdata_shift+8])*100;
   currentCandle.smma5_current_change9 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+9])/smma5_arr[kdata_shift+9])*100;
   currentCandle.smma5_current_change10 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+10])/smma5_arr[kdata_shift+10])*100;

   currentCandle.smma10_change1 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+1])/smma10_arr[kdata_shift+1])*100;
   currentCandle.smma10_change2 = ((smma10_arr[kdata_shift+1] - smma10_arr[kdata_shift+2])/smma10_arr[kdata_shift+2])*100;
   currentCandle.smma10_change3 = ((smma10_arr[kdata_shift+2] - smma10_arr[kdata_shift+3])/smma10_arr[kdata_shift+3])*100;
   currentCandle.smma10_change4 = ((smma10_arr[kdata_shift+3] - smma10_arr[kdata_shift+4])/smma10_arr[kdata_shift+4])*100;
   currentCandle.smma10_change5 = ((smma10_arr[kdata_shift+4] - smma10_arr[kdata_shift+5])/smma10_arr[kdata_shift+5])*100;
   currentCandle.smma10_change6 = ((smma10_arr[kdata_shift+5] - smma10_arr[kdata_shift+6])/smma10_arr[kdata_shift+6])*100;
   currentCandle.smma10_change7 = ((smma10_arr[kdata_shift+6] - smma10_arr[kdata_shift+7])/smma10_arr[kdata_shift+7])*100;
   currentCandle.smma10_change8 = ((smma10_arr[kdata_shift+7] - smma10_arr[kdata_shift+8])/smma10_arr[kdata_shift+8])*100;
   currentCandle.smma10_change9 = ((smma10_arr[kdata_shift+8] - smma10_arr[kdata_shift+9])/smma10_arr[kdata_shift+9])*100;
   currentCandle.smma10_change10 = ((smma10_arr[kdata_shift+9] - smma10_arr[kdata_shift+10])/smma10_arr[kdata_shift+10])*100;

   currentCandle.smma10_current_change1 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+1])/smma10_arr[kdata_shift+1])*100;
   currentCandle.smma10_current_change2 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+2])/smma10_arr[kdata_shift+2])*100;
   currentCandle.smma10_current_change3 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+3])/smma10_arr[kdata_shift+3])*100;
   currentCandle.smma10_current_change4 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+4])/smma10_arr[kdata_shift+4])*100;
   currentCandle.smma10_current_change5 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+5])/smma10_arr[kdata_shift+5])*100;
   currentCandle.smma10_current_change6 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+6])/smma10_arr[kdata_shift+6])*100;
   currentCandle.smma10_current_change7 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+7])/smma10_arr[kdata_shift+7])*100;
   currentCandle.smma10_current_change8 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+8])/smma10_arr[kdata_shift+8])*100;
   currentCandle.smma10_current_change9 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+9])/smma10_arr[kdata_shift+9])*100;
   currentCandle.smma10_current_change10 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+10])/smma10_arr[kdata_shift+10])*100;

//ArrayPrint(smma5_arr);
//ArrayPrint(smma10_arr);
//----------------------------------------SMMA反映情况类型判定----------------------------------------
   currentCandle.smma_5_10_type = TypeSMMA(smma5_arr, smma10_arr, close_, kdata_shift);

//LWMA
   double lwma5_arr[];
   double lwma10_arr[];
   MA(lwma5_arr,_Symbol,timeframe_currently,5,0,MODE_LWMA,PRICE_CLOSE,count_num);
   MA(lwma10_arr,_Symbol,timeframe_currently,10,0,MODE_LWMA,PRICE_CLOSE,count_num);

   currentCandle.lwma5 = lwma5_arr[kdata_shift];
   currentCandle.lwma10 = lwma10_arr[kdata_shift];

   currentCandle.lwma5_change1 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+1])/lwma5_arr[kdata_shift+1])*100;     //lwma变化率
   currentCandle.lwma5_change2 = ((lwma5_arr[kdata_shift+1] - lwma5_arr[kdata_shift+2])/lwma5_arr[kdata_shift+2])*100;
   currentCandle.lwma5_change3 = ((lwma5_arr[kdata_shift+2] - lwma5_arr[kdata_shift+3])/lwma5_arr[kdata_shift+3])*100;
   currentCandle.lwma5_change4 = ((lwma5_arr[kdata_shift+3] - lwma5_arr[kdata_shift+4])/lwma5_arr[kdata_shift+4])*100;
   currentCandle.lwma5_change5 = ((lwma5_arr[kdata_shift+4] - lwma5_arr[kdata_shift+5])/lwma5_arr[kdata_shift+5])*100;
   currentCandle.lwma5_change6 = ((lwma5_arr[kdata_shift+5] - lwma5_arr[kdata_shift+6])/lwma5_arr[kdata_shift+6])*100;
   currentCandle.lwma5_change7 = ((lwma5_arr[kdata_shift+6] - lwma5_arr[kdata_shift+7])/lwma5_arr[kdata_shift+7])*100;
   currentCandle.lwma5_change8 = ((lwma5_arr[kdata_shift+7] - lwma5_arr[kdata_shift+8])/lwma5_arr[kdata_shift+8])*100;
   currentCandle.lwma5_change9 = ((lwma5_arr[kdata_shift+8] - lwma5_arr[kdata_shift+9])/lwma5_arr[kdata_shift+9])*100;
   currentCandle.lwma5_change10 = ((lwma5_arr[kdata_shift+9] - lwma5_arr[kdata_shift+10])/lwma5_arr[kdata_shift+10])*100;

   currentCandle.lwma5_current_change1 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+1])/lwma5_arr[kdata_shift+1])*100;
   currentCandle.lwma5_current_change2 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+2])/lwma5_arr[kdata_shift+2])*100;
   currentCandle.lwma5_current_change3 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+3])/lwma5_arr[kdata_shift+3])*100;
   currentCandle.lwma5_current_change4 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+4])/lwma5_arr[kdata_shift+4])*100;
   currentCandle.lwma5_current_change5 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+5])/lwma5_arr[kdata_shift+5])*100;
   currentCandle.lwma5_current_change6 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+6])/lwma5_arr[kdata_shift+6])*100;
   currentCandle.lwma5_current_change7 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+7])/lwma5_arr[kdata_shift+7])*100;
   currentCandle.lwma5_current_change8 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+8])/lwma5_arr[kdata_shift+8])*100;
   currentCandle.lwma5_current_change9 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+9])/lwma5_arr[kdata_shift+9])*100;
   currentCandle.lwma5_current_change10 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+10])/lwma5_arr[kdata_shift+10])*100;

   currentCandle.lwma10_change1 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+1])/lwma10_arr[kdata_shift+1])*100;
   currentCandle.lwma10_change2 = ((lwma10_arr[kdata_shift+1] - lwma10_arr[kdata_shift+2])/lwma10_arr[kdata_shift+2])*100;
   currentCandle.lwma10_change3 = ((lwma10_arr[kdata_shift+2] - lwma10_arr[kdata_shift+3])/lwma10_arr[kdata_shift+3])*100;
   currentCandle.lwma10_change4 = ((lwma10_arr[kdata_shift+3] - lwma10_arr[kdata_shift+4])/lwma10_arr[kdata_shift+4])*100;
   currentCandle.lwma10_change5 = ((lwma10_arr[kdata_shift+4] - lwma10_arr[kdata_shift+5])/lwma10_arr[kdata_shift+5])*100;
   currentCandle.lwma10_change6 = ((lwma10_arr[kdata_shift+5] - lwma10_arr[kdata_shift+6])/lwma10_arr[kdata_shift+6])*100;
   currentCandle.lwma10_change7 = ((lwma10_arr[kdata_shift+6] - lwma10_arr[kdata_shift+7])/lwma10_arr[kdata_shift+7])*100;
   currentCandle.lwma10_change8 = ((lwma10_arr[kdata_shift+7] - lwma10_arr[kdata_shift+8])/lwma10_arr[kdata_shift+8])*100;
   currentCandle.lwma10_change9 = ((lwma10_arr[kdata_shift+8] - lwma10_arr[kdata_shift+9])/lwma10_arr[kdata_shift+9])*100;
   currentCandle.lwma10_change10 = ((lwma10_arr[kdata_shift+9] - lwma10_arr[kdata_shift+10])/lwma10_arr[kdata_shift+10])*100;

   currentCandle.lwma10_current_change1 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+1])/lwma10_arr[kdata_shift+1])*100;
   currentCandle.lwma10_current_change2 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+2])/lwma10_arr[kdata_shift+2])*100;
   currentCandle.lwma10_current_change3 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+3])/lwma10_arr[kdata_shift+3])*100;
   currentCandle.lwma10_current_change4 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+4])/lwma10_arr[kdata_shift+4])*100;
   currentCandle.lwma10_current_change5 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+5])/lwma10_arr[kdata_shift+5])*100;
   currentCandle.lwma10_current_change6 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+6])/lwma10_arr[kdata_shift+6])*100;
   currentCandle.lwma10_current_change7 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+7])/lwma10_arr[kdata_shift+7])*100;
   currentCandle.lwma10_current_change8 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+8])/lwma10_arr[kdata_shift+8])*100;
   currentCandle.lwma10_current_change9 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+9])/lwma10_arr[kdata_shift+9])*100;
   currentCandle.lwma10_current_change10 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+10])/lwma10_arr[kdata_shift+10])*100;

//ArrayPrint(lwma5_arr);
//ArrayPrint(lwma10_arr);
//----------------------------------------LWMA反映情况类型判定----------------------------------------
   currentCandle.lwma_5_10_type = TypeLWMA(lwma5_arr, lwma10_arr, close_, kdata_shift);

//RSI
   double rsi5_arr[];
   double rsi14_arr[];
   RSI(rsi5_arr,_Symbol,timeframe_currently,5,PRICE_CLOSE,count_num);
   RSI(rsi14_arr,_Symbol,timeframe_currently,14,PRICE_CLOSE,count_num);

   currentCandle.rsi5 = rsi5_arr[kdata_shift];
   currentCandle.rsi14 = rsi14_arr[kdata_shift];

   currentCandle.rsi5_change1 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+1])/(rsi5_arr[kdata_shift+1]+1E-15))*100;     //rsi变化率
   currentCandle.rsi5_change2 = ((rsi5_arr[kdata_shift+1] - rsi5_arr[kdata_shift+2])/(rsi5_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.rsi5_change3 = ((rsi5_arr[kdata_shift+2] - rsi5_arr[kdata_shift+3])/(rsi5_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.rsi5_change4 = ((rsi5_arr[kdata_shift+3] - rsi5_arr[kdata_shift+4])/(rsi5_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.rsi5_change5 = ((rsi5_arr[kdata_shift+4] - rsi5_arr[kdata_shift+5])/(rsi5_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.rsi5_change6 = ((rsi5_arr[kdata_shift+5] - rsi5_arr[kdata_shift+6])/(rsi5_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.rsi5_change7 = ((rsi5_arr[kdata_shift+6] - rsi5_arr[kdata_shift+7])/(rsi5_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.rsi5_change8 = ((rsi5_arr[kdata_shift+7] - rsi5_arr[kdata_shift+8])/(rsi5_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.rsi5_change9 = ((rsi5_arr[kdata_shift+8] - rsi5_arr[kdata_shift+9])/(rsi5_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.rsi5_change10 = ((rsi5_arr[kdata_shift+9] - rsi5_arr[kdata_shift+10])/(rsi5_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.rsi5_current_change1 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+1])/(rsi5_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.rsi5_current_change2 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+2])/(rsi5_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.rsi5_current_change3 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+3])/(rsi5_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.rsi5_current_change4 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+4])/(rsi5_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.rsi5_current_change5 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+5])/(rsi5_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.rsi5_current_change6 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+6])/(rsi5_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.rsi5_current_change7 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+7])/(rsi5_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.rsi5_current_change8 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+8])/(rsi5_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.rsi5_current_change9 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+9])/(rsi5_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.rsi5_current_change10 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+10])/(rsi5_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.rsi14_change1 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+1])/(rsi14_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.rsi14_change2 = ((rsi14_arr[kdata_shift+1] - rsi14_arr[kdata_shift+2])/(rsi14_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.rsi14_change3 = ((rsi14_arr[kdata_shift+2] - rsi14_arr[kdata_shift+3])/(rsi14_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.rsi14_change4 = ((rsi14_arr[kdata_shift+3] - rsi14_arr[kdata_shift+4])/(rsi14_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.rsi14_change5 = ((rsi14_arr[kdata_shift+4] - rsi14_arr[kdata_shift+5])/(rsi14_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.rsi14_change6 = ((rsi14_arr[kdata_shift+5] - rsi14_arr[kdata_shift+6])/(rsi14_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.rsi14_change7 = ((rsi14_arr[kdata_shift+6] - rsi14_arr[kdata_shift+7])/(rsi14_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.rsi14_change8 = ((rsi14_arr[kdata_shift+7] - rsi14_arr[kdata_shift+8])/(rsi14_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.rsi14_change9 = ((rsi14_arr[kdata_shift+8] - rsi14_arr[kdata_shift+9])/(rsi14_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.rsi14_change10 = ((rsi14_arr[kdata_shift+9] - rsi14_arr[kdata_shift+10])/(rsi14_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.rsi14_current_change1 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+1])/(rsi14_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.rsi14_current_change2 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+2])/(rsi14_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.rsi14_current_change3 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+3])/(rsi14_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.rsi14_current_change4 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+4])/(rsi14_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.rsi14_current_change5 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+5])/(rsi14_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.rsi14_current_change6 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+6])/(rsi14_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.rsi14_current_change7 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+7])/(rsi14_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.rsi14_current_change8 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+8])/(rsi14_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.rsi14_current_change9 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+9])/(rsi14_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.rsi14_current_change10 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+10])/(rsi14_arr[kdata_shift+10]+1E-15))*100;
   
   currentCandle.rsi5_changeValue1 = rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+1];      //rsi变化值
   currentCandle.rsi5_changeValue2 = rsi5_arr[kdata_shift+1] - rsi5_arr[kdata_shift+2];
   currentCandle.rsi5_changeValue3 = rsi5_arr[kdata_shift+2] - rsi5_arr[kdata_shift+3];
   currentCandle.rsi5_changeValue4 = rsi5_arr[kdata_shift+3] - rsi5_arr[kdata_shift+4];
   currentCandle.rsi5_changeValue5 = rsi5_arr[kdata_shift+4] - rsi5_arr[kdata_shift+5];
   currentCandle.rsi5_changeValue6 = rsi5_arr[kdata_shift+5] - rsi5_arr[kdata_shift+6];
   currentCandle.rsi5_changeValue7 = rsi5_arr[kdata_shift+6] - rsi5_arr[kdata_shift+7];
   currentCandle.rsi5_changeValue8 = rsi5_arr[kdata_shift+7] - rsi5_arr[kdata_shift+8];
   currentCandle.rsi5_changeValue9 = rsi5_arr[kdata_shift+8] - rsi5_arr[kdata_shift+9];
   currentCandle.rsi5_changeValue9 = rsi5_arr[kdata_shift+9] - rsi5_arr[kdata_shift+10];
   
   currentCandle.rsi14_changeValue1 = rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+1];
   currentCandle.rsi14_changeValue2 = rsi14_arr[kdata_shift+1] - rsi14_arr[kdata_shift+2];
   currentCandle.rsi14_changeValue3 = rsi14_arr[kdata_shift+2] - rsi14_arr[kdata_shift+3];
   currentCandle.rsi14_changeValue4 = rsi14_arr[kdata_shift+3] - rsi14_arr[kdata_shift+4];
   currentCandle.rsi14_changeValue5 = rsi14_arr[kdata_shift+4] - rsi14_arr[kdata_shift+5];
   currentCandle.rsi14_changeValue6 = rsi14_arr[kdata_shift+5] - rsi14_arr[kdata_shift+6];
   currentCandle.rsi14_changeValue7 = rsi14_arr[kdata_shift+6] - rsi14_arr[kdata_shift+7];
   currentCandle.rsi14_changeValue8 = rsi14_arr[kdata_shift+7] - rsi14_arr[kdata_shift+8];
   currentCandle.rsi14_changeValue9 = rsi14_arr[kdata_shift+8] - rsi14_arr[kdata_shift+9];
   currentCandle.rsi14_changeValue10 = rsi14_arr[kdata_shift+9] - rsi14_arr[kdata_shift+10];
   
//ArrayPrint(rsi5_arr);
//ArrayPrint(rsi14_arr);
//----------------------------------------RSI反映情况类型判定----------------------------------------
   currentCandle.rsi_5_14_type = TypeRSI(rsi5_arr, rsi14_arr, kdata_shift);

//SAR
   double sar_arr[];
   SAR(sar_arr,_Symbol,timeframe_currently,0.02,2,count_num);

   currentCandle.sar = sar_arr[kdata_shift];

   currentCandle.sar_change1 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+1])/sar_arr[kdata_shift+1])*100;     //sar变化率
   currentCandle.sar_change2 = ((sar_arr[kdata_shift+1] - sar_arr[kdata_shift+2])/sar_arr[kdata_shift+2])*100;
   currentCandle.sar_change3 = ((sar_arr[kdata_shift+2] - sar_arr[kdata_shift+3])/sar_arr[kdata_shift+3])*100;
   currentCandle.sar_change4 = ((sar_arr[kdata_shift+3] - sar_arr[kdata_shift+4])/sar_arr[kdata_shift+4])*100;
   currentCandle.sar_change5 = ((sar_arr[kdata_shift+4] - sar_arr[kdata_shift+5])/sar_arr[kdata_shift+5])*100;
   currentCandle.sar_change6 = ((sar_arr[kdata_shift+5] - sar_arr[kdata_shift+6])/sar_arr[kdata_shift+6])*100;
   currentCandle.sar_change7 = ((sar_arr[kdata_shift+6] - sar_arr[kdata_shift+7])/sar_arr[kdata_shift+7])*100;
   currentCandle.sar_change8 = ((sar_arr[kdata_shift+7] - sar_arr[kdata_shift+8])/sar_arr[kdata_shift+8])*100;
   currentCandle.sar_change9 = ((sar_arr[kdata_shift+8] - sar_arr[kdata_shift+9])/sar_arr[kdata_shift+9])*100;
   currentCandle.sar_change10 = ((sar_arr[kdata_shift+9] - sar_arr[kdata_shift+10])/sar_arr[kdata_shift+10])*100;

   currentCandle.sar_current_change1 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+1])/sar_arr[kdata_shift+1])*100;
   currentCandle.sar_current_change2 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+2])/sar_arr[kdata_shift+2])*100;
   currentCandle.sar_current_change3 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+3])/sar_arr[kdata_shift+3])*100;
   currentCandle.sar_current_change4 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+4])/sar_arr[kdata_shift+4])*100;
   currentCandle.sar_current_change5 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+5])/sar_arr[kdata_shift+5])*100;
   currentCandle.sar_current_change6 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+6])/sar_arr[kdata_shift+6])*100;
   currentCandle.sar_current_change7 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+7])/sar_arr[kdata_shift+7])*100;
   currentCandle.sar_current_change8 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+8])/sar_arr[kdata_shift+8])*100;
   currentCandle.sar_current_change9 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+9])/sar_arr[kdata_shift+9])*100;
   currentCandle.sar_current_change10 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+10])/sar_arr[kdata_shift+10])*100;
   
   currentCandle.sar_changeValue1 = sar_arr[kdata_shift] - sar_arr[kdata_shift+1];     //sar变化值
   currentCandle.sar_changeValue2 = sar_arr[kdata_shift+1] - sar_arr[kdata_shift+2];
   currentCandle.sar_changeValue3 = sar_arr[kdata_shift+2] - sar_arr[kdata_shift+3];
   currentCandle.sar_changeValue4 = sar_arr[kdata_shift+3] - sar_arr[kdata_shift+4];
   currentCandle.sar_changeValue5 = sar_arr[kdata_shift+4] - sar_arr[kdata_shift+5];
   currentCandle.sar_changeValue6 = sar_arr[kdata_shift+5] - sar_arr[kdata_shift+6];
   currentCandle.sar_changeValue7 = sar_arr[kdata_shift+6] - sar_arr[kdata_shift+7];
   currentCandle.sar_changeValue8 = sar_arr[kdata_shift+7] - sar_arr[kdata_shift+8];
   currentCandle.sar_changeValue9 = sar_arr[kdata_shift+8] - sar_arr[kdata_shift+9];
   currentCandle.sar_changeValue10 = sar_arr[kdata_shift+9] - sar_arr[kdata_shift+10];

//ArrayPrint(sar_arr);
//----------------------------------------SAR反映情况类型判定----------------------------------------
   currentCandle.sar_type = TypeSAR(sar_arr, close_, kdata_shift);

//ADX
   double adx_arr[];
   double DI_plus_arr[];
   double DI_minus_arr[];
   ADX(adx_arr,DI_plus_arr,DI_minus_arr,_Symbol,timeframe_currently,5,count_num);

   currentCandle.adx = adx_arr[kdata_shift];
   currentCandle.adx_DI_plus = DI_plus_arr[kdata_shift];
   currentCandle.adx_DI_minus = DI_minus_arr[kdata_shift];

   currentCandle.adx_change1 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+1])/(adx_arr[kdata_shift+1]+1E-15))*100;     //adx变化率
   currentCandle.adx_change2 = ((adx_arr[kdata_shift+1] - adx_arr[kdata_shift+2])/(adx_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.adx_change3 = ((adx_arr[kdata_shift+2] - adx_arr[kdata_shift+3])/(adx_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.adx_change4 = ((adx_arr[kdata_shift+3] - adx_arr[kdata_shift+4])/(adx_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.adx_change5 = ((adx_arr[kdata_shift+4] - adx_arr[kdata_shift+5])/(adx_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.adx_change6 = ((adx_arr[kdata_shift+5] - adx_arr[kdata_shift+6])/(adx_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.adx_change7 = ((adx_arr[kdata_shift+6] - adx_arr[kdata_shift+7])/(adx_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.adx_change8 = ((adx_arr[kdata_shift+7] - adx_arr[kdata_shift+8])/(adx_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.adx_change9 = ((adx_arr[kdata_shift+8] - adx_arr[kdata_shift+9])/(adx_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.adx_change10 = ((adx_arr[kdata_shift+9] - adx_arr[kdata_shift+10])/(adx_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.adx_current_change1 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+1])/(adx_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.adx_current_change2 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+2])/(adx_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.adx_current_change3 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+3])/(adx_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.adx_current_change4 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+4])/(adx_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.adx_current_change5 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+5])/(adx_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.adx_current_change6 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+6])/(adx_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.adx_current_change7 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+7])/(adx_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.adx_current_change8 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+8])/(adx_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.adx_current_change9 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+9])/(adx_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.adx_current_change10 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+10])/(adx_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.adx_changeValue1 = adx_arr[kdata_shift] - adx_arr[kdata_shift+1];
   currentCandle.adx_changeValue2 = adx_arr[kdata_shift+1] - adx_arr[kdata_shift+2];
   currentCandle.adx_changeValue3 = adx_arr[kdata_shift+2] - adx_arr[kdata_shift+3];
   currentCandle.adx_changeValue4 = adx_arr[kdata_shift+3] - adx_arr[kdata_shift+4];
   currentCandle.adx_changeValue5 = adx_arr[kdata_shift+4] - adx_arr[kdata_shift+5];
   currentCandle.adx_changeValue6 = adx_arr[kdata_shift+5] - adx_arr[kdata_shift+6];
   currentCandle.adx_changeValue7 = adx_arr[kdata_shift+6] - adx_arr[kdata_shift+7];
   currentCandle.adx_changeValue8 = adx_arr[kdata_shift+7] - adx_arr[kdata_shift+8];
   currentCandle.adx_changeValue9 = adx_arr[kdata_shift+8] - adx_arr[kdata_shift+9];
   currentCandle.adx_changeValue10 = adx_arr[kdata_shift+9] - adx_arr[kdata_shift+10];
   
//ArrayPrint(adx_arr);
//ArrayPrint(DI_plus_arr);
//ArrayPrint(DI_minus_arr);
//----------------------------------------ADX反映情况类型判定----------------------------------------
   currentCandle.adx_type = TypeADX(adx_arr, kdata_shift);

//CCI
   double cci_arr[];
   CCI(cci_arr,_Symbol,timeframe_currently,5,PRICE_CLOSE,count_num);

   currentCandle.cci = cci_arr[kdata_shift];

   currentCandle.cci_change1 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+1])/(MathAbs(cci_arr[kdata_shift+1])+1E-15))*100;     //cci变化率
   currentCandle.cci_change2 = ((cci_arr[kdata_shift+1] - cci_arr[kdata_shift+2])/(MathAbs(cci_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.cci_change3 = ((cci_arr[kdata_shift+2] - cci_arr[kdata_shift+3])/(MathAbs(cci_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.cci_change4 = ((cci_arr[kdata_shift+3] - cci_arr[kdata_shift+4])/(MathAbs(cci_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.cci_change5 = ((cci_arr[kdata_shift+4] - cci_arr[kdata_shift+5])/(MathAbs(cci_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.cci_change6 = ((cci_arr[kdata_shift+5] - cci_arr[kdata_shift+6])/(MathAbs(cci_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.cci_change7 = ((cci_arr[kdata_shift+6] - cci_arr[kdata_shift+7])/(MathAbs(cci_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.cci_change8 = ((cci_arr[kdata_shift+7] - cci_arr[kdata_shift+8])/(MathAbs(cci_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.cci_change9 = ((cci_arr[kdata_shift+8] - cci_arr[kdata_shift+9])/(MathAbs(cci_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.cci_change10 = ((cci_arr[kdata_shift+9] - cci_arr[kdata_shift+10])/(MathAbs(cci_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.cci_current_change1 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+1])/(MathAbs(cci_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.cci_current_change2 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+2])/(MathAbs(cci_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.cci_current_change3 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+3])/(MathAbs(cci_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.cci_current_change4 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+4])/(MathAbs(cci_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.cci_current_change5 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+5])/(MathAbs(cci_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.cci_current_change6 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+6])/(MathAbs(cci_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.cci_current_change7 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+7])/(MathAbs(cci_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.cci_current_change8 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+8])/(MathAbs(cci_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.cci_current_change9 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+9])/(MathAbs(cci_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.cci_current_change10 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+10])/(MathAbs(cci_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.cci_changeValue1 = cci_arr[kdata_shift] - cci_arr[kdata_shift+1];     //cci变化值
   currentCandle.cci_changeValue2 = cci_arr[kdata_shift+1] - cci_arr[kdata_shift+2];
   currentCandle.cci_changeValue3 = cci_arr[kdata_shift+2] - cci_arr[kdata_shift+3];
   currentCandle.cci_changeValue4 = cci_arr[kdata_shift+3] - cci_arr[kdata_shift+4];
   currentCandle.cci_changeValue5 = cci_arr[kdata_shift+4] - cci_arr[kdata_shift+5];
   currentCandle.cci_changeValue6 = cci_arr[kdata_shift+5] - cci_arr[kdata_shift+6];
   currentCandle.cci_changeValue7 = cci_arr[kdata_shift+6] - cci_arr[kdata_shift+7];
   currentCandle.cci_changeValue8 = cci_arr[kdata_shift+7] - cci_arr[kdata_shift+8];
   currentCandle.cci_changeValue9 = cci_arr[kdata_shift+8] - cci_arr[kdata_shift+9];
   currentCandle.cci_changeValue10 = cci_arr[kdata_shift+9] - cci_arr[kdata_shift+10];
   
//ArrayPrint(cci_arr);
//----------------------------------------CCI反映情况类型判定----------------------------------------
   currentCandle.cci_type = TypeCCI(cci_arr, kdata_shift);
   
//BOLL
   double base_arr[];
   double upper_arr[];
   double lower_arr[];
   Bands(base_arr,upper_arr,lower_arr,_Symbol,timeframe_currently,5,0,2,PRICE_CLOSE,count_num);

   currentCandle.boll_upper_band = upper_arr[kdata_shift];
   currentCandle.boll_middle_band = base_arr[kdata_shift];
   currentCandle.boll_lower_band = lower_arr[kdata_shift];

   currentCandle.boll_change1 = ((base_arr[kdata_shift] - base_arr[kdata_shift+1])/base_arr[kdata_shift+1])*100;     //boll_middle_band变化率
   currentCandle.boll_change2 = ((base_arr[kdata_shift+1] - base_arr[kdata_shift+2])/base_arr[kdata_shift+2])*100;
   currentCandle.boll_change3 = ((base_arr[kdata_shift+2] - base_arr[kdata_shift+3])/base_arr[kdata_shift+3])*100;
   currentCandle.boll_change4 = ((base_arr[kdata_shift+3] - base_arr[kdata_shift+4])/base_arr[kdata_shift+4])*100;
   currentCandle.boll_change5 = ((base_arr[kdata_shift+4] - base_arr[kdata_shift+5])/base_arr[kdata_shift+5])*100;
   currentCandle.boll_change6 = ((base_arr[kdata_shift+5] - base_arr[kdata_shift+6])/base_arr[kdata_shift+6])*100;
   currentCandle.boll_change7 = ((base_arr[kdata_shift+6] - base_arr[kdata_shift+7])/base_arr[kdata_shift+7])*100;
   currentCandle.boll_change8 = ((base_arr[kdata_shift+7] - base_arr[kdata_shift+8])/base_arr[kdata_shift+8])*100;
   currentCandle.boll_change9 = ((base_arr[kdata_shift+8] - base_arr[kdata_shift+9])/base_arr[kdata_shift+9])*100;
   currentCandle.boll_change10 = ((base_arr[kdata_shift+9] - base_arr[kdata_shift+10])/base_arr[kdata_shift+10])*100;

   currentCandle.boll_current_change1 = ((base_arr[kdata_shift] - base_arr[kdata_shift+1])/base_arr[kdata_shift+1])*100;
   currentCandle.boll_current_change2 = ((base_arr[kdata_shift] - base_arr[kdata_shift+2])/base_arr[kdata_shift+2])*100;
   currentCandle.boll_current_change3 = ((base_arr[kdata_shift] - base_arr[kdata_shift+3])/base_arr[kdata_shift+3])*100;
   currentCandle.boll_current_change4 = ((base_arr[kdata_shift] - base_arr[kdata_shift+4])/base_arr[kdata_shift+4])*100;
   currentCandle.boll_current_change5 = ((base_arr[kdata_shift] - base_arr[kdata_shift+5])/base_arr[kdata_shift+5])*100;
   currentCandle.boll_current_change6 = ((base_arr[kdata_shift] - base_arr[kdata_shift+6])/base_arr[kdata_shift+6])*100;
   currentCandle.boll_current_change7 = ((base_arr[kdata_shift] - base_arr[kdata_shift+7])/base_arr[kdata_shift+7])*100;
   currentCandle.boll_current_change8 = ((base_arr[kdata_shift] - base_arr[kdata_shift+8])/base_arr[kdata_shift+8])*100;
   currentCandle.boll_current_change9 = ((base_arr[kdata_shift] - base_arr[kdata_shift+9])/base_arr[kdata_shift+9])*100;
   currentCandle.boll_current_change10 = ((base_arr[kdata_shift] - base_arr[kdata_shift+10])/base_arr[kdata_shift+10])*100;

//ArrayPrint(base_arr);
//ArrayPrint(upper_arr);
//ArrayPrint(lower_arr);
//------------------------------BOLL反映情况类型判定----------------------------------------
   currentCandle.boll_type = TypeBOLL(base_arr, upper_arr, lower_arr, open_, close_, kdata_shift);
   
//STOCH
   double slowK_arr[];
   double slowD_arr[];
   STOCH(slowK_arr,slowD_arr,_Symbol,timeframe_currently,5,3,3,MODE_SMA,STO_CLOSECLOSE,count_num);

   currentCandle.slowk = slowK_arr[kdata_shift];
   currentCandle.slowd = slowD_arr[kdata_shift];

   currentCandle.slowk_change1 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+1])/(slowK_arr[kdata_shift+1]+1E-15))*100;     //
   currentCandle.slowk_change2 = ((slowK_arr[kdata_shift+1] - slowK_arr[kdata_shift+2])/(slowK_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.slowk_change3 = ((slowK_arr[kdata_shift+2] - slowK_arr[kdata_shift+3])/(slowK_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.slowk_change4 = ((slowK_arr[kdata_shift+3] - slowK_arr[kdata_shift+4])/(slowK_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.slowk_change5 = ((slowK_arr[kdata_shift+4] - slowK_arr[kdata_shift+5])/(slowK_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.slowk_change6 = ((slowK_arr[kdata_shift+5] - slowK_arr[kdata_shift+6])/(slowK_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.slowk_change7 = ((slowK_arr[kdata_shift+6] - slowK_arr[kdata_shift+7])/(slowK_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.slowk_change8 = ((slowK_arr[kdata_shift+7] - slowK_arr[kdata_shift+8])/(slowK_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.slowk_change9 = ((slowK_arr[kdata_shift+8] - slowK_arr[kdata_shift+9])/(slowK_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.slowk_change10 = ((slowK_arr[kdata_shift+9] - slowK_arr[kdata_shift+10])/(slowK_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.slowk_current_change1 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+1])/(slowK_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.slowk_current_change2 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+2])/(slowK_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.slowk_current_change3 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+3])/(slowK_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.slowk_current_change4 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+4])/(slowK_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.slowk_current_change5 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+5])/(slowK_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.slowk_current_change6 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+6])/(slowK_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.slowk_current_change7 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+7])/(slowK_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.slowk_current_change8 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+8])/(slowK_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.slowk_current_change9 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+9])/(slowK_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.slowk_current_change10 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+10])/(slowK_arr[kdata_shift+10]+1E-15))*100;
   
   currentCandle.slowk_changeValue1 = slowK_arr[kdata_shift] - slowK_arr[kdata_shift+1];     //值
   currentCandle.slowk_changeValue2 = slowK_arr[kdata_shift+1] - slowK_arr[kdata_shift+2];
   currentCandle.slowk_changeValue3 = slowK_arr[kdata_shift+2] - slowK_arr[kdata_shift+3];
   currentCandle.slowk_changeValue4 = slowK_arr[kdata_shift+3] - slowK_arr[kdata_shift+4];
   currentCandle.slowk_changeValue5 = slowK_arr[kdata_shift+4] - slowK_arr[kdata_shift+5];
   currentCandle.slowk_changeValue6 = slowK_arr[kdata_shift+5] - slowK_arr[kdata_shift+6];
   currentCandle.slowk_changeValue7 = slowK_arr[kdata_shift+6] - slowK_arr[kdata_shift+7];
   currentCandle.slowk_changeValue8 = slowK_arr[kdata_shift+7] - slowK_arr[kdata_shift+8];
   currentCandle.slowk_changeValue9 = slowK_arr[kdata_shift+8] - slowK_arr[kdata_shift+9];
   currentCandle.slowk_changeValue10 = slowK_arr[kdata_shift+9] - slowK_arr[kdata_shift+10];

//ArrayPrint(slowK_arr);
//ArrayPrint(slowD_arr);
//----------------------------------------STOCH反映情况类型判定----------------------------------------
   currentCandle.stoch_type = TypeSTOCH(slowK_arr, slowD_arr, kdata_shift);
   
//AC
   double ac_value_arr[];
   double ac_color_arr[];
   AC(ac_value_arr,ac_color_arr,_Symbol,timeframe_currently,count_num);

   currentCandle.ac_value = ac_value_arr[kdata_shift];
   currentCandle.ac_color = ac_color_arr[kdata_shift];

   currentCandle.ac_change1 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+1])/(MathAbs(ac_value_arr[kdata_shift+1])+1E-15))*100;     //ac变化率
   currentCandle.ac_change2 = ((ac_value_arr[kdata_shift+1] - ac_value_arr[kdata_shift+2])/(MathAbs(ac_value_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.ac_change3 = ((ac_value_arr[kdata_shift+2] - ac_value_arr[kdata_shift+3])/(MathAbs(ac_value_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.ac_change4 = ((ac_value_arr[kdata_shift+3] - ac_value_arr[kdata_shift+4])/(MathAbs(ac_value_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.ac_change5 = ((ac_value_arr[kdata_shift+4] - ac_value_arr[kdata_shift+5])/(MathAbs(ac_value_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.ac_change6 = ((ac_value_arr[kdata_shift+5] - ac_value_arr[kdata_shift+6])/(MathAbs(ac_value_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.ac_change7 = ((ac_value_arr[kdata_shift+6] - ac_value_arr[kdata_shift+7])/(MathAbs(ac_value_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.ac_change8 = ((ac_value_arr[kdata_shift+7] - ac_value_arr[kdata_shift+8])/(MathAbs(ac_value_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.ac_change9 = ((ac_value_arr[kdata_shift+8] - ac_value_arr[kdata_shift+9])/(MathAbs(ac_value_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.ac_change10 = ((ac_value_arr[kdata_shift+9] - ac_value_arr[kdata_shift+10])/(MathAbs(ac_value_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.ac_current_change1 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+1])/(MathAbs(ac_value_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.ac_current_change2 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+2])/(MathAbs(ac_value_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.ac_current_change3 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+3])/(MathAbs(ac_value_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.ac_current_change4 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+4])/(MathAbs(ac_value_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.ac_current_change5 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+5])/(MathAbs(ac_value_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.ac_current_change6 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+6])/(MathAbs(ac_value_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.ac_current_change7 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+7])/(MathAbs(ac_value_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.ac_current_change8 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+8])/(MathAbs(ac_value_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.ac_current_change9 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+9])/(MathAbs(ac_value_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.ac_current_change10 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+10])/(MathAbs(ac_value_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.ac_changeValue1 = ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+1];     //ac变化值
   currentCandle.ac_changeValue2 = ac_value_arr[kdata_shift+1] - ac_value_arr[kdata_shift+2];
   currentCandle.ac_changeValue3 = ac_value_arr[kdata_shift+2] - ac_value_arr[kdata_shift+3];
   currentCandle.ac_changeValue4 = ac_value_arr[kdata_shift+3] - ac_value_arr[kdata_shift+4];
   currentCandle.ac_changeValue5 = ac_value_arr[kdata_shift+4] - ac_value_arr[kdata_shift+5];
   currentCandle.ac_changeValue6 = ac_value_arr[kdata_shift+5] - ac_value_arr[kdata_shift+6];
   currentCandle.ac_changeValue7 = ac_value_arr[kdata_shift+6] - ac_value_arr[kdata_shift+7];
   currentCandle.ac_changeValue8 = ac_value_arr[kdata_shift+7] - ac_value_arr[kdata_shift+8];
   currentCandle.ac_changeValue9 = ac_value_arr[kdata_shift+8] - ac_value_arr[kdata_shift+9];
   currentCandle.ac_changeValue10 = ac_value_arr[kdata_shift+9] - ac_value_arr[kdata_shift+10];

//printf("AC");
//ArrayPrint(ac_value_arr);
//ArrayPrint(ac_color_arr);
//----------------------------------------AC反映情况类型判定----------------------------------------
   currentCandle.ac_type = TypeAC(ac_value_arr, ac_color_arr, kdata_shift);
   
//AD
   double ad_arr[];
   AD(ad_arr,_Symbol,timeframe_currently,VOLUME_TICK,count_num);

   currentCandle.ad = ad_arr[kdata_shift];

   currentCandle.ad_change1 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+1])/(MathAbs(ad_arr[kdata_shift+1])+1E-15))*100;     //ad变化率
   currentCandle.ad_change2 = ((ad_arr[kdata_shift+1] - ad_arr[kdata_shift+2])/(MathAbs(ad_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.ad_change3 = ((ad_arr[kdata_shift+2] - ad_arr[kdata_shift+3])/(MathAbs(ad_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.ad_change4 = ((ad_arr[kdata_shift+3] - ad_arr[kdata_shift+4])/(MathAbs(ad_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.ad_change5 = ((ad_arr[kdata_shift+4] - ad_arr[kdata_shift+5])/(MathAbs(ad_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.ad_change6 = ((ad_arr[kdata_shift+5] - ad_arr[kdata_shift+6])/(MathAbs(ad_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.ad_change7 = ((ad_arr[kdata_shift+6] - ad_arr[kdata_shift+7])/(MathAbs(ad_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.ad_change8 = ((ad_arr[kdata_shift+7] - ad_arr[kdata_shift+8])/(MathAbs(ad_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.ad_change9 = ((ad_arr[kdata_shift+8] - ad_arr[kdata_shift+9])/(MathAbs(ad_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.ad_change10 = ((ad_arr[kdata_shift+9] - ad_arr[kdata_shift+10])/(MathAbs(ad_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.ad_current_change1 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+1])/(MathAbs(ad_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.ad_current_change2 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+2])/(MathAbs(ad_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.ad_current_change3 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+3])/(MathAbs(ad_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.ad_current_change4 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+4])/(MathAbs(ad_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.ad_current_change5 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+5])/(MathAbs(ad_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.ad_current_change6 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+6])/(MathAbs(ad_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.ad_current_change7 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+7])/(MathAbs(ad_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.ad_current_change8 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+8])/(MathAbs(ad_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.ad_current_change9 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+9])/(MathAbs(ad_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.ad_current_change10 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+10])/(MathAbs(ad_arr[kdata_shift+10])+1E-15))*100;

//printf("AD");
//ArrayPrint(ad_arr);
//----------------------------------------AD反映情况类型判定----------------------------------------
   currentCandle.ad_type = TypeAD(ad_arr, kdata_shift);
   
//ADXWilder
   double adxWilder_arr[];
   double adxWilder_DI_plus_arr[];
   double adxWilder_DI_minus_arr[];
   ADXWilder(adxWilder_arr,adxWilder_DI_plus_arr,adxWilder_DI_minus_arr,_Symbol,timeframe_currently,5,count_num);

   currentCandle.adxWilder = adxWilder_arr[kdata_shift];
   currentCandle.adxWilder_DI_plus = adxWilder_DI_plus_arr[kdata_shift];
   currentCandle.adxWilder_DI_minus = adxWilder_DI_minus_arr[kdata_shift];

   currentCandle.adxWilder_change1 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+1])/(adxWilder_arr[kdata_shift+1]+1E-15))*100;     //ADXWilder变化率
   currentCandle.adxWilder_change2 = ((adxWilder_arr[kdata_shift+1] - adxWilder_arr[kdata_shift+2])/(adxWilder_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.adxWilder_change3 = ((adxWilder_arr[kdata_shift+2] - adxWilder_arr[kdata_shift+3])/(adxWilder_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.adxWilder_change4 = ((adxWilder_arr[kdata_shift+3] - adxWilder_arr[kdata_shift+4])/(adxWilder_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.adxWilder_change5 = ((adxWilder_arr[kdata_shift+4] - adxWilder_arr[kdata_shift+5])/(adxWilder_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.adxWilder_change6 = ((adxWilder_arr[kdata_shift+5] - adxWilder_arr[kdata_shift+6])/(adxWilder_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.adxWilder_change7 = ((adxWilder_arr[kdata_shift+6] - adxWilder_arr[kdata_shift+7])/(adxWilder_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.adxWilder_change8 = ((adxWilder_arr[kdata_shift+7] - adxWilder_arr[kdata_shift+8])/(adxWilder_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.adxWilder_change9 = ((adxWilder_arr[kdata_shift+8] - adxWilder_arr[kdata_shift+9])/(adxWilder_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.adxWilder_change10 = ((adxWilder_arr[kdata_shift+9] - adxWilder_arr[kdata_shift+10])/(adxWilder_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.adxWilder_current_change1 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+1])/(adxWilder_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.adxWilder_current_change2 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+2])/(adxWilder_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.adxWilder_current_change3 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+3])/(adxWilder_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.adxWilder_current_change4 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+4])/(adxWilder_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.adxWilder_current_change5 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+5])/(adxWilder_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.adxWilder_current_change6 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+6])/(adxWilder_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.adxWilder_current_change7 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+7])/(adxWilder_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.adxWilder_current_change8 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+8])/(adxWilder_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.adxWilder_current_change9 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+9])/(adxWilder_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.adxWilder_current_change10 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+10])/(adxWilder_arr[kdata_shift+10]+1E-15))*100;
   
   currentCandle.adxWilder_changeValue1 = adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+1];     //ADXWilder变化值
   currentCandle.adxWilder_changeValue2 = adxWilder_arr[kdata_shift+1] - adxWilder_arr[kdata_shift+2];
   currentCandle.adxWilder_changeValue3 = adxWilder_arr[kdata_shift+2] - adxWilder_arr[kdata_shift+3];
   currentCandle.adxWilder_changeValue4 = adxWilder_arr[kdata_shift+3] - adxWilder_arr[kdata_shift+4];
   currentCandle.adxWilder_changeValue5 = adxWilder_arr[kdata_shift+4] - adxWilder_arr[kdata_shift+5];
   currentCandle.adxWilder_changeValue6 = adxWilder_arr[kdata_shift+5] - adxWilder_arr[kdata_shift+6];
   currentCandle.adxWilder_changeValue7 = adxWilder_arr[kdata_shift+6] - adxWilder_arr[kdata_shift+7];
   currentCandle.adxWilder_changeValue8 = adxWilder_arr[kdata_shift+7] - adxWilder_arr[kdata_shift+8];
   currentCandle.adxWilder_changeValue9 = adxWilder_arr[kdata_shift+8] - adxWilder_arr[kdata_shift+9];
   currentCandle.adxWilder_changeValue10 = adxWilder_arr[kdata_shift+9] - adxWilder_arr[kdata_shift+10];

//printf("ADXWilder");
//ArrayPrint(adxWilder_arr);
//ArrayPrint(adxWilder_DI_plus_arr);
//ArrayPrint(adxWilder_DI_minus_arr
//----------------------------------------ADXWilder反映情况类型判定----------------------------------------
   currentCandle.adxWilder_type = TypeADXWilder(adxWilder_arr, kdata_shift);
   
//Alligator
   double jaws_arr[];
   double teeth_arr[];
   double lips_arr[];
   Alligator(jaws_arr,teeth_arr,lips_arr,_Symbol,timeframe_currently,13,8,8,5,5,3,MODE_SMMA,PRICE_CLOSE,count_num);

   currentCandle.jaws = jaws_arr[kdata_shift];
   currentCandle.teeth = teeth_arr[kdata_shift];
   currentCandle.lips = lips_arr[kdata_shift];

   currentCandle.lips_change1 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+1])/lips_arr[kdata_shift+1])*100;     //lips变化率
   currentCandle.lips_change2 = ((lips_arr[kdata_shift+1] - lips_arr[kdata_shift+2])/lips_arr[kdata_shift+2])*100;
   currentCandle.lips_change3 = ((lips_arr[kdata_shift+2] - lips_arr[kdata_shift+3])/lips_arr[kdata_shift+3])*100;
   currentCandle.lips_change4 = ((lips_arr[kdata_shift+3] - lips_arr[kdata_shift+4])/lips_arr[kdata_shift+4])*100;
   currentCandle.lips_change5 = ((lips_arr[kdata_shift+4] - lips_arr[kdata_shift+5])/lips_arr[kdata_shift+5])*100;
   currentCandle.lips_change6 = ((lips_arr[kdata_shift+5] - lips_arr[kdata_shift+6])/lips_arr[kdata_shift+6])*100;
   currentCandle.lips_change7 = ((lips_arr[kdata_shift+6] - lips_arr[kdata_shift+7])/lips_arr[kdata_shift+7])*100;
   currentCandle.lips_change8 = ((lips_arr[kdata_shift+7] - lips_arr[kdata_shift+8])/lips_arr[kdata_shift+8])*100;
   currentCandle.lips_change9 = ((lips_arr[kdata_shift+8] - lips_arr[kdata_shift+9])/lips_arr[kdata_shift+9])*100;
   currentCandle.lips_change10 = ((lips_arr[kdata_shift+9] - lips_arr[kdata_shift+10])/lips_arr[kdata_shift+10])*100;

   currentCandle.lips_current_change1 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+1])/lips_arr[kdata_shift+1])*100;
   currentCandle.lips_current_change2 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+2])/lips_arr[kdata_shift+2])*100;
   currentCandle.lips_current_change3 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+3])/lips_arr[kdata_shift+3])*100;
   currentCandle.lips_current_change4 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+4])/lips_arr[kdata_shift+4])*100;
   currentCandle.lips_current_change5 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+5])/lips_arr[kdata_shift+5])*100;
   currentCandle.lips_current_change6 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+6])/lips_arr[kdata_shift+6])*100;
   currentCandle.lips_current_change7 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+7])/lips_arr[kdata_shift+7])*100;
   currentCandle.lips_current_change8 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+8])/lips_arr[kdata_shift+8])*100;
   currentCandle.lips_current_change9 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+9])/lips_arr[kdata_shift+9])*100;
   currentCandle.lips_current_change10 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+10])/lips_arr[kdata_shift+10])*100;
   
   currentCandle.lips_changeValue1 = lips_arr[kdata_shift] - lips_arr[kdata_shift+1];     //lips变化值
   currentCandle.lips_changeValue2 = lips_arr[kdata_shift+1] - lips_arr[kdata_shift+2];
   currentCandle.lips_changeValue3 = lips_arr[kdata_shift+2] - lips_arr[kdata_shift+3];
   currentCandle.lips_changeValue4 = lips_arr[kdata_shift+3] - lips_arr[kdata_shift+4];
   currentCandle.lips_changeValue5 = lips_arr[kdata_shift+4] - lips_arr[kdata_shift+5];
   currentCandle.lips_changeValue6 = lips_arr[kdata_shift+5] - lips_arr[kdata_shift+6];
   currentCandle.lips_changeValue7 = lips_arr[kdata_shift+6] - lips_arr[kdata_shift+7];
   currentCandle.lips_changeValue8 = lips_arr[kdata_shift+7] - lips_arr[kdata_shift+8];
   currentCandle.lips_changeValue9 = lips_arr[kdata_shift+8] - lips_arr[kdata_shift+9];
   currentCandle.lips_changeValue10 = lips_arr[kdata_shift+9] - lips_arr[kdata_shift+10];

//printf("Alligator");
//ArrayPrint(jaws_arr);
//ArrayPrint(teeth_arr);
//ArrayPrint(lips_arr);
//----------------------------------------Alligator反映情况类型判定----------------------------------------
   currentCandle.alligator_type = TypeAlligator(lips_arr, teeth_arr, jaws_arr, kdata_shift);
   
//AMA
   double ama_arr[];
   AMA(ama_arr,_Symbol,timeframe_currently,15,2,30,0,PRICE_CLOSE,count_num);
//printf("AMA");
   currentCandle.ama = ama_arr[kdata_shift];

   currentCandle.ama_change1 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+1])/ama_arr[kdata_shift+1])*100;     //ama变化率
   currentCandle.ama_change2 = ((ama_arr[kdata_shift+1] - ama_arr[kdata_shift+2])/ama_arr[kdata_shift+2])*100;
   currentCandle.ama_change3 = ((ama_arr[kdata_shift+2] - ama_arr[kdata_shift+3])/ama_arr[kdata_shift+3])*100;
   currentCandle.ama_change4 = ((ama_arr[kdata_shift+3] - ama_arr[kdata_shift+4])/ama_arr[kdata_shift+4])*100;
   currentCandle.ama_change5 = ((ama_arr[kdata_shift+4] - ama_arr[kdata_shift+5])/ama_arr[kdata_shift+5])*100;
   currentCandle.ama_change6 = ((ama_arr[kdata_shift+5] - ama_arr[kdata_shift+6])/ama_arr[kdata_shift+6])*100;
   currentCandle.ama_change7 = ((ama_arr[kdata_shift+6] - ama_arr[kdata_shift+7])/ama_arr[kdata_shift+7])*100;
   currentCandle.ama_change8 = ((ama_arr[kdata_shift+7] - ama_arr[kdata_shift+8])/ama_arr[kdata_shift+8])*100;
   currentCandle.ama_change9 = ((ama_arr[kdata_shift+8] - ama_arr[kdata_shift+9])/ama_arr[kdata_shift+9])*100;
   currentCandle.ama_change10 = ((ama_arr[kdata_shift+9] - ama_arr[kdata_shift+10])/ama_arr[kdata_shift+10])*100;

   currentCandle.ama_current_change1 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+1])/ama_arr[kdata_shift+1])*100;
   currentCandle.ama_current_change2 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+2])/ama_arr[kdata_shift+2])*100;
   currentCandle.ama_current_change3 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+3])/ama_arr[kdata_shift+3])*100;
   currentCandle.ama_current_change4 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+4])/ama_arr[kdata_shift+4])*100;
   currentCandle.ama_current_change5 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+5])/ama_arr[kdata_shift+5])*100;
   currentCandle.ama_current_change6 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+6])/ama_arr[kdata_shift+6])*100;
   currentCandle.ama_current_change7 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+7])/ama_arr[kdata_shift+7])*100;
   currentCandle.ama_current_change8 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+8])/ama_arr[kdata_shift+8])*100;
   currentCandle.ama_current_change9 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+9])/ama_arr[kdata_shift+9])*100;
   currentCandle.ama_current_change10 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+10])/ama_arr[kdata_shift+10])*100;
   
   currentCandle.ama_changeValue1 = ama_arr[kdata_shift] - ama_arr[kdata_shift+1];     //ama变化值
   currentCandle.ama_changeValue2 = ama_arr[kdata_shift+1] - ama_arr[kdata_shift+2]; 
   currentCandle.ama_changeValue3 = ama_arr[kdata_shift+2] - ama_arr[kdata_shift+3];
   currentCandle.ama_changeValue4 = ama_arr[kdata_shift+3] - ama_arr[kdata_shift+4];
   currentCandle.ama_changeValue5 = ama_arr[kdata_shift+4] - ama_arr[kdata_shift+5];
   currentCandle.ama_changeValue6 = ama_arr[kdata_shift+5] - ama_arr[kdata_shift+6];
   currentCandle.ama_changeValue7 = ama_arr[kdata_shift+6] - ama_arr[kdata_shift+7];
   currentCandle.ama_changeValue8 = ama_arr[kdata_shift+7] - ama_arr[kdata_shift+8];
   currentCandle.ama_changeValue9 = ama_arr[kdata_shift+8] - ama_arr[kdata_shift+9];
   currentCandle.ama_changeValue10 = ama_arr[kdata_shift+9] - ama_arr[kdata_shift+10];
   
//ArrayPrint(ama_arr);
//----------------------------------------AMA反映情况类型判定----------------------------------------
   currentCandle.ama_type = TypeAMA(ama_arr, close_, close_1, kdata_shift);

//AO
   double ao_value_arr[];
   double ao_color_arr[];
   AO(ao_value_arr,ao_color_arr,_Symbol,timeframe_currently,count_num);

   currentCandle.ao_value = ao_value_arr[kdata_shift];
   currentCandle.ao_color = ao_color_arr[kdata_shift];

   currentCandle.ao_change1 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+1])/(MathAbs(ao_value_arr[kdata_shift+1])+1E-15))*100;     //ao变化率
   currentCandle.ao_change2 = ((ao_value_arr[kdata_shift+1] - ao_value_arr[kdata_shift+2])/(MathAbs(ao_value_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.ao_change3 = ((ao_value_arr[kdata_shift+2] - ao_value_arr[kdata_shift+3])/(MathAbs(ao_value_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.ao_change4 = ((ao_value_arr[kdata_shift+3] - ao_value_arr[kdata_shift+4])/(MathAbs(ao_value_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.ao_change5 = ((ao_value_arr[kdata_shift+4] - ao_value_arr[kdata_shift+5])/(MathAbs(ao_value_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.ao_change6 = ((ao_value_arr[kdata_shift+5] - ao_value_arr[kdata_shift+6])/(MathAbs(ao_value_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.ao_change7 = ((ao_value_arr[kdata_shift+6] - ao_value_arr[kdata_shift+7])/(MathAbs(ao_value_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.ao_change8 = ((ao_value_arr[kdata_shift+7] - ao_value_arr[kdata_shift+8])/(MathAbs(ao_value_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.ao_change9 = ((ao_value_arr[kdata_shift+8] - ao_value_arr[kdata_shift+9])/(MathAbs(ao_value_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.ao_change10 = ((ao_value_arr[kdata_shift+9] - ao_value_arr[kdata_shift+10])/(MathAbs(ao_value_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.ao_current_change1 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+1])/(MathAbs(ao_value_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.ao_current_change2 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+2])/(MathAbs(ao_value_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.ao_current_change3 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+3])/(MathAbs(ao_value_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.ao_current_change4 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+4])/(MathAbs(ao_value_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.ao_current_change5 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+5])/(MathAbs(ao_value_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.ao_current_change6 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+6])/(MathAbs(ao_value_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.ao_current_change7 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+7])/(MathAbs(ao_value_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.ao_current_change8 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+8])/(MathAbs(ao_value_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.ao_current_change9 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+9])/(MathAbs(ao_value_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.ao_current_change10 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+10])/(MathAbs(ao_value_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.ao_changeValue1 = ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+1];     //ao变化值
   currentCandle.ao_changeValue2 = ao_value_arr[kdata_shift+1] - ao_value_arr[kdata_shift+2];
   currentCandle.ao_changeValue3 = ao_value_arr[kdata_shift+2] - ao_value_arr[kdata_shift+3];
   currentCandle.ao_changeValue4 = ao_value_arr[kdata_shift+3] - ao_value_arr[kdata_shift+4];
   currentCandle.ao_changeValue5 = ao_value_arr[kdata_shift+4] - ao_value_arr[kdata_shift+5];
   currentCandle.ao_changeValue6 = ao_value_arr[kdata_shift+5] - ao_value_arr[kdata_shift+6];
   currentCandle.ao_changeValue7 = ao_value_arr[kdata_shift+6] - ao_value_arr[kdata_shift+7];
   currentCandle.ao_changeValue8 = ao_value_arr[kdata_shift+7] - ao_value_arr[kdata_shift+8];
   currentCandle.ao_changeValue9 = ao_value_arr[kdata_shift+8] - ao_value_arr[kdata_shift+9];
   currentCandle.ao_changeValue10 = ao_value_arr[kdata_shift+9] - ao_value_arr[kdata_shift+10];
//printf("AO");
//ArrayPrint(ao_value_arr);
//ArrayPrint(ao_color_arr);
//----------------------------------------AO反映情况类型判定----------------------------------------
   currentCandle.ao_type = TypeAO(ao_value_arr, ao_color_arr, kdata_shift);

//BearsPower
   double bearsPower_arr[];
   BearsPower(bearsPower_arr,_Symbol,timeframe_currently,13,count_num);

   currentCandle.bearsPower = bearsPower_arr[kdata_shift];

   currentCandle.bears_change1 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+1])/(MathAbs(bearsPower_arr[kdata_shift+1])+1E-15))*100;     //bears变化率
   currentCandle.bears_change2 = ((bearsPower_arr[kdata_shift+1] - bearsPower_arr[kdata_shift+2])/(MathAbs(bearsPower_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.bears_change3 = ((bearsPower_arr[kdata_shift+2] - bearsPower_arr[kdata_shift+3])/(MathAbs(bearsPower_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.bears_change4 = ((bearsPower_arr[kdata_shift+3] - bearsPower_arr[kdata_shift+4])/(MathAbs(bearsPower_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.bears_change5 = ((bearsPower_arr[kdata_shift+4] - bearsPower_arr[kdata_shift+5])/(MathAbs(bearsPower_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.bears_change6 = ((bearsPower_arr[kdata_shift+5] - bearsPower_arr[kdata_shift+6])/(MathAbs(bearsPower_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.bears_change7 = ((bearsPower_arr[kdata_shift+6] - bearsPower_arr[kdata_shift+7])/(MathAbs(bearsPower_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.bears_change8 = ((bearsPower_arr[kdata_shift+7] - bearsPower_arr[kdata_shift+8])/(MathAbs(bearsPower_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.bears_change9 = ((bearsPower_arr[kdata_shift+8] - bearsPower_arr[kdata_shift+9])/(MathAbs(bearsPower_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.bears_change10 = ((bearsPower_arr[kdata_shift+9] - bearsPower_arr[kdata_shift+10])/(MathAbs(bearsPower_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.bears_current_change1 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+1])/(MathAbs(bearsPower_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.bears_current_change2 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+2])/(MathAbs(bearsPower_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.bears_current_change3 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+3])/(MathAbs(bearsPower_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.bears_current_change4 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+4])/(MathAbs(bearsPower_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.bears_current_change5 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+5])/(MathAbs(bearsPower_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.bears_current_change6 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+6])/(MathAbs(bearsPower_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.bears_current_change7 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+7])/(MathAbs(bearsPower_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.bears_current_change8 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+8])/(MathAbs(bearsPower_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.bears_current_change9 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+9])/(MathAbs(bearsPower_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.bears_current_change10 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+10])/(MathAbs(bearsPower_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.bears_changeValue1 = bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+1];     //bears变化率
   currentCandle.bears_changeValue2 = bearsPower_arr[kdata_shift+1] - bearsPower_arr[kdata_shift+2];
   currentCandle.bears_changeValue3 = bearsPower_arr[kdata_shift+2] - bearsPower_arr[kdata_shift+3];
   currentCandle.bears_changeValue4 = bearsPower_arr[kdata_shift+3] - bearsPower_arr[kdata_shift+4];
   currentCandle.bears_changeValue5 = bearsPower_arr[kdata_shift+4] - bearsPower_arr[kdata_shift+5];
   currentCandle.bears_changeValue6 = bearsPower_arr[kdata_shift+5] - bearsPower_arr[kdata_shift+6];
   currentCandle.bears_changeValue7 = bearsPower_arr[kdata_shift+6] - bearsPower_arr[kdata_shift+7];
   currentCandle.bears_changeValue8 = bearsPower_arr[kdata_shift+7] - bearsPower_arr[kdata_shift+8];
   currentCandle.bears_changeValue9 = bearsPower_arr[kdata_shift+8] - bearsPower_arr[kdata_shift+9];
   currentCandle.bears_changeValue10 = bearsPower_arr[kdata_shift+9] - bearsPower_arr[kdata_shift+10];
//printf("BearsPower");
//ArrayPrint(bearsPower_arr);
//----------------------------------------BearsPower反映情况类型判定----------------------------------------
   currentCandle.bearsPower_type = TypeBearsPower(bearsPower_arr, kdata_shift);
   
//BullsPower
   double bullsPower_arr[];
   BullsPower(bullsPower_arr,_Symbol,timeframe_currently,13,count_num);

   currentCandle.bullsPower = bullsPower_arr[kdata_shift];

   currentCandle.bulls_change1 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+1])/(MathAbs(bullsPower_arr[kdata_shift+1])+1E-15))*100;     //bulls变化率
   currentCandle.bulls_change2 = ((bullsPower_arr[kdata_shift+1] - bullsPower_arr[kdata_shift+2])/(MathAbs(bullsPower_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.bulls_change3 = ((bullsPower_arr[kdata_shift+2] - bullsPower_arr[kdata_shift+3])/(MathAbs(bullsPower_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.bulls_change4 = ((bullsPower_arr[kdata_shift+3] - bullsPower_arr[kdata_shift+4])/(MathAbs(bullsPower_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.bulls_change5 = ((bullsPower_arr[kdata_shift+4] - bullsPower_arr[kdata_shift+5])/(MathAbs(bullsPower_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.bulls_change6 = ((bullsPower_arr[kdata_shift+5] - bullsPower_arr[kdata_shift+6])/(MathAbs(bullsPower_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.bulls_change7 = ((bullsPower_arr[kdata_shift+6] - bullsPower_arr[kdata_shift+7])/(MathAbs(bullsPower_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.bulls_change8 = ((bullsPower_arr[kdata_shift+7] - bullsPower_arr[kdata_shift+8])/(MathAbs(bullsPower_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.bulls_change9 = ((bullsPower_arr[kdata_shift+8] - bullsPower_arr[kdata_shift+9])/(MathAbs(bullsPower_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.bulls_change10 = ((bullsPower_arr[kdata_shift+9] - bullsPower_arr[kdata_shift+10])/(MathAbs(bullsPower_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.bulls_current_change1 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+1])/(MathAbs(bullsPower_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.bulls_current_change2 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+2])/(MathAbs(bullsPower_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.bulls_current_change3 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+3])/(MathAbs(bullsPower_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.bulls_current_change4 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+4])/(MathAbs(bullsPower_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.bulls_current_change5 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+5])/(MathAbs(bullsPower_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.bulls_current_change6 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+6])/(MathAbs(bullsPower_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.bulls_current_change7 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+7])/(MathAbs(bullsPower_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.bulls_current_change8 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+8])/(MathAbs(bullsPower_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.bulls_current_change9 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+9])/(MathAbs(bullsPower_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.bulls_current_change10 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+10])/(MathAbs(bullsPower_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.bulls_changeValue1 = bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+1];     //bulls变化值
   currentCandle.bulls_changeValue2 = bullsPower_arr[kdata_shift+1] - bullsPower_arr[kdata_shift+2];
   currentCandle.bulls_changeValue3 = bullsPower_arr[kdata_shift+2] - bullsPower_arr[kdata_shift+3];
   currentCandle.bulls_changeValue4 = bullsPower_arr[kdata_shift+3] - bullsPower_arr[kdata_shift+4];
   currentCandle.bulls_changeValue5 = bullsPower_arr[kdata_shift+4] - bullsPower_arr[kdata_shift+5];
   currentCandle.bulls_changeValue6 = bullsPower_arr[kdata_shift+5] - bullsPower_arr[kdata_shift+6];
   currentCandle.bulls_changeValue7 = bullsPower_arr[kdata_shift+6] - bullsPower_arr[kdata_shift+7];
   currentCandle.bulls_changeValue8 = bullsPower_arr[kdata_shift+7] - bullsPower_arr[kdata_shift+8];
   currentCandle.bulls_changeValue9 = bullsPower_arr[kdata_shift+8] - bullsPower_arr[kdata_shift+9];
   currentCandle.bulls_changeValue10 = bullsPower_arr[kdata_shift+9] - bullsPower_arr[kdata_shift+10];
   
//printf("BullsPower");
//ArrayPrint(bullsPower_arr);
//----------------------------------------BullsPower反映情况类型判定----------------------------------------
   currentCandle.bullsPower_type = TypeBullsPower(bullsPower_arr, kdata_shift);

//Chaikin
   double chaikin_arr[];
   Chaikin(chaikin_arr,_Symbol,timeframe_currently,3,10,MODE_EMA,VOLUME_TICK,count_num);

   currentCandle.chaikin = chaikin_arr[kdata_shift];

   currentCandle.chaikin_change1 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+1])/(MathAbs(chaikin_arr[kdata_shift+1])+1E-15))*100;     //chaikin变化率
   currentCandle.chaikin_change2 = ((chaikin_arr[kdata_shift+1] - chaikin_arr[kdata_shift+2])/(MathAbs(chaikin_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.chaikin_change3 = ((chaikin_arr[kdata_shift+2] - chaikin_arr[kdata_shift+3])/(MathAbs(chaikin_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.chaikin_change4 = ((chaikin_arr[kdata_shift+3] - chaikin_arr[kdata_shift+4])/(MathAbs(chaikin_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.chaikin_change5 = ((chaikin_arr[kdata_shift+4] - chaikin_arr[kdata_shift+5])/(MathAbs(chaikin_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.chaikin_change6 = ((chaikin_arr[kdata_shift+5] - chaikin_arr[kdata_shift+6])/(MathAbs(chaikin_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.chaikin_change7 = ((chaikin_arr[kdata_shift+6] - chaikin_arr[kdata_shift+7])/(MathAbs(chaikin_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.chaikin_change8 = ((chaikin_arr[kdata_shift+7] - chaikin_arr[kdata_shift+8])/(MathAbs(chaikin_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.chaikin_change9 = ((chaikin_arr[kdata_shift+8] - chaikin_arr[kdata_shift+9])/(MathAbs(chaikin_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.chaikin_change10 = ((chaikin_arr[kdata_shift+9] - chaikin_arr[kdata_shift+10])/(MathAbs(chaikin_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.chaikin_current_change1 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+1])/(MathAbs(chaikin_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.chaikin_current_change2 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+2])/(MathAbs(chaikin_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.chaikin_current_change3 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+3])/(MathAbs(chaikin_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.chaikin_current_change4 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+4])/(MathAbs(chaikin_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.chaikin_current_change5 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+5])/(MathAbs(chaikin_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.chaikin_current_change6 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+6])/(MathAbs(chaikin_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.chaikin_current_change7 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+7])/(MathAbs(chaikin_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.chaikin_current_change8 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+8])/(MathAbs(chaikin_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.chaikin_current_change9 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+9])/(MathAbs(chaikin_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.chaikin_current_change10 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+10])/(MathAbs(chaikin_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.chaikin_changeValue1 = chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+1];
   currentCandle.chaikin_changeValue2 = chaikin_arr[kdata_shift+1] - chaikin_arr[kdata_shift+2];
   currentCandle.chaikin_changeValue3 = chaikin_arr[kdata_shift+2] - chaikin_arr[kdata_shift+3];
   currentCandle.chaikin_changeValue4 = chaikin_arr[kdata_shift+3] - chaikin_arr[kdata_shift+4];
   currentCandle.chaikin_changeValue5 = chaikin_arr[kdata_shift+4] - chaikin_arr[kdata_shift+5];
   currentCandle.chaikin_changeValue6 = chaikin_arr[kdata_shift+5] - chaikin_arr[kdata_shift+6];
   currentCandle.chaikin_changeValue7 = chaikin_arr[kdata_shift+6] - chaikin_arr[kdata_shift+7];
   currentCandle.chaikin_changeValue8 = chaikin_arr[kdata_shift+7] - chaikin_arr[kdata_shift+8];
   currentCandle.chaikin_changeValue9 = chaikin_arr[kdata_shift+8] - chaikin_arr[kdata_shift+9];
   currentCandle.chaikin_changeValue10 = chaikin_arr[kdata_shift+9] - chaikin_arr[kdata_shift+10];
   
//printf("Chaikin");
//ArrayPrint(chaikin_arr);
//----------------------------------------Chaikin反映情况类型判定----------------------------------------
   currentCandle.chaikin_type = TypeChaikin(chaikin_arr, kdata_shift);
   
//DEMA
   double dema_arr[];
   DEMA(dema_arr,_Symbol,timeframe_currently,14,0,PRICE_CLOSE,count_num);

   currentCandle.dema = dema_arr[kdata_shift];

   currentCandle.dema_change1 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+1])/dema_arr[kdata_shift+1])*100;     //dema变化率
   currentCandle.dema_change2 = ((dema_arr[kdata_shift+1] - dema_arr[kdata_shift+2])/dema_arr[kdata_shift+2])*100;
   currentCandle.dema_change3 = ((dema_arr[kdata_shift+2] - dema_arr[kdata_shift+3])/dema_arr[kdata_shift+3])*100;
   currentCandle.dema_change4 = ((dema_arr[kdata_shift+3] - dema_arr[kdata_shift+4])/dema_arr[kdata_shift+4])*100;
   currentCandle.dema_change5 = ((dema_arr[kdata_shift+4] - dema_arr[kdata_shift+5])/dema_arr[kdata_shift+5])*100;
   currentCandle.dema_change6 = ((dema_arr[kdata_shift+5] - dema_arr[kdata_shift+6])/dema_arr[kdata_shift+6])*100;
   currentCandle.dema_change7 = ((dema_arr[kdata_shift+6] - dema_arr[kdata_shift+7])/dema_arr[kdata_shift+7])*100;
   currentCandle.dema_change8 = ((dema_arr[kdata_shift+7] - dema_arr[kdata_shift+8])/dema_arr[kdata_shift+8])*100;
   currentCandle.dema_change9 = ((dema_arr[kdata_shift+8] - dema_arr[kdata_shift+9])/dema_arr[kdata_shift+9])*100;
   currentCandle.dema_change10 = ((dema_arr[kdata_shift+9] - dema_arr[kdata_shift+10])/dema_arr[kdata_shift+10])*100;

   currentCandle.dema_current_change1 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+1])/dema_arr[kdata_shift+1])*100;
   currentCandle.dema_current_change2 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+2])/dema_arr[kdata_shift+2])*100;
   currentCandle.dema_current_change3 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+3])/dema_arr[kdata_shift+3])*100;
   currentCandle.dema_current_change4 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+4])/dema_arr[kdata_shift+4])*100;
   currentCandle.dema_current_change5 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+5])/dema_arr[kdata_shift+5])*100;
   currentCandle.dema_current_change6 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+6])/dema_arr[kdata_shift+6])*100;
   currentCandle.dema_current_change7 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+7])/dema_arr[kdata_shift+7])*100;
   currentCandle.dema_current_change8 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+8])/dema_arr[kdata_shift+8])*100;
   currentCandle.dema_current_change9 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+9])/dema_arr[kdata_shift+9])*100;
   currentCandle.dema_current_change10 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+10])/dema_arr[kdata_shift+10])*100;
   
//printf("DEMA");
//ArrayPrint(dema_arr);
//----------------------------------------DEMA反映情况类型判定----------------------------------------
   currentCandle.dema_type = TypeDEMA(dema_arr, close_, close_1, kdata_shift);
  
//DeMarker
   double deMarker_arr[];
   DeMarker(deMarker_arr,_Symbol,timeframe_currently,14,count_num);

   currentCandle.deMarker = deMarker_arr[kdata_shift];

   currentCandle.deMarker_change1 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+1])/(deMarker_arr[kdata_shift+1]+1E-15))*100;     //deMarker变化率
   currentCandle.deMarker_change2 = ((deMarker_arr[kdata_shift+1] - deMarker_arr[kdata_shift+2])/(deMarker_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.deMarker_change3 = ((deMarker_arr[kdata_shift+2] - deMarker_arr[kdata_shift+3])/(deMarker_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.deMarker_change4 = ((deMarker_arr[kdata_shift+3] - deMarker_arr[kdata_shift+4])/(deMarker_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.deMarker_change5 = ((deMarker_arr[kdata_shift+4] - deMarker_arr[kdata_shift+5])/(deMarker_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.deMarker_change6 = ((deMarker_arr[kdata_shift+5] - deMarker_arr[kdata_shift+6])/(deMarker_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.deMarker_change7 = ((deMarker_arr[kdata_shift+6] - deMarker_arr[kdata_shift+7])/(deMarker_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.deMarker_change8 = ((deMarker_arr[kdata_shift+7] - deMarker_arr[kdata_shift+8])/(deMarker_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.deMarker_change9 = ((deMarker_arr[kdata_shift+8] - deMarker_arr[kdata_shift+9])/(deMarker_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.deMarker_change10 = ((deMarker_arr[kdata_shift+9] - deMarker_arr[kdata_shift+10])/(deMarker_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.deMarker_current_change1 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+1])/(deMarker_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.deMarker_current_change2 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+2])/(deMarker_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.deMarker_current_change3 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+3])/(deMarker_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.deMarker_current_change4 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+4])/(deMarker_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.deMarker_current_change5 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+5])/(deMarker_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.deMarker_current_change6 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+6])/(deMarker_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.deMarker_current_change7 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+7])/(deMarker_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.deMarker_current_change8 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+8])/(deMarker_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.deMarker_current_change9 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+9])/(deMarker_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.deMarker_current_change10 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+10])/(deMarker_arr[kdata_shift+10]+1E-15))*100;
   
   currentCandle.deMarker_changeValue1 = deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+1];     //deMarker变化值
   currentCandle.deMarker_changeValue2 = deMarker_arr[kdata_shift+1] - deMarker_arr[kdata_shift+2];
   currentCandle.deMarker_changeValue3 = deMarker_arr[kdata_shift+2] - deMarker_arr[kdata_shift+3];
   currentCandle.deMarker_changeValue4 = deMarker_arr[kdata_shift+3] - deMarker_arr[kdata_shift+4];
   currentCandle.deMarker_changeValue5 = deMarker_arr[kdata_shift+4] - deMarker_arr[kdata_shift+5];
   currentCandle.deMarker_changeValue6 = deMarker_arr[kdata_shift+5] - deMarker_arr[kdata_shift+6];
   currentCandle.deMarker_changeValue7 = deMarker_arr[kdata_shift+6] - deMarker_arr[kdata_shift+7];
   currentCandle.deMarker_changeValue8 = deMarker_arr[kdata_shift+7] - deMarker_arr[kdata_shift+8];
   currentCandle.deMarker_changeValue9 = deMarker_arr[kdata_shift+8] - deMarker_arr[kdata_shift+9];
   currentCandle.deMarker_changeValue10 = deMarker_arr[kdata_shift+9] - deMarker_arr[kdata_shift+10];
//printf("DeMarker");
//ArrayPrint(deMarker_arr);
//----------------------------------------DeMarker反映情况类型判定----------------------------------------
   currentCandle.deMarker_type = TypeDeMarker(deMarker_arr, kdata_shift);
   
//Envelopes
   double envelopes_upper_arr[];
   double envelopes_lower_arr[];
   Envelopes(envelopes_upper_arr,envelopes_lower_arr,_Symbol,timeframe_currently,14,0,MODE_SMA,PRICE_CLOSE,0.1,count_num);

   currentCandle.envelopes_upper_value = envelopes_upper_arr[kdata_shift];
   currentCandle.envelopes_lower_value = envelopes_lower_arr[kdata_shift];
//printf("Envelopes");
//ArrayPrint(envelopes_upper_arr);
//ArrayPrint(envelopes_lower_arr);
//----------------------------------------Envelopes反映情况类型判定----------------------------------------
   currentCandle.envelopes_type = TypeEnvelopes(envelopes_lower_arr, envelopes_upper_arr, close_, close_1, kdata_shift);

//Force
   double force_arr[];
   Force(force_arr,_Symbol,timeframe_currently,13,MODE_SMA,VOLUME_TICK,count_num);

   currentCandle.force = force_arr[kdata_shift];

   currentCandle.force_change1 = ((force_arr[kdata_shift] - force_arr[kdata_shift+1])/(MathAbs(force_arr[kdata_shift+1])+1E-15))*100;     //force变化率
   currentCandle.force_change2 = ((force_arr[kdata_shift+1] - force_arr[kdata_shift+2])/(MathAbs(force_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.force_change3 = ((force_arr[kdata_shift+2] - force_arr[kdata_shift+3])/(MathAbs(force_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.force_change4 = ((force_arr[kdata_shift+3] - force_arr[kdata_shift+4])/(MathAbs(force_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.force_change5 = ((force_arr[kdata_shift+4] - force_arr[kdata_shift+5])/(MathAbs(force_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.force_change6 = ((force_arr[kdata_shift+5] - force_arr[kdata_shift+6])/(MathAbs(force_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.force_change7 = ((force_arr[kdata_shift+6] - force_arr[kdata_shift+7])/(MathAbs(force_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.force_change8 = ((force_arr[kdata_shift+7] - force_arr[kdata_shift+8])/(MathAbs(force_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.force_change9 = ((force_arr[kdata_shift+8] - force_arr[kdata_shift+9])/(MathAbs(force_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.force_change10 = ((force_arr[kdata_shift+9] - force_arr[kdata_shift+10])/(MathAbs(force_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.force_current_change1 = ((force_arr[kdata_shift] - force_arr[kdata_shift+1])/(MathAbs(force_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.force_current_change2 = ((force_arr[kdata_shift] - force_arr[kdata_shift+2])/(MathAbs(force_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.force_current_change3 = ((force_arr[kdata_shift] - force_arr[kdata_shift+3])/(MathAbs(force_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.force_current_change4 = ((force_arr[kdata_shift] - force_arr[kdata_shift+4])/(MathAbs(force_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.force_current_change5 = ((force_arr[kdata_shift] - force_arr[kdata_shift+5])/(MathAbs(force_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.force_current_change6 = ((force_arr[kdata_shift] - force_arr[kdata_shift+6])/(MathAbs(force_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.force_current_change7 = ((force_arr[kdata_shift] - force_arr[kdata_shift+7])/(MathAbs(force_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.force_current_change8 = ((force_arr[kdata_shift] - force_arr[kdata_shift+8])/(MathAbs(force_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.force_current_change9 = ((force_arr[kdata_shift] - force_arr[kdata_shift+9])/(MathAbs(force_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.force_current_change10 = ((force_arr[kdata_shift] - force_arr[kdata_shift+10])/(MathAbs(force_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.force_changeValue1 = force_arr[kdata_shift] - force_arr[kdata_shift+1];     //force变化值
   currentCandle.force_changeValue2 = force_arr[kdata_shift+1] - force_arr[kdata_shift+2];
   currentCandle.force_changeValue3 = force_arr[kdata_shift+2] - force_arr[kdata_shift+3];
   currentCandle.force_changeValue4 = force_arr[kdata_shift+3] - force_arr[kdata_shift+4];
   currentCandle.force_changeValue5 = force_arr[kdata_shift+4] - force_arr[kdata_shift+5];
   currentCandle.force_changeValue6 = force_arr[kdata_shift+5] - force_arr[kdata_shift+6];
   currentCandle.force_changeValue7 = force_arr[kdata_shift+6] - force_arr[kdata_shift+7];
   currentCandle.force_changeValue8 = force_arr[kdata_shift+7] - force_arr[kdata_shift+8];
   currentCandle.force_changeValue9 = force_arr[kdata_shift+8] - force_arr[kdata_shift+9];
   currentCandle.force_changeValue10 = force_arr[kdata_shift+9] - force_arr[kdata_shift+10];
//printf("Force");
//ArrayPrint(force_arr);
//----------------------------------------Force反映情况类型判定----------------------------------------
   currentCandle.force_type = TypeForce(force_arr, close_, close_1, kdata_shift);
   

//Fractals***************************************************************************************************************************************************************************
   double fractals_up_arr[];
   double fractals_down_arr[];
   Fractals(fractals_up_arr,fractals_down_arr,_Symbol,timeframe_currently,count_num);

   if(fractals_up_arr[kdata_shift] > 9E+15){
      currentCandle.fractals_up_arrow = 0;
   }
   else{
      currentCandle.fractals_up_arrow = fractals_up_arr[kdata_shift];
   }
   
   if(fractals_down_arr[kdata_shift] > 9E+15){
      currentCandle.fractals_down_arrow = 0;
   }
   else{
      currentCandle.fractals_down_arrow = fractals_down_arr[kdata_shift];
   }
//printf("Fractals");
//ArrayPrint(fractals_up_arr);
//ArrayPrint(fractals_down_arr);
//----------------------------------------Fractals反映情况类型判定----------------------------------------
   currentCandle.fractals_type = TypeFractals(fractals_up_arr, fractals_down_arr, kdata_shift);
   
//FrAMA
   double frAMA_arr[];
   FrAMA(frAMA_arr,_Symbol,timeframe_currently,14,0,PRICE_CLOSE,count_num);

   currentCandle.frAMA = frAMA_arr[kdata_shift];

   currentCandle.frAMA_change1 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+1])/frAMA_arr[kdata_shift+1])*100;     //frAMA变化率
   currentCandle.frAMA_change2 = ((frAMA_arr[kdata_shift+1] - frAMA_arr[kdata_shift+2])/frAMA_arr[kdata_shift+2])*100;
   currentCandle.frAMA_change3 = ((frAMA_arr[kdata_shift+2] - frAMA_arr[kdata_shift+3])/frAMA_arr[kdata_shift+3])*100;
   currentCandle.frAMA_change4 = ((frAMA_arr[kdata_shift+3] - frAMA_arr[kdata_shift+4])/frAMA_arr[kdata_shift+4])*100;
   currentCandle.frAMA_change5 = ((frAMA_arr[kdata_shift+4] - frAMA_arr[kdata_shift+5])/frAMA_arr[kdata_shift+5])*100;
   currentCandle.frAMA_change6 = ((frAMA_arr[kdata_shift+5] - frAMA_arr[kdata_shift+6])/frAMA_arr[kdata_shift+6])*100;
   currentCandle.frAMA_change7 = ((frAMA_arr[kdata_shift+6] - frAMA_arr[kdata_shift+7])/frAMA_arr[kdata_shift+7])*100;
   currentCandle.frAMA_change8 = ((frAMA_arr[kdata_shift+7] - frAMA_arr[kdata_shift+8])/frAMA_arr[kdata_shift+8])*100;
   currentCandle.frAMA_change9 = ((frAMA_arr[kdata_shift+8] - frAMA_arr[kdata_shift+9])/frAMA_arr[kdata_shift+9])*100;
   currentCandle.frAMA_change10 = ((frAMA_arr[kdata_shift+9] - frAMA_arr[kdata_shift+10])/frAMA_arr[kdata_shift+10])*100;

   currentCandle.frAMA_current_change1 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+1])/frAMA_arr[kdata_shift+1])*100;
   currentCandle.frAMA_current_change2 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+2])/frAMA_arr[kdata_shift+2])*100;
   currentCandle.frAMA_current_change3 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+3])/frAMA_arr[kdata_shift+3])*100;
   currentCandle.frAMA_current_change4 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+4])/frAMA_arr[kdata_shift+4])*100;
   currentCandle.frAMA_current_change5 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+5])/frAMA_arr[kdata_shift+5])*100;
   currentCandle.frAMA_current_change6 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+6])/frAMA_arr[kdata_shift+6])*100;
   currentCandle.frAMA_current_change7 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+7])/frAMA_arr[kdata_shift+7])*100;
   currentCandle.frAMA_current_change8 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+8])/frAMA_arr[kdata_shift+8])*100;
   currentCandle.frAMA_current_change9 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+9])/frAMA_arr[kdata_shift+9])*100;
   currentCandle.frAMA_current_change10 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+10])/frAMA_arr[kdata_shift+10])*100;
//printf("FrAMA");
//ArrayPrint(frAMA_arr);
//----------------------------------------FrAMA反映情况类型判定----------------------------------------
   currentCandle.frAMA_type = TypeFrAMA(frAMA_arr, close_, close_1, kdata_shift);
   
//Gator
   double gator_ups_arr[];
   double gator_up_color_arr[];
   double gator_down_arr[];
   double gator_down_color_arr[];
   Gator(gator_ups_arr,gator_up_color_arr,gator_down_arr,gator_down_color_arr,_Symbol,timeframe_currently,13,8,8,5,5,3,MODE_SMMA,PRICE_CLOSE,count_num);

   currentCandle.gator_ups = gator_ups_arr[kdata_shift];
   currentCandle.gator_up_color = gator_up_color_arr[kdata_shift];
   currentCandle.gator_downs = gator_down_arr[kdata_shift];
   currentCandle.gator_downs_color = gator_down_color_arr[kdata_shift];
//printf("Gator");
//ArrayPrint(gator_ups_arr);
//ArrayPrint(gator_up_color_arr);
//ArrayPrint(gator_down_arr);
//ArrayPrint(gator_down_color_arr);
//----------------------------------------Gator反映情况类型判定----------------------------------------
   currentCandle.gator_type = TypeGator(gator_up_color_arr, gator_down_color_arr, kdata_shift);

//Ichimoku
   double tenkan_sen_arr[];
   double kijun_sen_arr[];
   double senkou_span_A_arr[];
   double senkou_span_B_arr[];
   double chinkou_span_arr[];
   Ichimoku(tenkan_sen_arr,kijun_sen_arr,senkou_span_A_arr,senkou_span_B_arr,chinkou_span_arr,_Symbol,timeframe_currently,9,26,52,count_num);

   currentCandle.tenkan_sen = tenkan_sen_arr[kdata_shift];
   currentCandle.kijun_sen = kijun_sen_arr[kdata_shift];
   currentCandle.senkou_span_A = senkou_span_A_arr[kdata_shift];
   currentCandle.senkou_span_B = senkou_span_B_arr[kdata_shift];
   currentCandle.chinkou_span = chinkou_span_arr[kdata_shift];
//printf("Ichimoku");
//ArrayPrint(tenkan_sen_arr);
//ArrayPrint(kijun_sen_arr);
//ArrayPrint(senkou_span_A_arr);
//ArrayPrint(senkou_span_B_arr);
//ArrayPrint(chinkou_span_arr);
//----------------------------------------Ichimoku反映情况类型判定----------------------------------------
   currentCandle.ichimoku_type = TypeIchimoku(tenkan_sen_arr, kijun_sen_arr, senkou_span_A_arr, senkou_span_B_arr, close_, kdata_shift);
   
//BWMFI
   double bwmfi_value_arr[];
   double bwmfi_color_arr[];
   BWMFI(bwmfi_value_arr,bwmfi_color_arr,_Symbol,timeframe_currently,VOLUME_TICK,count_num);

   currentCandle.bwmfi_value = bwmfi_value_arr[kdata_shift];
   currentCandle.bwmfi_color = bwmfi_color_arr[kdata_shift];

   currentCandle.bwmfi_change1 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+1])/(MathAbs(bwmfi_value_arr[kdata_shift+1])+1E-15))*100;     //bwmfi变化率
   currentCandle.bwmfi_change2 = ((bwmfi_value_arr[kdata_shift+1] - bwmfi_value_arr[kdata_shift+2])/(MathAbs(bwmfi_value_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.bwmfi_change3 = ((bwmfi_value_arr[kdata_shift+2] - bwmfi_value_arr[kdata_shift+3])/(MathAbs(bwmfi_value_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.bwmfi_change4 = ((bwmfi_value_arr[kdata_shift+3] - bwmfi_value_arr[kdata_shift+4])/(MathAbs(bwmfi_value_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.bwmfi_change5 = ((bwmfi_value_arr[kdata_shift+4] - bwmfi_value_arr[kdata_shift+5])/(MathAbs(bwmfi_value_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.bwmfi_change6 = ((bwmfi_value_arr[kdata_shift+5] - bwmfi_value_arr[kdata_shift+6])/(MathAbs(bwmfi_value_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.bwmfi_change7 = ((bwmfi_value_arr[kdata_shift+6] - bwmfi_value_arr[kdata_shift+7])/(MathAbs(bwmfi_value_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.bwmfi_change8 = ((bwmfi_value_arr[kdata_shift+7] - bwmfi_value_arr[kdata_shift+8])/(MathAbs(bwmfi_value_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.bwmfi_change9 = ((bwmfi_value_arr[kdata_shift+8] - bwmfi_value_arr[kdata_shift+9])/(MathAbs(bwmfi_value_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.bwmfi_change10 = ((bwmfi_value_arr[kdata_shift+9] - bwmfi_value_arr[kdata_shift+10])/(MathAbs(bwmfi_value_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.bwmfi_current_change1 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+1])/(MathAbs(bwmfi_value_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.bwmfi_current_change2 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+2])/(MathAbs(bwmfi_value_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.bwmfi_current_change3 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+3])/(MathAbs(bwmfi_value_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.bwmfi_current_change4 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+4])/(MathAbs(bwmfi_value_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.bwmfi_current_change5 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+5])/(MathAbs(bwmfi_value_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.bwmfi_current_change6 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+6])/(MathAbs(bwmfi_value_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.bwmfi_current_change7 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+7])/(MathAbs(bwmfi_value_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.bwmfi_current_change8 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+8])/(MathAbs(bwmfi_value_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.bwmfi_current_change9 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+9])/(MathAbs(bwmfi_value_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.bwmfi_current_change10 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+10])/(MathAbs(bwmfi_value_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.bwmfi_changeValue1 = bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+1];     //bwmfi变化值
   currentCandle.bwmfi_changeValue2 = bwmfi_value_arr[kdata_shift+1] - bwmfi_value_arr[kdata_shift+2];
   currentCandle.bwmfi_changeValue3 = bwmfi_value_arr[kdata_shift+2] - bwmfi_value_arr[kdata_shift+3];
   currentCandle.bwmfi_changeValue4 = bwmfi_value_arr[kdata_shift+3] - bwmfi_value_arr[kdata_shift+4];
   currentCandle.bwmfi_changeValue5 = bwmfi_value_arr[kdata_shift+4] - bwmfi_value_arr[kdata_shift+5];
   currentCandle.bwmfi_changeValue6 = bwmfi_value_arr[kdata_shift+5] - bwmfi_value_arr[kdata_shift+6];
   currentCandle.bwmfi_changeValue7 = bwmfi_value_arr[kdata_shift+6] - bwmfi_value_arr[kdata_shift+7];
   currentCandle.bwmfi_changeValue8 = bwmfi_value_arr[kdata_shift+7] - bwmfi_value_arr[kdata_shift+8];
   currentCandle.bwmfi_changeValue9 = bwmfi_value_arr[kdata_shift+8] - bwmfi_value_arr[kdata_shift+9];
   currentCandle.bwmfi_changeValue10 = bwmfi_value_arr[kdata_shift+9] - bwmfi_value_arr[kdata_shift+10];
   
//printf("BWMFI");
//ArrayPrint(bwmfi_value_arr);
//ArrayPrint(bwmfi_color_arr);
//----------------------------------------BWMFI反映情况类型判定----------------------------------------
   currentCandle.bwmfi_type = TypeBWMFI(bwmfi_color_arr, kdata_shift);

//Momentum
   double momentum_arr[];
   Momentum(momentum_arr,_Symbol,timeframe_currently,14,PRICE_CLOSE,count_num);

   currentCandle.momentum = momentum_arr[kdata_shift];

   currentCandle.momentum_change1 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+1])/(MathAbs(momentum_arr[kdata_shift+1])+1E-15))*100;     //momentum变化率
   currentCandle.momentum_change2 = ((momentum_arr[kdata_shift+1] - momentum_arr[kdata_shift+2])/(MathAbs(momentum_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.momentum_change3 = ((momentum_arr[kdata_shift+2] - momentum_arr[kdata_shift+3])/(MathAbs(momentum_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.momentum_change4 = ((momentum_arr[kdata_shift+3] - momentum_arr[kdata_shift+4])/(MathAbs(momentum_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.momentum_change5 = ((momentum_arr[kdata_shift+4] - momentum_arr[kdata_shift+5])/(MathAbs(momentum_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.momentum_change6 = ((momentum_arr[kdata_shift+5] - momentum_arr[kdata_shift+6])/(MathAbs(momentum_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.momentum_change7 = ((momentum_arr[kdata_shift+6] - momentum_arr[kdata_shift+7])/(MathAbs(momentum_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.momentum_change8 = ((momentum_arr[kdata_shift+7] - momentum_arr[kdata_shift+8])/(MathAbs(momentum_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.momentum_change9 = ((momentum_arr[kdata_shift+8] - momentum_arr[kdata_shift+9])/(MathAbs(momentum_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.momentum_change10 = ((momentum_arr[kdata_shift+9] - momentum_arr[kdata_shift+10])/(MathAbs(momentum_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.momentum_current_change1 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+1])/(MathAbs(momentum_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.momentum_current_change2 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+2])/(MathAbs(momentum_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.momentum_current_change3 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+3])/(MathAbs(momentum_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.momentum_current_change4 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+4])/(MathAbs(momentum_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.momentum_current_change5 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+5])/(MathAbs(momentum_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.momentum_current_change6 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+6])/(MathAbs(momentum_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.momentum_current_change7 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+7])/(MathAbs(momentum_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.momentum_current_change8 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+8])/(MathAbs(momentum_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.momentum_current_change9 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+9])/(MathAbs(momentum_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.momentum_current_change10 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+10])/(MathAbs(momentum_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.momentum_changeValue1 = momentum_arr[kdata_shift] - momentum_arr[kdata_shift+1];     //momentum变化值
   currentCandle.momentum_changeValue2 = momentum_arr[kdata_shift+1] - momentum_arr[kdata_shift+2]; 
   currentCandle.momentum_changeValue3 = momentum_arr[kdata_shift+2] - momentum_arr[kdata_shift+3]; 
   currentCandle.momentum_changeValue4 = momentum_arr[kdata_shift+3] - momentum_arr[kdata_shift+4]; 
   currentCandle.momentum_changeValue5 = momentum_arr[kdata_shift+4] - momentum_arr[kdata_shift+5]; 
   currentCandle.momentum_changeValue6 = momentum_arr[kdata_shift+5] - momentum_arr[kdata_shift+6]; 
   currentCandle.momentum_changeValue7 = momentum_arr[kdata_shift+6] - momentum_arr[kdata_shift+7]; 
   currentCandle.momentum_changeValue8 = momentum_arr[kdata_shift+7] - momentum_arr[kdata_shift+8]; 
   currentCandle.momentum_changeValue9 = momentum_arr[kdata_shift+8] - momentum_arr[kdata_shift+9]; 
   currentCandle.momentum_changeValue10 = momentum_arr[kdata_shift+9] - momentum_arr[kdata_shift+10]; 
//printf("Momentum");
//ArrayPrint(momentum_arr);
//----------------------------------------Momentum反映情况类型判定----------------------------------------
   currentCandle.momentum_type = TypeMomentum(momentum_arr, kdata_shift);

//MFI
   double mfi_arr[];
   MFI(mfi_arr,_Symbol,timeframe_currently,14,VOLUME_TICK,count_num);

   currentCandle.mfi = mfi_arr[kdata_shift];

   currentCandle.mfi_change1 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+1])/(mfi_arr[kdata_shift+1]+1E-15))*100;     //mfi变化率
   currentCandle.mfi_change2 = ((mfi_arr[kdata_shift+1] - mfi_arr[kdata_shift+2])/(mfi_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.mfi_change3 = ((mfi_arr[kdata_shift+2] - mfi_arr[kdata_shift+3])/(mfi_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.mfi_change4 = ((mfi_arr[kdata_shift+3] - mfi_arr[kdata_shift+4])/(mfi_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.mfi_change5 = ((mfi_arr[kdata_shift+4] - mfi_arr[kdata_shift+5])/(mfi_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.mfi_change6 = ((mfi_arr[kdata_shift+5] - mfi_arr[kdata_shift+6])/(mfi_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.mfi_change7 = ((mfi_arr[kdata_shift+6] - mfi_arr[kdata_shift+7])/(mfi_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.mfi_change8 = ((mfi_arr[kdata_shift+7] - mfi_arr[kdata_shift+8])/(mfi_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.mfi_change9 = ((mfi_arr[kdata_shift+8] - mfi_arr[kdata_shift+9])/(mfi_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.mfi_change10 = ((mfi_arr[kdata_shift+9] - mfi_arr[kdata_shift+10])/(mfi_arr[kdata_shift+10]+1E-15))*100;

   currentCandle.mfi_current_change1 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+1])/(mfi_arr[kdata_shift+1]+1E-15))*100;
   currentCandle.mfi_current_change2 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+2])/(mfi_arr[kdata_shift+2]+1E-15))*100;
   currentCandle.mfi_current_change3 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+3])/(mfi_arr[kdata_shift+3]+1E-15))*100;
   currentCandle.mfi_current_change4 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+4])/(mfi_arr[kdata_shift+4]+1E-15))*100;
   currentCandle.mfi_current_change5 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+5])/(mfi_arr[kdata_shift+5]+1E-15))*100;
   currentCandle.mfi_current_change6 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+6])/(mfi_arr[kdata_shift+6]+1E-15))*100;
   currentCandle.mfi_current_change7 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+7])/(mfi_arr[kdata_shift+7]+1E-15))*100;
   currentCandle.mfi_current_change8 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+8])/(mfi_arr[kdata_shift+8]+1E-15))*100;
   currentCandle.mfi_current_change9 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+9])/(mfi_arr[kdata_shift+9]+1E-15))*100;
   currentCandle.mfi_current_change10 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+10])/(mfi_arr[kdata_shift+10]+1E-15))*100;
   
   currentCandle.mfi_changeValue1 = mfi_arr[kdata_shift] - mfi_arr[kdata_shift+1];     //mfi变化值
   currentCandle.mfi_changeValue2 = mfi_arr[kdata_shift+1] - mfi_arr[kdata_shift+2]; 
   currentCandle.mfi_changeValue3 = mfi_arr[kdata_shift+2] - mfi_arr[kdata_shift+3]; 
   currentCandle.mfi_changeValue4 = mfi_arr[kdata_shift+3] - mfi_arr[kdata_shift+4]; 
   currentCandle.mfi_changeValue5 = mfi_arr[kdata_shift+4] - mfi_arr[kdata_shift+5]; 
   currentCandle.mfi_changeValue6 = mfi_arr[kdata_shift+5] - mfi_arr[kdata_shift+6]; 
   currentCandle.mfi_changeValue7 = mfi_arr[kdata_shift+6] - mfi_arr[kdata_shift+7]; 
   currentCandle.mfi_changeValue8 = mfi_arr[kdata_shift+7] - mfi_arr[kdata_shift+8]; 
   currentCandle.mfi_changeValue9 = mfi_arr[kdata_shift+8] - mfi_arr[kdata_shift+9]; 
   currentCandle.mfi_changeValue10 = mfi_arr[kdata_shift+9] - mfi_arr[kdata_shift+10]; 
//printf("MFI");
//ArrayPrint(mfi_arr);
//----------------------------------------MFI反映情况类型判定----------------------------------------
   currentCandle.mfi_type = TypeMFI(mfi_arr, kdata_shift);
   
//OsMA
   double osMA_arr[];
   OsMA(osMA_arr,_Symbol,timeframe_currently,12,26,9,PRICE_CLOSE,count_num);

   currentCandle.osMA = osMA_arr[kdata_shift];

   currentCandle.osMA_change1 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+1])/(MathAbs(osMA_arr[kdata_shift+1])+1E-15))*100;     //osMA变化率
   currentCandle.osMA_change2 = ((osMA_arr[kdata_shift+1] - osMA_arr[kdata_shift+2])/(MathAbs(osMA_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.osMA_change3 = ((osMA_arr[kdata_shift+2] - osMA_arr[kdata_shift+3])/(MathAbs(osMA_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.osMA_change4 = ((osMA_arr[kdata_shift+3] - osMA_arr[kdata_shift+4])/(MathAbs(osMA_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.osMA_change5 = ((osMA_arr[kdata_shift+4] - osMA_arr[kdata_shift+5])/(MathAbs(osMA_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.osMA_change6 = ((osMA_arr[kdata_shift+5] - osMA_arr[kdata_shift+6])/(MathAbs(osMA_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.osMA_change7 = ((osMA_arr[kdata_shift+6] - osMA_arr[kdata_shift+7])/(MathAbs(osMA_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.osMA_change8 = ((osMA_arr[kdata_shift+7] - osMA_arr[kdata_shift+8])/(MathAbs(osMA_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.osMA_change9 = ((osMA_arr[kdata_shift+8] - osMA_arr[kdata_shift+9])/(MathAbs(osMA_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.osMA_change10 = ((osMA_arr[kdata_shift+9] - osMA_arr[kdata_shift+10])/(MathAbs(osMA_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.osMA_current_change1 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+1])/(MathAbs(osMA_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.osMA_current_change2 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+2])/(MathAbs(osMA_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.osMA_current_change3 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+3])/(MathAbs(osMA_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.osMA_current_change4 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+4])/(MathAbs(osMA_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.osMA_current_change5 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+5])/(MathAbs(osMA_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.osMA_current_change6 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+6])/(MathAbs(osMA_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.osMA_current_change7 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+7])/(MathAbs(osMA_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.osMA_current_change8 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+8])/(MathAbs(osMA_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.osMA_current_change9 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+9])/(MathAbs(osMA_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.osMA_current_change10 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+10])/(MathAbs(osMA_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.osMA_changeValue1 = osMA_arr[kdata_shift] - osMA_arr[kdata_shift+1];
   currentCandle.osMA_changeValue2 = osMA_arr[kdata_shift+1] - osMA_arr[kdata_shift+2];
   currentCandle.osMA_changeValue3 = osMA_arr[kdata_shift+2] - osMA_arr[kdata_shift+3];
   currentCandle.osMA_changeValue4 = osMA_arr[kdata_shift+3] - osMA_arr[kdata_shift+4];
   currentCandle.osMA_changeValue5 = osMA_arr[kdata_shift+4] - osMA_arr[kdata_shift+5];
   currentCandle.osMA_changeValue6 = osMA_arr[kdata_shift+5] - osMA_arr[kdata_shift+6];
   currentCandle.osMA_changeValue7 = osMA_arr[kdata_shift+6] - osMA_arr[kdata_shift+7];
   currentCandle.osMA_changeValue8 = osMA_arr[kdata_shift+7] - osMA_arr[kdata_shift+8];
   currentCandle.osMA_changeValue9 = osMA_arr[kdata_shift+8] - osMA_arr[kdata_shift+9];
   currentCandle.osMA_changeValue10 = osMA_arr[kdata_shift+9] - osMA_arr[kdata_shift+10];
//printf("OsMA");
//ArrayPrint(osMA_arr);
//----------------------------------------OsMA反映情况类型判定----------------------------------------
   currentCandle.osMA_type = TypeOsMA(osMA_arr, kdata_shift);
   
//OBV
   double obv_arr[];
   OBV(obv_arr,_Symbol,timeframe_currently,VOLUME_TICK,count_num);

   currentCandle.obv = obv_arr[kdata_shift];

   currentCandle.obv_change1 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+1])/(MathAbs(obv_arr[kdata_shift+1])+1E-15))*100;     //obv变化率
   currentCandle.obv_change2 = ((obv_arr[kdata_shift+1] - obv_arr[kdata_shift+2])/(MathAbs(obv_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.obv_change3 = ((obv_arr[kdata_shift+2] - obv_arr[kdata_shift+3])/(MathAbs(obv_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.obv_change4 = ((obv_arr[kdata_shift+3] - obv_arr[kdata_shift+4])/(MathAbs(obv_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.obv_change5 = ((obv_arr[kdata_shift+4] - obv_arr[kdata_shift+5])/(MathAbs(obv_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.obv_change6 = ((obv_arr[kdata_shift+5] - obv_arr[kdata_shift+6])/(MathAbs(obv_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.obv_change7 = ((obv_arr[kdata_shift+6] - obv_arr[kdata_shift+7])/(MathAbs(obv_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.obv_change8 = ((obv_arr[kdata_shift+7] - obv_arr[kdata_shift+8])/(MathAbs(obv_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.obv_change9 = ((obv_arr[kdata_shift+8] - obv_arr[kdata_shift+9])/(MathAbs(obv_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.obv_change10 = ((obv_arr[kdata_shift+9] - obv_arr[kdata_shift+10])/(MathAbs(obv_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.obv_current_change1 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+1])/(MathAbs(obv_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.obv_current_change2 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+2])/(MathAbs(obv_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.obv_current_change3 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+3])/(MathAbs(obv_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.obv_current_change4 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+4])/(MathAbs(obv_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.obv_current_change5 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+5])/(MathAbs(obv_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.obv_current_change6 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+6])/(MathAbs(obv_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.obv_current_change7 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+7])/(MathAbs(obv_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.obv_current_change8 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+8])/(MathAbs(obv_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.obv_current_change9 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+9])/(MathAbs(obv_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.obv_current_change10 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+10])/(MathAbs(obv_arr[kdata_shift+10])+1E-15))*100;
//printf("OBV");
//ArrayPrint(obv_arr);
//----------------------------------------OBV反映情况类型判定----------------------------------------
   currentCandle.obv_type = TypeOBV(obv_arr, close_, close_1, kdata_shift);
   
//RVI
   double rvi_arr[];
   double rvi_signal_arr[];
   RVI(rvi_arr,rvi_signal_arr,_Symbol,timeframe_currently,10,count_num);

   currentCandle.rvi = rvi_arr[kdata_shift];
   currentCandle.rvi_signal = rvi_signal_arr[kdata_shift];

   currentCandle.rvi_change1 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+1])/(MathAbs(rvi_arr[kdata_shift+1])+1E-15))*100;     //rvi变化率
   currentCandle.rvi_change2 = ((rvi_arr[kdata_shift+1] - rvi_arr[kdata_shift+2])/(MathAbs(rvi_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.rvi_change3 = ((rvi_arr[kdata_shift+2] - rvi_arr[kdata_shift+3])/(MathAbs(rvi_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.rvi_change4 = ((rvi_arr[kdata_shift+3] - rvi_arr[kdata_shift+4])/(MathAbs(rvi_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.rvi_change5 = ((rvi_arr[kdata_shift+4] - rvi_arr[kdata_shift+5])/(MathAbs(rvi_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.rvi_change6 = ((rvi_arr[kdata_shift+5] - rvi_arr[kdata_shift+6])/(MathAbs(rvi_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.rvi_change7 = ((rvi_arr[kdata_shift+6] - rvi_arr[kdata_shift+7])/(MathAbs(rvi_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.rvi_change8 = ((rvi_arr[kdata_shift+7] - rvi_arr[kdata_shift+8])/(MathAbs(rvi_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.rvi_change9 = ((rvi_arr[kdata_shift+8] - rvi_arr[kdata_shift+9])/(MathAbs(rvi_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.rvi_change10 = ((rvi_arr[kdata_shift+9] - rvi_arr[kdata_shift+10])/(MathAbs(rvi_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.rvi_current_change1 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+1])/(MathAbs(rvi_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.rvi_current_change2 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+2])/(MathAbs(rvi_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.rvi_current_change3 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+3])/(MathAbs(rvi_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.rvi_current_change4 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+4])/(MathAbs(rvi_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.rvi_current_change5 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+5])/(MathAbs(rvi_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.rvi_current_change6 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+6])/(MathAbs(rvi_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.rvi_current_change7 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+7])/(MathAbs(rvi_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.rvi_current_change8 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+8])/(MathAbs(rvi_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.rvi_current_change9 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+9])/(MathAbs(rvi_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.rvi_current_change10 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+10])/(MathAbs(rvi_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.rvi_changeValue1 = rvi_arr[kdata_shift] - rvi_arr[kdata_shift+1];     //rvi变化值
   currentCandle.rvi_changeValue2 = rvi_arr[kdata_shift+1] - rvi_arr[kdata_shift+2];
   currentCandle.rvi_changeValue3 = rvi_arr[kdata_shift+2] - rvi_arr[kdata_shift+3];
   currentCandle.rvi_changeValue4 = rvi_arr[kdata_shift+3] - rvi_arr[kdata_shift+4];
   currentCandle.rvi_changeValue5 = rvi_arr[kdata_shift+4] - rvi_arr[kdata_shift+5];
   currentCandle.rvi_changeValue6 = rvi_arr[kdata_shift+5] - rvi_arr[kdata_shift+6];
   currentCandle.rvi_changeValue7 = rvi_arr[kdata_shift+6] - rvi_arr[kdata_shift+7];
   currentCandle.rvi_changeValue8 = rvi_arr[kdata_shift+7] - rvi_arr[kdata_shift+8];
   currentCandle.rvi_changeValue9 = rvi_arr[kdata_shift+8] - rvi_arr[kdata_shift+9];
   currentCandle.rvi_changeValue10 = rvi_arr[kdata_shift+9] - rvi_arr[kdata_shift+10];
//printf("RVI");
//ArrayPrint(rvi_arr);
//ArrayPrint(rvi_signal_arr);
//----------------------------------------RVI反映情况类型判定----------------------------------------
   currentCandle.rvi_type = TypeRVI(rvi_arr, rvi_signal_arr, kdata_shift);
   
//StdDev
   double stdDev_arr[];
   StdDev(stdDev_arr,_Symbol,timeframe_currently,20,0,MODE_SMA,PRICE_CLOSE,count_num);

   currentCandle.stdDev = stdDev_arr[kdata_shift];

   currentCandle.stdDev_change1 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+1])/stdDev_arr[kdata_shift+1])*100;     //stdDev变化率
   currentCandle.stdDev_change2 = ((stdDev_arr[kdata_shift+1] - stdDev_arr[kdata_shift+2])/stdDev_arr[kdata_shift+2])*100;
   currentCandle.stdDev_change3 = ((stdDev_arr[kdata_shift+2] - stdDev_arr[kdata_shift+3])/stdDev_arr[kdata_shift+3])*100;
   currentCandle.stdDev_change4 = ((stdDev_arr[kdata_shift+3] - stdDev_arr[kdata_shift+4])/stdDev_arr[kdata_shift+4])*100;
   currentCandle.stdDev_change5 = ((stdDev_arr[kdata_shift+4] - stdDev_arr[kdata_shift+5])/stdDev_arr[kdata_shift+5])*100;
   currentCandle.stdDev_change6 = ((stdDev_arr[kdata_shift+5] - stdDev_arr[kdata_shift+6])/stdDev_arr[kdata_shift+6])*100;
   currentCandle.stdDev_change7 = ((stdDev_arr[kdata_shift+6] - stdDev_arr[kdata_shift+7])/stdDev_arr[kdata_shift+7])*100;
   currentCandle.stdDev_change8 = ((stdDev_arr[kdata_shift+7] - stdDev_arr[kdata_shift+8])/stdDev_arr[kdata_shift+8])*100;
   currentCandle.stdDev_change9 = ((stdDev_arr[kdata_shift+8] - stdDev_arr[kdata_shift+9])/stdDev_arr[kdata_shift+9])*100;
   currentCandle.stdDev_change10 = ((stdDev_arr[kdata_shift+9] - stdDev_arr[kdata_shift+10])/stdDev_arr[kdata_shift+10])*100;

   currentCandle.stdDev_current_change1 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+1])/stdDev_arr[kdata_shift+1])*100;
   currentCandle.stdDev_current_change2 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+2])/stdDev_arr[kdata_shift+2])*100;
   currentCandle.stdDev_current_change3 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+3])/stdDev_arr[kdata_shift+3])*100;
   currentCandle.stdDev_current_change4 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+4])/stdDev_arr[kdata_shift+4])*100;
   currentCandle.stdDev_current_change5 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+5])/stdDev_arr[kdata_shift+5])*100;
   currentCandle.stdDev_current_change6 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+6])/stdDev_arr[kdata_shift+6])*100;
   currentCandle.stdDev_current_change7 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+7])/stdDev_arr[kdata_shift+7])*100;
   currentCandle.stdDev_current_change8 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+8])/stdDev_arr[kdata_shift+8])*100;
   currentCandle.stdDev_current_change9 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+9])/stdDev_arr[kdata_shift+9])*100;
   currentCandle.stdDev_current_change10 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+10])/stdDev_arr[kdata_shift+10])*100;
   
   currentCandle.stdDev_changeValue1 = stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+1];     //stdDev变化值
   currentCandle.stdDev_changeValue2 = stdDev_arr[kdata_shift+1] - stdDev_arr[kdata_shift+2];
   currentCandle.stdDev_changeValue3 = stdDev_arr[kdata_shift+2] - stdDev_arr[kdata_shift+3];
   currentCandle.stdDev_changeValue4 = stdDev_arr[kdata_shift+3] - stdDev_arr[kdata_shift+4];
   currentCandle.stdDev_changeValue5 = stdDev_arr[kdata_shift+4] - stdDev_arr[kdata_shift+5];
   currentCandle.stdDev_changeValue6 = stdDev_arr[kdata_shift+5] - stdDev_arr[kdata_shift+6];
   currentCandle.stdDev_changeValue7 = stdDev_arr[kdata_shift+6] - stdDev_arr[kdata_shift+7];
   currentCandle.stdDev_changeValue8 = stdDev_arr[kdata_shift+7] - stdDev_arr[kdata_shift+8];
   currentCandle.stdDev_changeValue9 = stdDev_arr[kdata_shift+8] - stdDev_arr[kdata_shift+9];
   currentCandle.stdDev_changeValue10 = stdDev_arr[kdata_shift+9] - stdDev_arr[kdata_shift+10];
//printf("StdDev");
//ArrayPrint(stdDev_arr);
//----------------------------------------StdDev反映情况类型判定----------------------------------------
   currentCandle.stdDev_type = TypeStdDev(stdDev_arr, kdata_shift);

//TEMA
   double tema_arr[];
   TEMA(tema_arr,_Symbol,timeframe_currently,14,0,PRICE_CLOSE,count_num);

   currentCandle.tema = tema_arr[kdata_shift];

   currentCandle.tema_change1 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+1])/tema_arr[kdata_shift+1])*100;     //tema变化率
   currentCandle.tema_change2 = ((tema_arr[kdata_shift+1] - tema_arr[kdata_shift+2])/tema_arr[kdata_shift+2])*100;
   currentCandle.tema_change3 = ((tema_arr[kdata_shift+2] - tema_arr[kdata_shift+3])/tema_arr[kdata_shift+3])*100;
   currentCandle.tema_change4 = ((tema_arr[kdata_shift+3] - tema_arr[kdata_shift+4])/tema_arr[kdata_shift+4])*100;
   currentCandle.tema_change5 = ((tema_arr[kdata_shift+4] - tema_arr[kdata_shift+5])/tema_arr[kdata_shift+5])*100;
   currentCandle.tema_change6 = ((tema_arr[kdata_shift+5] - tema_arr[kdata_shift+6])/tema_arr[kdata_shift+6])*100;
   currentCandle.tema_change7 = ((tema_arr[kdata_shift+6] - tema_arr[kdata_shift+7])/tema_arr[kdata_shift+7])*100;
   currentCandle.tema_change8 = ((tema_arr[kdata_shift+7] - tema_arr[kdata_shift+8])/tema_arr[kdata_shift+8])*100;
   currentCandle.tema_change9 = ((tema_arr[kdata_shift+8] - tema_arr[kdata_shift+9])/tema_arr[kdata_shift+9])*100;
   currentCandle.tema_change10 = ((tema_arr[kdata_shift+9] - tema_arr[kdata_shift+10])/tema_arr[kdata_shift+10])*100;

   currentCandle.tema_current_change1 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+1])/tema_arr[kdata_shift+1])*100;
   currentCandle.tema_current_change2 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+2])/tema_arr[kdata_shift+2])*100;
   currentCandle.tema_current_change3 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+3])/tema_arr[kdata_shift+3])*100;
   currentCandle.tema_current_change4 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+4])/tema_arr[kdata_shift+4])*100;
   currentCandle.tema_current_change5 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+5])/tema_arr[kdata_shift+5])*100;
   currentCandle.tema_current_change6 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+6])/tema_arr[kdata_shift+6])*100;
   currentCandle.tema_current_change7 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+7])/tema_arr[kdata_shift+7])*100;
   currentCandle.tema_current_change8 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+8])/tema_arr[kdata_shift+8])*100;
   currentCandle.tema_current_change9 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+9])/tema_arr[kdata_shift+9])*100;
   currentCandle.tema_current_change10 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+10])/tema_arr[kdata_shift+10])*100;
//printf("TEMA");
//ArrayPrint(tema_arr);
//----------------------------------------TEMA反映情况类型判定----------------------------------------
   currentCandle.tema_type = TypeTEMA(tema_arr, close_, close_1, kdata_shift);
   
//TriX
   double triX_arr[];
   TriX(triX_arr,_Symbol,timeframe_currently,14,PRICE_CLOSE,count_num);

   currentCandle.triX = triX_arr[kdata_shift];

   currentCandle.triX_change1 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+1])/(MathAbs(triX_arr[kdata_shift+1])+1E-15))*100;     //triX变化率
   currentCandle.triX_change2 = ((triX_arr[kdata_shift+1] - triX_arr[kdata_shift+2])/(MathAbs(triX_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.triX_change3 = ((triX_arr[kdata_shift+2] - triX_arr[kdata_shift+3])/(MathAbs(triX_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.triX_change4 = ((triX_arr[kdata_shift+3] - triX_arr[kdata_shift+4])/(MathAbs(triX_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.triX_change5 = ((triX_arr[kdata_shift+4] - triX_arr[kdata_shift+5])/(MathAbs(triX_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.triX_change6 = ((triX_arr[kdata_shift+5] - triX_arr[kdata_shift+6])/(MathAbs(triX_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.triX_change7 = ((triX_arr[kdata_shift+6] - triX_arr[kdata_shift+7])/(MathAbs(triX_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.triX_change8 = ((triX_arr[kdata_shift+7] - triX_arr[kdata_shift+8])/(MathAbs(triX_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.triX_change9 = ((triX_arr[kdata_shift+8] - triX_arr[kdata_shift+9])/(MathAbs(triX_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.triX_change10 = ((triX_arr[kdata_shift+9] - triX_arr[kdata_shift+10])/(MathAbs(triX_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.triX_current_change1 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+1])/(MathAbs(triX_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.triX_current_change2 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+2])/(MathAbs(triX_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.triX_current_change3 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+3])/(MathAbs(triX_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.triX_current_change4 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+4])/(MathAbs(triX_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.triX_current_change5 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+5])/(MathAbs(triX_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.triX_current_change6 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+6])/(MathAbs(triX_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.triX_current_change7 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+7])/(MathAbs(triX_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.triX_current_change8 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+8])/(MathAbs(triX_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.triX_current_change9 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+9])/(MathAbs(triX_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.triX_current_change10 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+10])/(MathAbs(triX_arr[kdata_shift+10])+1E-15))*100;
//printf("TriX");
//ArrayPrint(triX_arr);
//----------------------------------------TriX反映情况类型判定----------------------------------------
   currentCandle.triX_type = TypeTriX(triX_arr, kdata_shift);
   
//WPR
   double wpr_arr[];
   WPR(wpr_arr,_Symbol,timeframe_currently,14,count_num);

   currentCandle.wpr = wpr_arr[kdata_shift];

   currentCandle.wpr_change1 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+1])/(MathAbs(wpr_arr[kdata_shift+1])+1E-15))*100;     //wpr变化率
   currentCandle.wpr_change2 = ((wpr_arr[kdata_shift+1] - wpr_arr[kdata_shift+2])/(MathAbs(wpr_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.wpr_change3 = ((wpr_arr[kdata_shift+2] - wpr_arr[kdata_shift+3])/(MathAbs(wpr_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.wpr_change4 = ((wpr_arr[kdata_shift+3] - wpr_arr[kdata_shift+4])/(MathAbs(wpr_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.wpr_change5 = ((wpr_arr[kdata_shift+4] - wpr_arr[kdata_shift+5])/(MathAbs(wpr_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.wpr_change6 = ((wpr_arr[kdata_shift+5] - wpr_arr[kdata_shift+6])/(MathAbs(wpr_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.wpr_change7 = ((wpr_arr[kdata_shift+6] - wpr_arr[kdata_shift+7])/(MathAbs(wpr_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.wpr_change8 = ((wpr_arr[kdata_shift+7] - wpr_arr[kdata_shift+8])/(MathAbs(wpr_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.wpr_change9 = ((wpr_arr[kdata_shift+8] - wpr_arr[kdata_shift+9])/(MathAbs(wpr_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.wpr_change10 = ((wpr_arr[kdata_shift+9] - wpr_arr[kdata_shift+10])/(MathAbs(wpr_arr[kdata_shift+10])+1E-15))*100;

   currentCandle.wpr_current_change1 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+1])/(MathAbs(wpr_arr[kdata_shift+1])+1E-15))*100;
   currentCandle.wpr_current_change2 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+2])/(MathAbs(wpr_arr[kdata_shift+2])+1E-15))*100;
   currentCandle.wpr_current_change3 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+3])/(MathAbs(wpr_arr[kdata_shift+3])+1E-15))*100;
   currentCandle.wpr_current_change4 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+4])/(MathAbs(wpr_arr[kdata_shift+4])+1E-15))*100;
   currentCandle.wpr_current_change5 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+5])/(MathAbs(wpr_arr[kdata_shift+5])+1E-15))*100;
   currentCandle.wpr_current_change6 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+6])/(MathAbs(wpr_arr[kdata_shift+6])+1E-15))*100;
   currentCandle.wpr_current_change7 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+7])/(MathAbs(wpr_arr[kdata_shift+7])+1E-15))*100;
   currentCandle.wpr_current_change8 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+8])/(MathAbs(wpr_arr[kdata_shift+8])+1E-15))*100;
   currentCandle.wpr_current_change9 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+9])/(MathAbs(wpr_arr[kdata_shift+9])+1E-15))*100;
   currentCandle.wpr_current_change10 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+10])/(MathAbs(wpr_arr[kdata_shift+10])+1E-15))*100;
   
   currentCandle.wpr_changeValue1 = wpr_arr[kdata_shift] - wpr_arr[kdata_shift+1];     //wpr变化值
   currentCandle.wpr_changeValue2 = wpr_arr[kdata_shift+1] - wpr_arr[kdata_shift+2];
   currentCandle.wpr_changeValue3 = wpr_arr[kdata_shift+2] - wpr_arr[kdata_shift+3];
   currentCandle.wpr_changeValue4 = wpr_arr[kdata_shift+3] - wpr_arr[kdata_shift+4];
   currentCandle.wpr_changeValue5 = wpr_arr[kdata_shift+4] - wpr_arr[kdata_shift+5];
   currentCandle.wpr_changeValue6 = wpr_arr[kdata_shift+5] - wpr_arr[kdata_shift+6];
   currentCandle.wpr_changeValue7 = wpr_arr[kdata_shift+6] - wpr_arr[kdata_shift+7];
   currentCandle.wpr_changeValue8 = wpr_arr[kdata_shift+7] - wpr_arr[kdata_shift+8];
   currentCandle.wpr_changeValue9 = wpr_arr[kdata_shift+8] - wpr_arr[kdata_shift+9];
   currentCandle.wpr_changeValue10 = wpr_arr[kdata_shift+9] - wpr_arr[kdata_shift+10];
//printf("WPR");
//ArrayPrint(wpr_arr);
//----------------------------------------WPR反映情况类型判定----------------------------------------
   currentCandle.wpr_type = TypeWPR(wpr_arr, kdata_shift);
   
//VIDyA
   double vidya_arr[];
   VIDyA(vidya_arr,_Symbol,timeframe_currently,15,12,0,PRICE_CLOSE,count_num);

   currentCandle.vidya = vidya_arr[kdata_shift];

   currentCandle.vidya_change1 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+1])/vidya_arr[kdata_shift+1])*100;     //vidya变化率
   currentCandle.vidya_change2 = ((vidya_arr[kdata_shift+1] - vidya_arr[kdata_shift+2])/vidya_arr[kdata_shift+2])*100;
   currentCandle.vidya_change3 = ((vidya_arr[kdata_shift+2] - vidya_arr[kdata_shift+3])/vidya_arr[kdata_shift+3])*100;
   currentCandle.vidya_change4 = ((vidya_arr[kdata_shift+3] - vidya_arr[kdata_shift+4])/vidya_arr[kdata_shift+4])*100;
   currentCandle.vidya_change5 = ((vidya_arr[kdata_shift+4] - vidya_arr[kdata_shift+5])/vidya_arr[kdata_shift+5])*100;
   currentCandle.vidya_change6 = ((vidya_arr[kdata_shift+5] - vidya_arr[kdata_shift+6])/vidya_arr[kdata_shift+6])*100;
   currentCandle.vidya_change7 = ((vidya_arr[kdata_shift+6] - vidya_arr[kdata_shift+7])/vidya_arr[kdata_shift+7])*100;
   currentCandle.vidya_change8 = ((vidya_arr[kdata_shift+7] - vidya_arr[kdata_shift+8])/vidya_arr[kdata_shift+8])*100;
   currentCandle.vidya_change9 = ((vidya_arr[kdata_shift+8] - vidya_arr[kdata_shift+9])/vidya_arr[kdata_shift+9])*100;
   currentCandle.vidya_change10 = ((vidya_arr[kdata_shift+9] - vidya_arr[kdata_shift+10])/vidya_arr[kdata_shift+10])*100;

   currentCandle.vidya_current_change1 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+1])/vidya_arr[kdata_shift+1])*100;
   currentCandle.vidya_current_change2 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+2])/vidya_arr[kdata_shift+2])*100;
   currentCandle.vidya_current_change3 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+3])/vidya_arr[kdata_shift+3])*100;
   currentCandle.vidya_current_change4 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+4])/vidya_arr[kdata_shift+4])*100;
   currentCandle.vidya_current_change5 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+5])/vidya_arr[kdata_shift+5])*100;
   currentCandle.vidya_current_change6 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+6])/vidya_arr[kdata_shift+6])*100;
   currentCandle.vidya_current_change7 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+7])/vidya_arr[kdata_shift+7])*100;
   currentCandle.vidya_current_change8 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+8])/vidya_arr[kdata_shift+8])*100;
   currentCandle.vidya_current_change9 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+9])/vidya_arr[kdata_shift+9])*100;
   currentCandle.vidya_current_change10 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+10])/vidya_arr[kdata_shift+10])*100;
//printf("VIDyA");
//ArrayPrint(vidya_arr);
//----------------------------------------VIDyA反映情况类型判定----------------------------------------
   currentCandle.vidya_type = TypeVIDyA(vidya_arr, close_, close_1, kdata_shift);

// 动态数组
   ArrayResize(Cdata, ArraySize(Cdata) + 1);
   Cdata[ArraySize(Cdata) - 1] = currentCandle;
   Print("ArraySize(Cdata)     ",ArraySize(Cdata));
   return true;
  }
//+------------------------------------------------------------------+

