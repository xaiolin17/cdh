//+------------------------------------------------------------------+
//|                                      .mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#include <GetAllData\technicalIndexAll.mqh>
#include <GetAllData\IndexType.mqh>

//---统一对结构体进行赋值

//+------------------------------------------------------------------+
//|        保存数据到结构体数组                                      |
//+------------------------------------------------------------------+
void cycUseDATA(ENUM_TIMEFRAMES timeframe_currently,int kdata_shift,int count_num,double history_min,double history_max,double &high_history[],double &low_history[],double &Data[])
  {

//---保存K线数据

   datetime time = TimeCurrent();
   double open = iOpen(Symbol(), PERIOD_CURRENT, 1);
   double high = iHigh(Symbol(), timeframe_currently, kdata_shift);
   double low = iLow(Symbol(), timeframe_currently, kdata_shift);
   double close = iClose(Symbol(), timeframe_currently, kdata_shift);
   long volume = iVolume(Symbol(), timeframe_currently, kdata_shift);

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
   double open_11 = iOpen(Symbol(), timeframe_currently, kdata_shift+11);
   double open_12 = iOpen(Symbol(), timeframe_currently, kdata_shift+12);
   double open_13 = iOpen(Symbol(), timeframe_currently, kdata_shift+13);
   double open_14 = iOpen(Symbol(), timeframe_currently, kdata_shift+14);
   double open_15 = iOpen(Symbol(), timeframe_currently, kdata_shift+15);
   double open_16 = iOpen(Symbol(), timeframe_currently, kdata_shift+16);
   double open_17 = iOpen(Symbol(), timeframe_currently, kdata_shift+17);
   double open_18 = iOpen(Symbol(), timeframe_currently, kdata_shift+18);
   double open_19 = iOpen(Symbol(), timeframe_currently, kdata_shift+19);
   double open_20 = iOpen(Symbol(), timeframe_currently, kdata_shift+20);


   double open_change1 = ((open_ - open_1)/open_1)*100;      // 前1天开盘价变化 （当前-前1）/前1
   double open_change2 = ((open_1 - open_2)/open_2)*100;
   double open_change3 = ((open_2 - open_3)/open_3)*100;
   double open_change4 = ((open_3 - open_4)/open_4)*100;
   double open_change5 = ((open_4 - open_5)/open_5)*100;
   double open_change6 = ((open_5 - open_6)/open_6)*100;
   double open_change7 = ((open_6 - open_7)/open_7)*100;
   double open_change8 = ((open_7 - open_8)/open_8)*100;
   double open_change9 = ((open_8 - open_9)/open_9)*100;
   double open_change10 = ((open_9 - open_10)/open_10)*100;
   double open_change11 = ((open_10 - open_11)/open_11)*100;
   double open_change12 = ((open_11 - open_12)/open_12)*100;
   double open_change13 = ((open_12 - open_13)/open_13)*100;
   double open_change14 = ((open_13 - open_14)/open_14)*100;
   double open_change15 = ((open_14 - open_15)/open_15)*100;
   double open_change16 = ((open_15 - open_16)/open_16)*100;
   double open_change17 = ((open_16 - open_17)/open_17)*100;
   double open_change18 = ((open_17 - open_18)/open_18)*100;
   double open_change19 = ((open_18 - open_19)/open_19)*100;
   double open_change20 = ((open_19 - open_20)/open_20)*100;

   double open_current_change2 = ((open_ - open_2)/open_2)*100;     //当前开盘价与之前开盘价变化率
   double open_current_change3 = ((open_ - open_3)/open_3)*100;
   double open_current_change4 = ((open_ - open_4)/open_4)*100;
   double open_current_change5 = ((open_ - open_5)/open_5)*100;
   double open_current_change6 = ((open_ - open_6)/open_6)*100;
   double open_current_change7 = ((open_ - open_7)/open_7)*100;
   double open_current_change8 = ((open_ - open_8)/open_8)*100;
   double open_current_change9 = ((open_ - open_9)/open_9)*100;
   double open_current_change10 = ((open_ - open_10)/open_10)*100;
   double open_current_change11 = ((open_ - open_11)/open_11)*100;
   double open_current_change12 = ((open_ - open_12)/open_12)*100;
   double open_current_change13 = ((open_ - open_13)/open_13)*100;
   double open_current_change14 = ((open_ - open_14)/open_14)*100;
   double open_current_change15 = ((open_ - open_15)/open_15)*100;
   double open_current_change16 = ((open_ - open_16)/open_16)*100;
   double open_current_change17 = ((open_ - open_17)/open_17)*100;
   double open_current_change18 = ((open_ - open_18)/open_18)*100;
   double open_current_change19 = ((open_ - open_19)/open_19)*100;
   double open_current_change20 = ((open_ - open_20)/open_20)*100;

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
   double high_11 = iHigh(Symbol(), timeframe_currently, kdata_shift+11);
   double high_12 = iHigh(Symbol(), timeframe_currently, kdata_shift+12);
   double high_13 = iHigh(Symbol(), timeframe_currently, kdata_shift+13);
   double high_14 = iHigh(Symbol(), timeframe_currently, kdata_shift+14);
   double high_15 = iHigh(Symbol(), timeframe_currently, kdata_shift+15);
   double high_16 = iHigh(Symbol(), timeframe_currently, kdata_shift+16);
   double high_17 = iHigh(Symbol(), timeframe_currently, kdata_shift+17);
   double high_18 = iHigh(Symbol(), timeframe_currently, kdata_shift+18);
   double high_19 = iHigh(Symbol(), timeframe_currently, kdata_shift+19);
   double high_20 = iHigh(Symbol(), timeframe_currently, kdata_shift+20);

   double high_change1 = ((high_ - high_1)/high_1)*100;       // 前1天最高价变化 （当前-前1）/前1
   double high_change2 = ((high_1 - high_2)/high_2)*100;
   double high_change3 = ((high_2 - high_3)/high_3)*100;
   double high_change4 = ((high_3 - high_4)/high_4)*100;
   double high_change5 = ((high_4 - high_5)/high_5)*100;
   double high_change6 = ((high_5 - high_6)/high_6)*100;
   double high_change7 = ((high_6 - high_7)/high_7)*100;
   double high_change8 = ((high_7 - high_8)/high_8)*100;
   double high_change9 = ((high_8 - high_9)/high_9)*100;
   double high_change10 = ((high_9 - high_10)/high_10)*100;
   double high_change11 = ((high_10 - high_11)/high_11)*100;
   double high_change12 = ((high_11 - high_12)/high_12)*100;
   double high_change13 = ((high_12 - high_13)/high_13)*100;
   double high_change14 = ((high_13 - high_14)/high_14)*100;
   double high_change15 = ((high_14 - high_15)/high_15)*100;
   double high_change16 = ((high_15 - high_16)/high_16)*100;
   double high_change17 = ((high_16 - high_17)/high_17)*100;
   double high_change18 = ((high_17 - high_18)/high_18)*100;
   double high_change19 = ((high_18 - high_19)/high_19)*100;
   double high_change20 = ((high_19 - high_20)/high_20)*100;

   double highopen_current_change0 = ((high_ - open_)/open_)*100;     // 前最高价与之前开盘价变化率
   double highopen_current_change1 = ((high_ - open_1)/open_1)*100;
   double highopen_current_change2 = ((high_ - open_2)/open_2)*100;
   double highopen_current_change3 = ((high_ - open_3)/open_3)*100;
   double highopen_current_change4 = ((high_ - open_4)/open_4)*100;
   double highopen_current_change5 = ((high_ - open_5)/open_5)*100;
   double highopen_current_change6 = ((high_ - open_6)/open_6)*100;
   double highopen_current_change7 = ((high_ - open_7)/open_7)*100;
   double highopen_current_change8 = ((high_ - open_8)/open_8)*100;
   double highopen_current_change9 = ((high_ - open_9)/open_9)*100;
   double highopen_current_change10 = ((high_ - open_10)/open_10)*100;
   double highopen_current_change11 = ((high_ - open_11)/open_11)*100;
   double highopen_current_change12 = ((high_ - open_12)/open_12)*100;
   double highopen_current_change13 = ((high_ - open_13)/open_13)*100;
   double highopen_current_change14 = ((high_ - open_14)/open_14)*100;
   double highopen_current_change15 = ((high_ - open_15)/open_15)*100;
   double highopen_current_change16 = ((high_ - open_16)/open_16)*100;
   double highopen_current_change17 = ((high_ - open_17)/open_17)*100;
   double highopen_current_change18 = ((high_ - open_18)/open_18)*100;
   double highopen_current_change19 = ((high_ - open_19)/open_19)*100;
   double highopen_current_change20 = ((high_ - open_20)/open_20)*100;

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
   double low_11 = iLow(Symbol(), timeframe_currently, kdata_shift+11);
   double low_12 = iLow(Symbol(), timeframe_currently, kdata_shift+12);
   double low_13 = iLow(Symbol(), timeframe_currently, kdata_shift+13);
   double low_14 = iLow(Symbol(), timeframe_currently, kdata_shift+14);
   double low_15 = iLow(Symbol(), timeframe_currently, kdata_shift+15);
   double low_16 = iLow(Symbol(), timeframe_currently, kdata_shift+16);
   double low_17 = iLow(Symbol(), timeframe_currently, kdata_shift+17);
   double low_18 = iLow(Symbol(), timeframe_currently, kdata_shift+18);
   double low_19 = iLow(Symbol(), timeframe_currently, kdata_shift+19);
   double low_20 = iLow(Symbol(), timeframe_currently, kdata_shift+20);

   double low_change1 = ((low_ - low_1)/low_1)*100;     // 前1天最低价变化 （当前-前1）/前1
   double low_change2 = ((low_1 - low_2)/low_2)*100;
   double low_change3 = ((low_2 - low_3)/low_3)*100;
   double low_change4 = ((low_3 - low_4)/low_4)*100;
   double low_change5 = ((low_4 - low_5)/low_5)*100;
   double low_change6 = ((low_5 - low_6)/low_6)*100;
   double low_change7 = ((low_6 - low_7)/low_7)*100;
   double low_change8 = ((low_7 - low_8)/low_8)*100;
   double low_change9 = ((low_8 - low_9)/low_9)*100;
   double low_change10 = ((low_9 - low_10)/low_10)*100;
   double low_change11 = ((low_10 - low_11)/low_11)*100;
   double low_change12 = ((low_11 - low_12)/low_12)*100;
   double low_change13 = ((low_12 - low_13)/low_13)*100;
   double low_change14 = ((low_13 - low_14)/low_14)*100;
   double low_change15 = ((low_14 - low_15)/low_15)*100;
   double low_change16 = ((low_15 - low_16)/low_16)*100;
   double low_change17 = ((low_16 - low_17)/low_17)*100;
   double low_change18 = ((low_17 - low_18)/low_18)*100;
   double low_change19 = ((low_18 - low_19)/low_19)*100;
   double low_change20 = ((low_19 - low_20)/low_20)*100;

   double highlow_change1 = ((high_ - low_1)/low_1)*100;    //当前最高价与最低价每一天
   double highlow_change2 = ((high_1 - low_2)/low_2)*100;
   double highlow_change3 = ((high_2 - low_3)/low_3)*100;
   double highlow_change4 = ((high_3 - low_4)/low_4)*100;
   double highlow_change5 = ((high_4 - low_5)/low_5)*100;
   double highlow_change6 = ((high_5 - low_6)/low_6)*100;
   double highlow_change7 = ((high_6 - low_7)/low_7)*100;
   double highlow_change8 = ((high_7 - low_8)/low_8)*100;
   double highlow_change9 = ((high_8 - low_9)/low_9)*100;
   double highlow_change10 = ((high_9 - low_10)/low_10)*100;
   double highlow_change11 = ((high_10 - low_11)/low_11)*100;
   double highlow_change12 = ((high_11 - low_12)/low_12)*100;
   double highlow_change13 = ((high_12 - low_13)/low_13)*100;
   double highlow_change14 = ((high_13 - low_14)/low_14)*100;
   double highlow_change15 = ((high_14 - low_15)/low_1)*100;
   double highlow_change16 = ((high_15 - low_16)/low_16)*100;
   double highlow_change17 = ((high_16 - low_17)/low_17)*100;
   double highlow_change18 = ((high_17 - low_18)/low_18)*100;
   double highlow_change19 = ((high_18 - low_19)/low_19)*100;
   double highlow_change20 = ((high_19 - low_20)/low_20)*100;

   double highlow_current_change0 = ((high_ - low_)/low_)*100;       // 前最高价与之前最低价变化率
   double highlow_current_change1 = ((high_ - low_1)/low_1)*100;
   double highlow_current_change2 = ((high_ - low_2)/low_2)*100;
   double highlow_current_change3 = ((high_ - low_3)/low_3)*100;
   double highlow_current_change4 = ((high_ - low_4)/low_4)*100;
   double highlow_current_change5 = ((high_ - low_5)/low_5)*100;
   double highlow_current_change6 = ((high_ - low_6)/low_6)*100;
   double highlow_current_change7 = ((high_ - low_7)/low_7)*100;
   double highlow_current_change8 = ((high_ - low_8)/low_8)*100;
   double highlow_current_change9 = ((high_ - low_9)/low_9)*100;
   double highlow_current_change10 = ((high_ - low_10)/low_10)*100;
   double highlow_current_change11 = ((high_ - low_11)/low_11)*100;
   double highlow_current_change12 = ((high_ - low_12)/low_12)*100;
   double highlow_current_change13 = ((high_ - low_13)/low_13)*100;
   double highlow_current_change14 = ((high_ - low_14)/low_14)*100;
   double highlow_current_change15 = ((high_ - low_15)/low_15)*100;
   double highlow_current_change16 = ((high_ - low_16)/low_16)*100;
   double highlow_current_change17 = ((high_ - low_17)/low_17)*100;
   double highlow_current_change18 = ((high_ - low_18)/low_18)*100;
   double highlow_current_change19 = ((high_ - low_19)/low_19)*100;
   double highlow_current_change20 = ((high_ - low_20)/low_20)*100;

   double openlow_current_change0 = ((open_ - low_)/low_)*100;    // 开盘价与最低价
   double openlow_current_change1 = ((open_ - low_1)/low_1)*100;
   double openlow_current_change2 = ((open_ - low_2)/low_2)*100;
   double openlow_current_change3 = ((open_ - low_3)/low_3)*100;
   double openlow_current_change4 = ((open_ - low_4)/low_4)*100;
   double openlow_current_change5 = ((open_ - low_5)/low_5)*100;
   double openlow_current_change6 = ((open_ - low_6)/low_6)*100;
   double openlow_current_change7 = ((open_ - low_7)/low_7)*100;
   double openlow_current_change8 = ((open_ - low_8)/low_8)*100;
   double openlow_current_change9 = ((open_ - low_9)/low_9)*100;
   double openlow_current_change10 = ((open_ - low_10)/low_10)*100;
   double openlow_current_change11 = ((open_ - low_11)/low_11)*100;
   double openlow_current_change12 = ((open_ - low_12)/low_12)*100;
   double openlow_current_change13 = ((open_ - low_13)/low_13)*100;
   double openlow_current_change14 = ((open_ - low_14)/low_14)*100;
   double openlow_current_change15 = ((open_ - low_15)/low_15)*100;
   double openlow_current_change16 = ((open_ - low_16)/low_16)*100;
   double openlow_current_change17 = ((open_ - low_17)/low_17)*100;
   double openlow_current_change18 = ((open_ - low_18)/low_18)*100;
   double openlow_current_change19 = ((open_ - low_19)/low_19)*100;
   double openlow_current_change20 = ((open_ - low_20)/low_20)*100;

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
   double close_11 = iClose(Symbol(), timeframe_currently, kdata_shift+11);
   double close_12 = iClose(Symbol(), timeframe_currently, kdata_shift+12);
   double close_13 = iClose(Symbol(), timeframe_currently, kdata_shift+13);
   double close_14 = iClose(Symbol(), timeframe_currently, kdata_shift+14);
   double close_15 = iClose(Symbol(), timeframe_currently, kdata_shift+15);
   double close_16 = iClose(Symbol(), timeframe_currently, kdata_shift+16);
   double close_17 = iClose(Symbol(), timeframe_currently, kdata_shift+17);
   double close_18 = iClose(Symbol(), timeframe_currently, kdata_shift+18);
   double close_19 = iClose(Symbol(), timeframe_currently, kdata_shift+19);
   double close_20 = iClose(Symbol(), timeframe_currently, kdata_shift+20);

   double close_change1 = ((close_ - close_1)/close_1)*100;
   double close_change2 = ((close_1 - close_2)/close_2)*100;
   double close_change3 = ((close_2 - close_3)/close_3)*100;
   double close_change4 = ((close_3 - close_4)/close_4)*100;
   double close_change5 = ((close_4 - close_5)/close_5)*100;
   double close_change6 = ((close_5 - close_6)/close_6)*100;
   double close_change7 = ((close_6 - close_7)/close_7)*100;
   double close_change8 = ((close_7 - close_8)/close_8)*100;
   double close_change9 = ((close_8 - close_9)/close_9)*100;
   double close_change10 = ((close_9 - close_10)/close_10)*100;
   double close_change11 = ((close_10 - close_11)/close_11)*100;
   double close_change12 = ((close_11 - close_12)/close_12)*100;
   double close_change13 = ((close_12 - close_13)/close_13)*100;
   double close_change14 = ((close_13 - close_14)/close_14)*100;
   double close_change15 = ((close_14 - close_15)/close_15)*100;
   double close_change16 = ((close_15 - close_16)/close_16)*100;
   double close_change17 = ((close_16 - close_17)/close_17)*100;
   double close_change18 = ((close_17 - close_18)/close_18)*100;
   double close_change19 = ((close_18 - close_19)/close_19)*100;
   double close_change20 = ((close_19 - close_20)/close_20)*100;

   double close_current_change2 = ((close_ - close_2)/close_2)*100;    //当前收盘价与之前的变化率
   double close_current_change3 = ((close_ - close_3)/close_3)*100;
   double close_current_change4 = ((close_ - close_4)/close_4)*100;
   double close_current_change5 = ((close_ - close_5)/close_5)*100;
   double close_current_change6 = ((close_ - close_6)/close_6)*100;
   double close_current_change7 = ((close_ - close_7)/close_7)*100;
   double close_current_change8 = ((close_ - close_8)/close_8)*100;
   double close_current_change9 = ((close_ - close_9)/close_9)*100;
   double close_current_change10 = ((close_ - close_10)/close_10)*100;
   double close_current_change11 = ((close_ - close_11)/close_11)*100;
   double close_current_change12 = ((close_ - close_12)/close_12)*100;
   double close_current_change13 = ((close_ - close_13)/close_13)*100;
   double close_current_change14 = ((close_ - close_14)/close_14)*100;
   double close_current_change15 = ((close_ - close_15)/close_15)*100;
   double close_current_change16 = ((close_ - close_16)/close_16)*100;
   double close_current_change17 = ((close_ - close_17)/close_17)*100;
   double close_current_change18 = ((close_ - close_18)/close_18)*100;
   double close_current_change19 = ((close_ - close_19)/close_19)*100;
   double close_current_change20 = ((close_ - close_20)/close_20)*100;

   double closeopen_current_change0 = ((close_ - open_)/open_)*100;
   double closeopen_current_change1 = ((close_ - open_1)/open_1)*100;
   double closeopen_current_change2 = ((close_ - open_2)/open_2)*100;
   double closeopen_current_change3 = ((close_ - open_3)/open_3)*100;
   double closeopen_current_change4 = ((close_ - open_4)/open_4)*100;
   double closeopen_current_change5 = ((close_ - open_5)/open_5)*100;
   double closeopen_current_change6 = ((close_ - open_6)/open_6)*100;
   double closeopen_current_change7 = ((close_ - open_7)/open_7)*100;
   double closeopen_current_change8 = ((close_ - open_8)/open_8)*100;
   double closeopen_current_change9 = ((close_ - open_9)/open_9)*100;
   double closeopen_current_change10 = ((close_ - open_10)/open_10)*100;
   double closeopen_current_change11 = ((close_ - open_11)/open_11)*100;
   double closeopen_current_change12 = ((close_ - open_12)/open_12)*100;
   double closeopen_current_change13 = ((close_ - open_13)/open_13)*100;
   double closeopen_current_change14 = ((close_ - open_14)/open_14)*100;
   double closeopen_current_change15 = ((close_ - open_15)/open_15)*100;
   double closeopen_current_change16 = ((close_ - open_16)/open_16)*100;
   double closeopen_current_change17 = ((close_ - open_17)/open_17)*100;
   double closeopen_current_change18 = ((close_ - open_18)/open_18)*100;
   double closeopen_current_change19 = ((close_ - open_19)/open_19)*100;
   double closeopen_current_change20 = ((close_ - open_20)/open_20)*100;

   double volume_ = double(iVolume(Symbol(), timeframe_currently, kdata_shift));
   double volume_1 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+1));
   double volume_2 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+2));
   double volume_3 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+3));
   double volume_4 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+4));
   double volume_5 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+5));
   double volume_6 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+6));
   double volume_7 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+7));
   double volume_8 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+8));
   double volume_9 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+9));
   double volume_10 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+10));
   double volume_11 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+11));
   double volume_12 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+12));
   double volume_13 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+13));
   double volume_14 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+14));
   double volume_15 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+15));
   double volume_16 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+16));
   double volume_17 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+17));
   double volume_18 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+18));
   double volume_19 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+19));
   double volume_20 = double(iVolume(Symbol(), timeframe_currently, kdata_shift+20));
   double volume_change1 = ((volume_ - volume_1)/volume_1)*100;
   double volume_change2 = ((volume_1 - volume_2)/volume_2)*100;
   double volume_change3 = ((volume_2 - volume_3)/volume_3)*100;
   double volume_change4 = ((volume_3 - volume_4)/volume_1)*100;
   double volume_change5 = ((volume_4 - volume_5)/volume_5)*100;
   double volume_change6 = ((volume_5 - volume_6)/volume_6)*100;
   double volume_change7 = ((volume_6 - volume_7)/volume_7)*100;
   double volume_change8 = ((volume_7 - volume_8)/volume_8)*100;
   double volume_change9 = ((volume_8 - volume_9)/volume_9)*100;
   double volume_change10 = ((volume_9 - volume_10)/volume_10)*100;
   double volume_change11 = ((volume_10 - volume_11)/volume_11)*100;
   double volume_change12 = ((volume_11 - volume_12)/volume_12)*100;
   double volume_change13 = ((volume_12 - volume_13)/volume_13)*100;
   double volume_change14 = ((volume_13 - volume_14)/volume_14)*100;
   double volume_change15 = ((volume_14 - volume_15)/volume_15)*100;
   double volume_change16 = ((volume_15 - volume_16)/volume_16)*100;
   double volume_change17 = ((volume_16 - volume_17)/volume_17)*100;
   double volume_change18 = ((volume_17 - volume_18)/volume_18)*100;
   double volume_change19 = ((volume_18 - volume_19)/volume_19)*100;
   double volume_change20 = ((volume_19 - volume_20)/volume_20)*100;

   double openhigh_change1 = ((open_ - high_1)/high_1)*100;    //当前开盘价与最高价每一天
   double openhigh_change2 = ((open_1 - high_2)/high_2)*100;
   double openhigh_change3 = ((open_2 - high_3)/high_3)*100;
   double openhigh_change4 = ((open_3 - high_4)/high_4)*100;
   double openhigh_change5 = ((open_4 - high_5)/high_5)*100;
   double openhigh_change6 = ((open_5 - high_6)/high_6)*100;
   double openhigh_change7 = ((open_6 - high_7)/high_7)*100;
   double openhigh_change8 = ((open_7 - high_8)/high_8)*100;
   double openhigh_change9 = ((open_8 - high_9)/high_9)*100;
   double openhigh_change10 = ((open_9 - high_10)/high_10)*100;
   double openhigh_change11 = ((open_10 - high_11)/high_11)*100;
   double openhigh_change12 = ((open_11 - high_12)/high_12)*100;
   double openhigh_change13 = ((open_12 - high_13)/high_13)*100;
   double openhigh_change14 = ((open_13 - high_14)/high_14)*100;
   double openhigh_change15 = ((open_14 - high_15)/high_15)*100;
   double openhigh_change16 = ((open_15 - high_16)/high_16)*100;
   double openhigh_change17 = ((open_16 - high_17)/high_17)*100;
   double openhigh_change18 = ((open_17 - high_18)/high_18)*100;
   double openhigh_change19 = ((open_18 - high_19)/high_19)*100;
   double openhigh_change20 = ((open_19 - high_20)/high_20)*100;

   double openhigh_current_change1 = ((open_ - high_1)/high_1)*100;    //当前开盘价与之前每一天最高价
   double openhigh_current_change2 = ((open_ - high_2)/high_2)*100;
   double openhigh_current_change3 = ((open_ - high_3)/high_3)*100;
   double openhigh_current_change4 = ((open_ - high_4)/high_4)*100;
   double openhigh_current_change5 = ((open_ - high_5)/high_5)*100;
   double openhigh_current_change6 = ((open_ - high_6)/high_6)*100;
   double openhigh_current_change7 = ((open_ - high_7)/high_7)*100;
   double openhigh_current_change8 = ((open_ - high_8)/high_8)*100;
   double openhigh_current_change9 = ((open_ - high_9)/high_9)*100;
   double openhigh_current_change10 = ((open_ - high_10)/high_10)*100;
   double openhigh_current_change11 = ((open_ - high_11)/high_11)*100;
   double openhigh_current_change12 = ((open_ - high_12)/high_12)*100;
   double openhigh_current_change13 = ((open_ - high_13)/high_13)*100;
   double openhigh_current_change14 = ((open_ - high_14)/high_14)*100;
   double openhigh_current_change15 = ((open_ - high_15)/high_15)*100;
   double openhigh_current_change16 = ((open_ - high_16)/high_16)*100;
   double openhigh_current_change17 = ((open_ - high_17)/high_17)*100;
   double openhigh_current_change18 = ((open_ - high_18)/high_18)*100;
   double openhigh_current_change19 = ((open_ - high_19)/high_19)*100;
   double openhigh_current_change20 = ((open_ - high_20)/high_20)*100;

   double closelow_change1 = ((close_ - low_1)/low_1)*100;    //当前收盘价与最低价每一天
   double closelow_change2 = ((close_1 - low_2)/low_2)*100;
   double closelow_change3 = ((close_2 - low_3)/low_3)*100;
   double closelow_change4 = ((close_3 - low_4)/low_4)*100;
   double closelow_change5 = ((close_4 - low_5)/low_5)*100;
   double closelow_change6 = ((close_5 - low_6)/low_6)*100;
   double closelow_change7 = ((close_6 - low_7)/low_7)*100;
   double closelow_change8 = ((close_7 - low_8)/low_8)*100;
   double closelow_change9 = ((close_8 - low_9)/low_9)*100;
   double closelow_change10 = ((close_9 - low_10)/low_10)*100;
   double closelow_change11 = ((close_10 - low_11)/low_11)*100;
   double closelow_change12 = ((close_11 - low_12)/low_12)*100;
   double closelow_change13 = ((close_12 - low_13)/low_13)*100;
   double closelow_change14 = ((close_13 - low_14)/low_14)*100;
   double closelow_change15 = ((close_14 - low_15)/low_1)*100;
   double closelow_change16 = ((close_15 - low_16)/low_16)*100;
   double closelow_change17 = ((close_16 - low_17)/low_17)*100;
   double closelow_change18 = ((close_17 - low_18)/low_18)*100;
   double closelow_change19 = ((close_18 - low_19)/low_19)*100;
   double closelow_change20 = ((close_19 - low_20)/low_20)*100;

   double closelow_current_change1 = ((close_ - low_1)/low_1)*100;    //当前收盘价与最低价每一天
   double closelow_current_change2 = ((close_ - low_2)/low_2)*100;
   double closelow_current_change3 = ((close_ - low_3)/low_3)*100;
   double closelow_current_change4 = ((close_ - low_4)/low_4)*100;
   double closelow_current_change5 = ((close_ - low_5)/low_5)*100;
   double closelow_current_change6 = ((close_ - low_6)/low_6)*100;
   double closelow_current_change7 = ((close_ - low_7)/low_7)*100;
   double closelow_current_change8 = ((close_ - low_8)/low_8)*100;
   double closelow_current_change9 = ((close_ - low_9)/low_9)*100;
   double closelow_current_change10 = ((close_ - low_10)/low_10)*100;
   double closelow_current_change11 = ((close_ - low_11)/low_11)*100;
   double closelow_current_change12 = ((close_ - low_12)/low_12)*100;
   double closelow_current_change13 = ((close_ - low_13)/low_13)*100;
   double closelow_current_change14 = ((close_ - low_14)/low_14)*100;
   double closelow_current_change15 = ((close_ - low_15)/low_1)*100;
   double closelow_current_change16 = ((close_ - low_16)/low_16)*100;
   double closelow_current_change17 = ((close_ - low_17)/low_17)*100;
   double closelow_current_change18 = ((close_ - low_18)/low_18)*100;
   double closelow_current_change19 = ((close_ - low_19)/low_19)*100;
   double closelow_current_change20 = ((close_ - low_20)/low_20)*100;

//printf(volume_1);
//printf(volume_2);
//printf(double volume_change2);

//处于历史的区间位置
   if(low < history_min)
     {
      history_min =  low;
     }
   if(high > history_max)
     {
      history_max =  high;
     }
   double his_interval = (close_ - history_min)/(history_max - history_min);

//时间区域位置情况 动态数组
   ArrayResize(high_history, ArraySize(high_history) + 1);
   high_history[ArraySize(high_history) - 1] =  high;
   ArrayResize(low_history, ArraySize(low_history) + 1);
   low_history[ArraySize(low_history) - 1] =  low;
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

   double interval_10 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);


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

   double interval_20 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);

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

   double interval_30 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);

//40日内位置
   if(ArraySize(high_history)>40)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-40,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-40,ArraySize(low_history));
     }
   else
     {
      int index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      int index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   double interval_40 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);

//50日内位置
   if(ArraySize(high_history)>50)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-50,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-50,ArraySize(low_history));
     }
   else
     {
      int index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      int index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   double interval_50 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);

//60日内位置
   if(ArraySize(high_history)>60)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-60,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-60,ArraySize(low_history));
     }
   else
     {
      int index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      int index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   double interval_60 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);


//--------------------------------------------------------------指标数据-------------------------------------------------------------------------------------------
   Print("cycle计算指标数据 ");
//--- 计算ATR
   double atr5_arr[];
   double atr10_arr[];
   ATR(atr5_arr,_Symbol,timeframe_currently,5,count_num);
   ATR(atr10_arr,_Symbol,timeframe_currently,10,count_num);

   double atr5 = atr5_arr[kdata_shift];
   double atr10 = atr10_arr[kdata_shift];

   double atr5_change1 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+1])/atr5_arr[kdata_shift+1])*100;     //ATR变化率
   double atr5_change2 = ((atr5_arr[kdata_shift+1] - atr5_arr[kdata_shift+2])/atr5_arr[kdata_shift+2])*100;
   double atr5_change3 = ((atr5_arr[kdata_shift+2] - atr5_arr[kdata_shift+3])/atr5_arr[kdata_shift+3])*100;
   double atr5_change4 = ((atr5_arr[kdata_shift+3] - atr5_arr[kdata_shift+4])/atr5_arr[kdata_shift+4])*100;
   double atr5_change5 = ((atr5_arr[kdata_shift+4] - atr5_arr[kdata_shift+5])/atr5_arr[kdata_shift+5])*100;
   double atr5_change6 = ((atr5_arr[kdata_shift+5] - atr5_arr[kdata_shift+6])/atr5_arr[kdata_shift+6])*100;
   double atr5_change7 = ((atr5_arr[kdata_shift+6] - atr5_arr[kdata_shift+7])/atr5_arr[kdata_shift+7])*100;
   double atr5_change8 = ((atr5_arr[kdata_shift+7] - atr5_arr[kdata_shift+8])/atr5_arr[kdata_shift+8])*100;
   double atr5_change9 = ((atr5_arr[kdata_shift+8] - atr5_arr[kdata_shift+9])/atr5_arr[kdata_shift+9])*100;
   double atr5_change10 = ((atr5_arr[kdata_shift+9] - atr5_arr[kdata_shift+10])/atr5_arr[kdata_shift+10])*100;

   double atr5_current_change1 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+1])/atr5_arr[kdata_shift+1])*100;
   double atr5_current_change2 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+2])/atr5_arr[kdata_shift+2])*100;
   double atr5_current_change3 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+3])/atr5_arr[kdata_shift+3])*100;
   double atr5_current_change4 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+4])/atr5_arr[kdata_shift+4])*100;
   double atr5_current_change5 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+5])/atr5_arr[kdata_shift+5])*100;
   double atr5_current_change6 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+6])/atr5_arr[kdata_shift+6])*100;
   double atr5_current_change7 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+7])/atr5_arr[kdata_shift+7])*100;
   double atr5_current_change8 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+8])/atr5_arr[kdata_shift+8])*100;
   double atr5_current_change9 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+9])/atr5_arr[kdata_shift+9])*100;
   double atr5_current_change10 = ((atr5_arr[kdata_shift] - atr5_arr[kdata_shift+10])/atr5_arr[kdata_shift+10])*100;

   double atr10_change1 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+1])/atr10_arr[kdata_shift+1])*100;
   double atr10_change2 = ((atr10_arr[kdata_shift+1] - atr10_arr[kdata_shift+2])/atr10_arr[kdata_shift+2])*100;
   double atr10_change3 = ((atr10_arr[kdata_shift+2] - atr10_arr[kdata_shift+3])/atr10_arr[kdata_shift+3])*100;
   double atr10_change4 = ((atr10_arr[kdata_shift+3] - atr10_arr[kdata_shift+4])/atr10_arr[kdata_shift+4])*100;
   double atr10_change5 = ((atr10_arr[kdata_shift+4] - atr10_arr[kdata_shift+5])/atr10_arr[kdata_shift+5])*100;
   double atr10_change6 = ((atr10_arr[kdata_shift+5] - atr10_arr[kdata_shift+6])/atr10_arr[kdata_shift+6])*100;
   double atr10_change7 = ((atr10_arr[kdata_shift+6] - atr10_arr[kdata_shift+7])/atr10_arr[kdata_shift+7])*100;
   double atr10_change8 = ((atr10_arr[kdata_shift+7] - atr10_arr[kdata_shift+8])/atr10_arr[kdata_shift+8])*100;
   double atr10_change9 = ((atr10_arr[kdata_shift+8] - atr10_arr[kdata_shift+9])/atr10_arr[kdata_shift+9])*100;
   double atr10_change10 = ((atr10_arr[kdata_shift+9] - atr10_arr[kdata_shift+10])/atr10_arr[kdata_shift+10])*100;

   double atr10_current_change1 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+1])/atr10_arr[kdata_shift+1])*100;
   double atr10_current_change2 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+2])/atr10_arr[kdata_shift+2])*100;
   double atr10_current_change3 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+3])/atr10_arr[kdata_shift+3])*100;
   double atr10_current_change4 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+4])/atr10_arr[kdata_shift+4])*100;
   double atr10_current_change5 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+5])/atr10_arr[kdata_shift+5])*100;
   double atr10_current_change6 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+6])/atr10_arr[kdata_shift+6])*100;
   double atr10_current_change7 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+7])/atr10_arr[kdata_shift+7])*100;
   double atr10_current_change8 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+8])/atr10_arr[kdata_shift+8])*100;
   double atr10_current_change9 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+9])/atr10_arr[kdata_shift+9])*100;
   double atr10_current_change10 = ((atr10_arr[kdata_shift] - atr10_arr[kdata_shift+10])/atr10_arr[kdata_shift+10])*100;

   double atr5_changeValue1 = atr5_arr[kdata_shift] - atr5_arr[kdata_shift+1];     //ATR变化值
   double atr5_changeValue2 = atr5_arr[kdata_shift+1] - atr5_arr[kdata_shift+2];
   double atr5_changeValue3 = atr5_arr[kdata_shift+2] - atr5_arr[kdata_shift+3];
   double atr5_changeValue4 = atr5_arr[kdata_shift+3] - atr5_arr[kdata_shift+4];
   double atr5_changeValue5 = atr5_arr[kdata_shift+4] - atr5_arr[kdata_shift+5];
   double atr5_changeValue6 = atr5_arr[kdata_shift+5] - atr5_arr[kdata_shift+6];
   double atr5_changeValue7 = atr5_arr[kdata_shift+6] - atr5_arr[kdata_shift+7];
   double atr5_changeValue8 = atr5_arr[kdata_shift+7] - atr5_arr[kdata_shift+8];
   double atr5_changeValue9 = atr5_arr[kdata_shift+8] - atr5_arr[kdata_shift+9];
   double atr5_changeValue10 = atr5_arr[kdata_shift+9] - atr5_arr[kdata_shift+10];

   double atr10_changeValue1 = atr10_arr[kdata_shift] - atr10_arr[kdata_shift+1];     //ATR变化值
   double atr10_changeValue2 = atr10_arr[kdata_shift+1] - atr10_arr[kdata_shift+2];
   double atr10_changeValue3 = atr10_arr[kdata_shift+2] - atr10_arr[kdata_shift+3];
   double atr10_changeValue4 = atr10_arr[kdata_shift+3] - atr10_arr[kdata_shift+4];
   double atr10_changeValue5 = atr10_arr[kdata_shift+4] - atr10_arr[kdata_shift+5];
   double atr10_changeValue6 = atr10_arr[kdata_shift+5] - atr10_arr[kdata_shift+6];
   double atr10_changeValue7 = atr10_arr[kdata_shift+6] - atr10_arr[kdata_shift+7];
   double atr10_changeValue8 = atr10_arr[kdata_shift+7] - atr10_arr[kdata_shift+8];
   double atr10_changeValue9 = atr10_arr[kdata_shift+8] - atr10_arr[kdata_shift+9];
   double atr10_changeValue10 = atr10_arr[kdata_shift+9] - atr10_arr[kdata_shift+10];


//ArrayPrint(atr5_arr);
//ArrayPrint(atr10_arr);
//----------------------------------------ATR反映情况类型判定----------------------------------------
   double atr_5_10_type = TypeATR(atr5_arr,atr10_arr,kdata_shift);


//macd
   double macd_arr[];
   MACD(macd_arr,_Symbol,timeframe_currently,12,26,9,PRICE_CLOSE,count_num);

   double macd = macd_arr[kdata_shift];

   double macd_change1 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+1])/(MathAbs(macd_arr[kdata_shift+1])+1E-15))*100;     //macd变化率
   double macd_change2 = ((macd_arr[kdata_shift+1] - macd_arr[kdata_shift+2])/(MathAbs(macd_arr[kdata_shift+2])+1E-15))*100;
   double macd_change3 = ((macd_arr[kdata_shift+2] - macd_arr[kdata_shift+3])/(MathAbs(macd_arr[kdata_shift+3])+1E-15))*100;
   double macd_change4 = ((macd_arr[kdata_shift+3] - macd_arr[kdata_shift+4])/(MathAbs(macd_arr[kdata_shift+4])+1E-15))*100;
   double macd_change5 = ((macd_arr[kdata_shift+4] - macd_arr[kdata_shift+5])/(MathAbs(macd_arr[kdata_shift+5])+1E-15))*100;
   double macd_change6 = ((macd_arr[kdata_shift+5] - macd_arr[kdata_shift+6])/(MathAbs(macd_arr[kdata_shift+6])+1E-15))*100;
   double macd_change7 = ((macd_arr[kdata_shift+6] - macd_arr[kdata_shift+7])/(MathAbs(macd_arr[kdata_shift+7])+1E-15))*100;
   double macd_change8 = ((macd_arr[kdata_shift+7] - macd_arr[kdata_shift+8])/(MathAbs(macd_arr[kdata_shift+8])+1E-15))*100;
   double macd_change9 = ((macd_arr[kdata_shift+8] - macd_arr[kdata_shift+9])/(MathAbs(macd_arr[kdata_shift+9])+1E-15))*100;
   double macd_change10 = ((macd_arr[kdata_shift+9] - macd_arr[kdata_shift+10])/(MathAbs(macd_arr[kdata_shift+10])+1E-15))*100;

   double macd_current_change1 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+1])/(MathAbs(macd_arr[kdata_shift+1])+1E-15))*100;
   double macd_current_change2 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+2])/(MathAbs(macd_arr[kdata_shift+2])+1E-15))*100;
   double macd_current_change3 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+3])/(MathAbs(macd_arr[kdata_shift+3])+1E-15))*100;
   double macd_current_change4 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+4])/(MathAbs(macd_arr[kdata_shift+4])+1E-15))*100;
   double macd_current_change5 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+5])/(MathAbs(macd_arr[kdata_shift+5])+1E-15))*100;
   double macd_current_change6 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+6])/(MathAbs(macd_arr[kdata_shift+6])+1E-15))*100;
   double macd_current_change7 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+7])/(MathAbs(macd_arr[kdata_shift+7])+1E-15))*100;
   double macd_current_change8 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+8])/(MathAbs(macd_arr[kdata_shift+8])+1E-15))*100;
   double macd_current_change9 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+9])/(MathAbs(macd_arr[kdata_shift+9])+1E-15))*100;
   double macd_current_change10 = ((macd_arr[kdata_shift] - macd_arr[kdata_shift+10])/(MathAbs(macd_arr[kdata_shift+10])+1E-15))*100;

   double macd_changeValue1 = macd_arr[kdata_shift] - macd_arr[kdata_shift+1];      //macd变化值
   double macd_changeValue2 = macd_arr[kdata_shift+1] - macd_arr[kdata_shift+2];
   double macd_changeValue3 = macd_arr[kdata_shift+2] - macd_arr[kdata_shift+3];
   double macd_changeValue4 = macd_arr[kdata_shift+3] - macd_arr[kdata_shift+4];
   double macd_changeValue5 = macd_arr[kdata_shift+4] - macd_arr[kdata_shift+5];
   double macd_changeValue6 = macd_arr[kdata_shift+5] - macd_arr[kdata_shift+6];
   double macd_changeValue7 = macd_arr[kdata_shift+6] - macd_arr[kdata_shift+7];
   double macd_changeValue8 = macd_arr[kdata_shift+7] - macd_arr[kdata_shift+8];
   double macd_changeValue9 = macd_arr[kdata_shift+8] - macd_arr[kdata_shift+9];
   double macd_changeValue10 = macd_arr[kdata_shift+9] - macd_arr[kdata_shift+10];

//ArrayPrint(macd_arr);
//----------------------------------------MACD反映情况类型判定----------------------------------------
   double macd_type = TypeMACD(macd_arr,kdata_shift);


//SMA
   double sma5_arr[];
   double sma10_arr[];
   MA(sma5_arr,_Symbol,timeframe_currently,5,0,MODE_SMA,PRICE_CLOSE,count_num);
   MA(sma10_arr,_Symbol,timeframe_currently,10,0,MODE_SMA,PRICE_CLOSE,count_num);

   double sma5 = sma5_arr[kdata_shift];
   double sma10 = sma10_arr[kdata_shift];

   double sma5_change1 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+1])/sma5_arr[kdata_shift+1])*100;     //sma变化率
   double sma5_change2 = ((sma5_arr[kdata_shift+1] - sma5_arr[kdata_shift+2])/sma5_arr[kdata_shift+2])*100;
   double sma5_change3 = ((sma5_arr[kdata_shift+2] - sma5_arr[kdata_shift+3])/sma5_arr[kdata_shift+3])*100;
   double sma5_change4 = ((sma5_arr[kdata_shift+3] - sma5_arr[kdata_shift+4])/sma5_arr[kdata_shift+4])*100;
   double sma5_change5 = ((sma5_arr[kdata_shift+4] - sma5_arr[kdata_shift+5])/sma5_arr[kdata_shift+5])*100;
   double sma5_change6 = ((sma5_arr[kdata_shift+5] - sma5_arr[kdata_shift+6])/sma5_arr[kdata_shift+6])*100;
   double sma5_change7 = ((sma5_arr[kdata_shift+6] - sma5_arr[kdata_shift+7])/sma5_arr[kdata_shift+7])*100;
   double sma5_change8 = ((sma5_arr[kdata_shift+7] - sma5_arr[kdata_shift+8])/sma5_arr[kdata_shift+8])*100;
   double sma5_change9 = ((sma5_arr[kdata_shift+8] - sma5_arr[kdata_shift+9])/sma5_arr[kdata_shift+9])*100;
   double sma5_change10 = ((sma5_arr[kdata_shift+9] - sma5_arr[kdata_shift+10])/sma5_arr[kdata_shift+10])*100;

   double sma5_current_change1 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+1])/sma5_arr[kdata_shift+1])*100;
   double sma5_current_change2 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+2])/sma5_arr[kdata_shift+2])*100;
   double sma5_current_change3 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+3])/sma5_arr[kdata_shift+3])*100;
   double sma5_current_change4 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+4])/sma5_arr[kdata_shift+4])*100;
   double sma5_current_change5 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+5])/sma5_arr[kdata_shift+5])*100;
   double sma5_current_change6 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+6])/sma5_arr[kdata_shift+6])*100;
   double sma5_current_change7 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+7])/sma5_arr[kdata_shift+7])*100;
   double sma5_current_change8 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+8])/sma5_arr[kdata_shift+8])*100;
   double sma5_current_change9 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+9])/sma5_arr[kdata_shift+9])*100;
   double sma5_current_change10 = ((sma5_arr[kdata_shift] - sma5_arr[kdata_shift+10])/sma5_arr[kdata_shift+10])*100;

   double sma10_change1 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+1])/sma10_arr[kdata_shift+1])*100;
   double sma10_change2 = ((sma10_arr[kdata_shift+1] - sma10_arr[kdata_shift+2])/sma10_arr[kdata_shift+2])*100;
   double sma10_change3 = ((sma10_arr[kdata_shift+2] - sma10_arr[kdata_shift+3])/sma10_arr[kdata_shift+3])*100;
   double sma10_change4 = ((sma10_arr[kdata_shift+3] - sma10_arr[kdata_shift+4])/sma10_arr[kdata_shift+4])*100;
   double sma10_change5 = ((sma10_arr[kdata_shift+4] - sma10_arr[kdata_shift+5])/sma10_arr[kdata_shift+5])*100;
   double sma10_change6 = ((sma10_arr[kdata_shift+5] - sma10_arr[kdata_shift+6])/sma10_arr[kdata_shift+6])*100;
   double sma10_change7 = ((sma10_arr[kdata_shift+6] - sma10_arr[kdata_shift+7])/sma10_arr[kdata_shift+7])*100;
   double sma10_change8 = ((sma10_arr[kdata_shift+7] - sma10_arr[kdata_shift+8])/sma10_arr[kdata_shift+8])*100;
   double sma10_change9 = ((sma10_arr[kdata_shift+8] - sma10_arr[kdata_shift+9])/sma10_arr[kdata_shift+9])*100;
   double sma10_change10 = ((sma10_arr[kdata_shift+9] - sma10_arr[kdata_shift+10])/sma10_arr[kdata_shift+10])*100;

   double sma10_current_change1 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+1])/sma10_arr[kdata_shift+1])*100;
   double sma10_current_change2 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+2])/sma10_arr[kdata_shift+2])*100;
   double sma10_current_change3 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+3])/sma10_arr[kdata_shift+3])*100;
   double sma10_current_change4 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+4])/sma10_arr[kdata_shift+4])*100;
   double sma10_current_change5 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+5])/sma10_arr[kdata_shift+5])*100;
   double sma10_current_change6 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+6])/sma10_arr[kdata_shift+6])*100;
   double sma10_current_change7 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+7])/sma10_arr[kdata_shift+7])*100;
   double sma10_current_change8 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+8])/sma10_arr[kdata_shift+8])*100;
   double sma10_current_change9 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+9])/sma10_arr[kdata_shift+9])*100;
   double sma10_current_change10 = ((sma10_arr[kdata_shift] - sma10_arr[kdata_shift+10])/sma10_arr[kdata_shift+10])*100;

   double sma5_changeValue1 = sma5_arr[kdata_shift] - sma5_arr[kdata_shift+1];     //sma变化值
   double sma5_changeValue2 = sma5_arr[kdata_shift+1] - sma5_arr[kdata_shift+2];
   double sma5_changeValue3 = sma5_arr[kdata_shift+2] - sma5_arr[kdata_shift+3];
   double sma5_changeValue4 = sma5_arr[kdata_shift+3] - sma5_arr[kdata_shift+4];
   double sma5_changeValue5 = sma5_arr[kdata_shift+4] - sma5_arr[kdata_shift+5];
   double sma5_changeValue6 = sma5_arr[kdata_shift+5] - sma5_arr[kdata_shift+6];
   double sma5_changeValue7 = sma5_arr[kdata_shift+6] - sma5_arr[kdata_shift+7];
   double sma5_changeValue8 = sma5_arr[kdata_shift+7] - sma5_arr[kdata_shift+8];
   double sma5_changeValue9 = sma5_arr[kdata_shift+8] - sma5_arr[kdata_shift+9];
   double sma5_changeValue10 = sma5_arr[kdata_shift+9] - sma5_arr[kdata_shift+10];

   double sma10_changeValue1 = sma10_arr[kdata_shift] - sma10_arr[kdata_shift+1];
   double sma10_changeValue2 = sma10_arr[kdata_shift+1] - sma10_arr[kdata_shift+2];
   double sma10_changeValue3 = sma10_arr[kdata_shift+2] - sma10_arr[kdata_shift+3];
   double sma10_changeValue4 = sma10_arr[kdata_shift+3] - sma10_arr[kdata_shift+4];
   double sma10_changeValue5 = sma10_arr[kdata_shift+4] - sma10_arr[kdata_shift+5];
   double sma10_changeValue6 = sma10_arr[kdata_shift+5] - sma10_arr[kdata_shift+6];
   double sma10_changeValue7 = sma10_arr[kdata_shift+6] - sma10_arr[kdata_shift+7];
   double sma10_changeValue8 = sma10_arr[kdata_shift+7] - sma10_arr[kdata_shift+8];
   double sma10_changeValue9 = sma10_arr[kdata_shift+8] - sma10_arr[kdata_shift+9];
   double sma10_changeValue10 = sma10_arr[kdata_shift+9] - sma10_arr[kdata_shift+10];

//ArrayPrint(sma5_arr);
//ArrayPrint(sma10_arr);
//----------------------------------------SMA反映情况类型判定----------------------------------------
   double sma_5_10_type = TypeSMA(sma5_arr, sma10_arr, close_, kdata_shift);


//EMA
   double ema5_arr[];
   double ema10_arr[];
   MA(ema5_arr,_Symbol,timeframe_currently,5,0,MODE_EMA,PRICE_CLOSE,count_num);
   MA(ema10_arr,_Symbol,timeframe_currently,10,0,MODE_EMA,PRICE_CLOSE,count_num);

   double ema5 = ema5_arr[kdata_shift];
   double ema10 = ema10_arr[kdata_shift];

   double ema5_change1 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+1])/ema5_arr[kdata_shift+1])*100;     //ema变化率
   double ema5_change2 = ((ema5_arr[kdata_shift+1] - ema5_arr[kdata_shift+2])/ema5_arr[kdata_shift+2])*100;
   double ema5_change3 = ((ema5_arr[kdata_shift+2] - ema5_arr[kdata_shift+3])/ema5_arr[kdata_shift+3])*100;
   double ema5_change4 = ((ema5_arr[kdata_shift+3] - ema5_arr[kdata_shift+4])/ema5_arr[kdata_shift+4])*100;
   double ema5_change5 = ((ema5_arr[kdata_shift+4] - ema5_arr[kdata_shift+5])/ema5_arr[kdata_shift+5])*100;
   double ema5_change6 = ((ema5_arr[kdata_shift+5] - ema5_arr[kdata_shift+6])/ema5_arr[kdata_shift+6])*100;
   double ema5_change7 = ((ema5_arr[kdata_shift+6] - ema5_arr[kdata_shift+7])/ema5_arr[kdata_shift+7])*100;
   double ema5_change8 = ((ema5_arr[kdata_shift+7] - ema5_arr[kdata_shift+8])/ema5_arr[kdata_shift+8])*100;
   double ema5_change9 = ((ema5_arr[kdata_shift+8] - ema5_arr[kdata_shift+9])/ema5_arr[kdata_shift+9])*100;
   double ema5_change10 = ((ema5_arr[kdata_shift+9] - ema5_arr[kdata_shift+10])/ema5_arr[kdata_shift+10])*100;

   double ema5_current_change1 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+1])/ema5_arr[kdata_shift+1])*100;
   double ema5_current_change2 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+2])/ema5_arr[kdata_shift+2])*100;
   double ema5_current_change3 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+3])/ema5_arr[kdata_shift+3])*100;
   double ema5_current_change4 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+4])/ema5_arr[kdata_shift+4])*100;
   double ema5_current_change5 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+5])/ema5_arr[kdata_shift+5])*100;
   double ema5_current_change6 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+6])/ema5_arr[kdata_shift+6])*100;
   double ema5_current_change7 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+7])/ema5_arr[kdata_shift+7])*100;
   double ema5_current_change8 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+8])/ema5_arr[kdata_shift+8])*100;
   double ema5_current_change9 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+9])/ema5_arr[kdata_shift+9])*100;
   double ema5_current_change10 = ((ema5_arr[kdata_shift] - ema5_arr[kdata_shift+10])/ema5_arr[kdata_shift+10])*100;

   double ema10_change1 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+1])/ema10_arr[kdata_shift+1])*100;
   double ema10_change2 = ((ema10_arr[kdata_shift+1] - ema10_arr[kdata_shift+2])/ema10_arr[kdata_shift+2])*100;
   double ema10_change3 = ((ema10_arr[kdata_shift+2] - ema10_arr[kdata_shift+3])/ema10_arr[kdata_shift+3])*100;
   double ema10_change4 = ((ema10_arr[kdata_shift+3] - ema10_arr[kdata_shift+4])/ema10_arr[kdata_shift+4])*100;
   double ema10_change5 = ((ema10_arr[kdata_shift+4] - ema10_arr[kdata_shift+5])/ema10_arr[kdata_shift+5])*100;
   double ema10_change6 = ((ema10_arr[kdata_shift+5] - ema10_arr[kdata_shift+6])/ema10_arr[kdata_shift+6])*100;
   double ema10_change7 = ((ema10_arr[kdata_shift+6] - ema10_arr[kdata_shift+7])/ema10_arr[kdata_shift+7])*100;
   double ema10_change8 = ((ema10_arr[kdata_shift+7] - ema10_arr[kdata_shift+8])/ema10_arr[kdata_shift+8])*100;
   double ema10_change9 = ((ema10_arr[kdata_shift+8] - ema10_arr[kdata_shift+9])/ema10_arr[kdata_shift+9])*100;
   double ema10_change10 = ((ema10_arr[kdata_shift+9] - ema10_arr[kdata_shift+10])/ema10_arr[kdata_shift+10])*100;

   double ema10_current_change1 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+1])/ema10_arr[kdata_shift+1])*100;
   double ema10_current_change2 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+2])/ema10_arr[kdata_shift+2])*100;
   double ema10_current_change3 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+3])/ema10_arr[kdata_shift+3])*100;
   double ema10_current_change4 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+4])/ema10_arr[kdata_shift+4])*100;
   double ema10_current_change5 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+5])/ema10_arr[kdata_shift+5])*100;
   double ema10_current_change6 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+6])/ema10_arr[kdata_shift+6])*100;
   double ema10_current_change7 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+7])/ema10_arr[kdata_shift+7])*100;
   double ema10_current_change8 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+8])/ema10_arr[kdata_shift+8])*100;
   double ema10_current_change9 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+9])/ema10_arr[kdata_shift+9])*100;
   double ema10_current_change10 = ((ema10_arr[kdata_shift] - ema10_arr[kdata_shift+10])/ema10_arr[kdata_shift+10])*100;

//ArrayPrint(ema5_arr);
//ArrayPrint(ema10_arr);
//----------------------------------------EMA反映情况类型判定----------------------------------------
   double ema_5_10_type = TypeEMA(ema5_arr, ema10_arr, close_, kdata_shift);



//SMMA
   double smma5_arr[];
   double smma10_arr[];
   MA(smma5_arr,_Symbol,timeframe_currently,5,0,MODE_SMMA,PRICE_CLOSE,count_num);
   MA(smma10_arr,_Symbol,timeframe_currently,10,0,MODE_SMMA,PRICE_CLOSE,count_num);

   double smma5 = smma5_arr[kdata_shift];
   double smma10 = smma10_arr[kdata_shift];

   double smma5_change1 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+1])/smma5_arr[kdata_shift+1])*100;     //smma变化率
   double smma5_change2 = ((smma5_arr[kdata_shift+1] - smma5_arr[kdata_shift+2])/smma5_arr[kdata_shift+2])*100;
   double smma5_change3 = ((smma5_arr[kdata_shift+2] - smma5_arr[kdata_shift+3])/smma5_arr[kdata_shift+3])*100;
   double smma5_change4 = ((smma5_arr[kdata_shift+3] - smma5_arr[kdata_shift+4])/smma5_arr[kdata_shift+4])*100;
   double smma5_change5 = ((smma5_arr[kdata_shift+4] - smma5_arr[kdata_shift+5])/smma5_arr[kdata_shift+5])*100;
   double smma5_change6 = ((smma5_arr[kdata_shift+5] - smma5_arr[kdata_shift+6])/smma5_arr[kdata_shift+6])*100;
   double smma5_change7 = ((smma5_arr[kdata_shift+6] - smma5_arr[kdata_shift+7])/smma5_arr[kdata_shift+7])*100;
   double smma5_change8 = ((smma5_arr[kdata_shift+7] - smma5_arr[kdata_shift+8])/smma5_arr[kdata_shift+8])*100;
   double smma5_change9 = ((smma5_arr[kdata_shift+8] - smma5_arr[kdata_shift+9])/smma5_arr[kdata_shift+9])*100;
   double smma5_change10 = ((smma5_arr[kdata_shift+9] - smma5_arr[kdata_shift+10])/smma5_arr[kdata_shift+10])*100;

   double smma5_current_change1 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+1])/smma5_arr[kdata_shift+1])*100;
   double smma5_current_change2 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+2])/smma5_arr[kdata_shift+2])*100;
   double smma5_current_change3 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+3])/smma5_arr[kdata_shift+3])*100;
   double smma5_current_change4 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+4])/smma5_arr[kdata_shift+4])*100;
   double smma5_current_change5 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+5])/smma5_arr[kdata_shift+5])*100;
   double smma5_current_change6 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+6])/smma5_arr[kdata_shift+6])*100;
   double smma5_current_change7 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+7])/smma5_arr[kdata_shift+7])*100;
   double smma5_current_change8 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+8])/smma5_arr[kdata_shift+8])*100;
   double smma5_current_change9 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+9])/smma5_arr[kdata_shift+9])*100;
   double smma5_current_change10 = ((smma5_arr[kdata_shift] - smma5_arr[kdata_shift+10])/smma5_arr[kdata_shift+10])*100;

   double smma10_change1 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+1])/smma10_arr[kdata_shift+1])*100;
   double smma10_change2 = ((smma10_arr[kdata_shift+1] - smma10_arr[kdata_shift+2])/smma10_arr[kdata_shift+2])*100;
   double smma10_change3 = ((smma10_arr[kdata_shift+2] - smma10_arr[kdata_shift+3])/smma10_arr[kdata_shift+3])*100;
   double smma10_change4 = ((smma10_arr[kdata_shift+3] - smma10_arr[kdata_shift+4])/smma10_arr[kdata_shift+4])*100;
   double smma10_change5 = ((smma10_arr[kdata_shift+4] - smma10_arr[kdata_shift+5])/smma10_arr[kdata_shift+5])*100;
   double smma10_change6 = ((smma10_arr[kdata_shift+5] - smma10_arr[kdata_shift+6])/smma10_arr[kdata_shift+6])*100;
   double smma10_change7 = ((smma10_arr[kdata_shift+6] - smma10_arr[kdata_shift+7])/smma10_arr[kdata_shift+7])*100;
   double smma10_change8 = ((smma10_arr[kdata_shift+7] - smma10_arr[kdata_shift+8])/smma10_arr[kdata_shift+8])*100;
   double smma10_change9 = ((smma10_arr[kdata_shift+8] - smma10_arr[kdata_shift+9])/smma10_arr[kdata_shift+9])*100;
   double smma10_change10 = ((smma10_arr[kdata_shift+9] - smma10_arr[kdata_shift+10])/smma10_arr[kdata_shift+10])*100;

   double smma10_current_change1 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+1])/smma10_arr[kdata_shift+1])*100;
   double smma10_current_change2 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+2])/smma10_arr[kdata_shift+2])*100;
   double smma10_current_change3 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+3])/smma10_arr[kdata_shift+3])*100;
   double smma10_current_change4 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+4])/smma10_arr[kdata_shift+4])*100;
   double smma10_current_change5 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+5])/smma10_arr[kdata_shift+5])*100;
   double smma10_current_change6 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+6])/smma10_arr[kdata_shift+6])*100;
   double smma10_current_change7 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+7])/smma10_arr[kdata_shift+7])*100;
   double smma10_current_change8 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+8])/smma10_arr[kdata_shift+8])*100;
   double smma10_current_change9 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+9])/smma10_arr[kdata_shift+9])*100;
   double smma10_current_change10 = ((smma10_arr[kdata_shift] - smma10_arr[kdata_shift+10])/smma10_arr[kdata_shift+10])*100;

//ArrayPrint(smma5_arr);
//ArrayPrint(smma10_arr);
//----------------------------------------SMMA反映情况类型判定----------------------------------------
   double smma_5_10_type = TypeSMMA(smma5_arr, smma10_arr, close_, kdata_shift);



//LWMA
   double lwma5_arr[];
   double lwma10_arr[];
   MA(lwma5_arr,_Symbol,timeframe_currently,5,0,MODE_LWMA,PRICE_CLOSE,count_num);
   MA(lwma10_arr,_Symbol,timeframe_currently,10,0,MODE_LWMA,PRICE_CLOSE,count_num);

   double lwma5 = lwma5_arr[kdata_shift];
   double lwma10 = lwma10_arr[kdata_shift];

   double lwma5_change1 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+1])/lwma5_arr[kdata_shift+1])*100;     //lwma变化率
   double lwma5_change2 = ((lwma5_arr[kdata_shift+1] - lwma5_arr[kdata_shift+2])/lwma5_arr[kdata_shift+2])*100;
   double lwma5_change3 = ((lwma5_arr[kdata_shift+2] - lwma5_arr[kdata_shift+3])/lwma5_arr[kdata_shift+3])*100;
   double lwma5_change4 = ((lwma5_arr[kdata_shift+3] - lwma5_arr[kdata_shift+4])/lwma5_arr[kdata_shift+4])*100;
   double lwma5_change5 = ((lwma5_arr[kdata_shift+4] - lwma5_arr[kdata_shift+5])/lwma5_arr[kdata_shift+5])*100;
   double lwma5_change6 = ((lwma5_arr[kdata_shift+5] - lwma5_arr[kdata_shift+6])/lwma5_arr[kdata_shift+6])*100;
   double lwma5_change7 = ((lwma5_arr[kdata_shift+6] - lwma5_arr[kdata_shift+7])/lwma5_arr[kdata_shift+7])*100;
   double lwma5_change8 = ((lwma5_arr[kdata_shift+7] - lwma5_arr[kdata_shift+8])/lwma5_arr[kdata_shift+8])*100;
   double lwma5_change9 = ((lwma5_arr[kdata_shift+8] - lwma5_arr[kdata_shift+9])/lwma5_arr[kdata_shift+9])*100;
   double lwma5_change10 = ((lwma5_arr[kdata_shift+9] - lwma5_arr[kdata_shift+10])/lwma5_arr[kdata_shift+10])*100;

   double lwma5_current_change1 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+1])/lwma5_arr[kdata_shift+1])*100;
   double lwma5_current_change2 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+2])/lwma5_arr[kdata_shift+2])*100;
   double lwma5_current_change3 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+3])/lwma5_arr[kdata_shift+3])*100;
   double lwma5_current_change4 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+4])/lwma5_arr[kdata_shift+4])*100;
   double lwma5_current_change5 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+5])/lwma5_arr[kdata_shift+5])*100;
   double lwma5_current_change6 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+6])/lwma5_arr[kdata_shift+6])*100;
   double lwma5_current_change7 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+7])/lwma5_arr[kdata_shift+7])*100;
   double lwma5_current_change8 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+8])/lwma5_arr[kdata_shift+8])*100;
   double lwma5_current_change9 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+9])/lwma5_arr[kdata_shift+9])*100;
   double lwma5_current_change10 = ((lwma5_arr[kdata_shift] - lwma5_arr[kdata_shift+10])/lwma5_arr[kdata_shift+10])*100;

   double lwma10_change1 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+1])/lwma10_arr[kdata_shift+1])*100;
   double lwma10_change2 = ((lwma10_arr[kdata_shift+1] - lwma10_arr[kdata_shift+2])/lwma10_arr[kdata_shift+2])*100;
   double lwma10_change3 = ((lwma10_arr[kdata_shift+2] - lwma10_arr[kdata_shift+3])/lwma10_arr[kdata_shift+3])*100;
   double lwma10_change4 = ((lwma10_arr[kdata_shift+3] - lwma10_arr[kdata_shift+4])/lwma10_arr[kdata_shift+4])*100;
   double lwma10_change5 = ((lwma10_arr[kdata_shift+4] - lwma10_arr[kdata_shift+5])/lwma10_arr[kdata_shift+5])*100;
   double lwma10_change6 = ((lwma10_arr[kdata_shift+5] - lwma10_arr[kdata_shift+6])/lwma10_arr[kdata_shift+6])*100;
   double lwma10_change7 = ((lwma10_arr[kdata_shift+6] - lwma10_arr[kdata_shift+7])/lwma10_arr[kdata_shift+7])*100;
   double lwma10_change8 = ((lwma10_arr[kdata_shift+7] - lwma10_arr[kdata_shift+8])/lwma10_arr[kdata_shift+8])*100;
   double lwma10_change9 = ((lwma10_arr[kdata_shift+8] - lwma10_arr[kdata_shift+9])/lwma10_arr[kdata_shift+9])*100;
   double lwma10_change10 = ((lwma10_arr[kdata_shift+9] - lwma10_arr[kdata_shift+10])/lwma10_arr[kdata_shift+10])*100;

   double lwma10_current_change1 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+1])/lwma10_arr[kdata_shift+1])*100;
   double lwma10_current_change2 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+2])/lwma10_arr[kdata_shift+2])*100;
   double lwma10_current_change3 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+3])/lwma10_arr[kdata_shift+3])*100;
   double lwma10_current_change4 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+4])/lwma10_arr[kdata_shift+4])*100;
   double lwma10_current_change5 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+5])/lwma10_arr[kdata_shift+5])*100;
   double lwma10_current_change6 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+6])/lwma10_arr[kdata_shift+6])*100;
   double lwma10_current_change7 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+7])/lwma10_arr[kdata_shift+7])*100;
   double lwma10_current_change8 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+8])/lwma10_arr[kdata_shift+8])*100;
   double lwma10_current_change9 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+9])/lwma10_arr[kdata_shift+9])*100;
   double lwma10_current_change10 = ((lwma10_arr[kdata_shift] - lwma10_arr[kdata_shift+10])/lwma10_arr[kdata_shift+10])*100;


//ArrayPrint(lwma5_arr);
//ArrayPrint(lwma10_arr);
//----------------------------------------LWMA反映情况类型判定----------------------------------------
   double lwma_5_10_type = TypeLWMA(lwma5_arr, lwma10_arr, close_, kdata_shift);


//RSI
   double rsi5_arr[];
   double rsi14_arr[];
   RSI(rsi5_arr,_Symbol,timeframe_currently,5,PRICE_CLOSE,count_num);
   RSI(rsi14_arr,_Symbol,timeframe_currently,14,PRICE_CLOSE,count_num);

   double rsi5 = rsi5_arr[kdata_shift];
   double rsi14 = rsi14_arr[kdata_shift];


   double rsi5_change1 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+1])/(rsi5_arr[kdata_shift+1]+1E-15))*100;     //rsi变化率
   double rsi5_change2 = ((rsi5_arr[kdata_shift+1] - rsi5_arr[kdata_shift+2])/(rsi5_arr[kdata_shift+2]+1E-15))*100;
   double rsi5_change3 = ((rsi5_arr[kdata_shift+2] - rsi5_arr[kdata_shift+3])/(rsi5_arr[kdata_shift+3]+1E-15))*100;
   double rsi5_change4 = ((rsi5_arr[kdata_shift+3] - rsi5_arr[kdata_shift+4])/(rsi5_arr[kdata_shift+4]+1E-15))*100;
   double rsi5_change5 = ((rsi5_arr[kdata_shift+4] - rsi5_arr[kdata_shift+5])/(rsi5_arr[kdata_shift+5]+1E-15))*100;
   double rsi5_change6 = ((rsi5_arr[kdata_shift+5] - rsi5_arr[kdata_shift+6])/(rsi5_arr[kdata_shift+6]+1E-15))*100;
   double rsi5_change7 = ((rsi5_arr[kdata_shift+6] - rsi5_arr[kdata_shift+7])/(rsi5_arr[kdata_shift+7]+1E-15))*100;
   double rsi5_change8 = ((rsi5_arr[kdata_shift+7] - rsi5_arr[kdata_shift+8])/(rsi5_arr[kdata_shift+8]+1E-15))*100;
   double rsi5_change9 = ((rsi5_arr[kdata_shift+8] - rsi5_arr[kdata_shift+9])/(rsi5_arr[kdata_shift+9]+1E-15))*100;
   double rsi5_change10 = ((rsi5_arr[kdata_shift+9] - rsi5_arr[kdata_shift+10])/(rsi5_arr[kdata_shift+10]+1E-15))*100;

   double rsi5_current_change1 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+1])/(rsi5_arr[kdata_shift+1]+1E-15))*100;
   double rsi5_current_change2 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+2])/(rsi5_arr[kdata_shift+2]+1E-15))*100;
   double rsi5_current_change3 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+3])/(rsi5_arr[kdata_shift+3]+1E-15))*100;
   double rsi5_current_change4 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+4])/(rsi5_arr[kdata_shift+4]+1E-15))*100;
   double rsi5_current_change5 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+5])/(rsi5_arr[kdata_shift+5]+1E-15))*100;
   double rsi5_current_change6 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+6])/(rsi5_arr[kdata_shift+6]+1E-15))*100;
   double rsi5_current_change7 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+7])/(rsi5_arr[kdata_shift+7]+1E-15))*100;
   double rsi5_current_change8 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+8])/(rsi5_arr[kdata_shift+8]+1E-15))*100;
   double rsi5_current_change9 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+9])/(rsi5_arr[kdata_shift+9]+1E-15))*100;
   double rsi5_current_change10 = ((rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+10])/(rsi5_arr[kdata_shift+10]+1E-15))*100;

   double rsi14_change1 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+1])/(rsi14_arr[kdata_shift+1]+1E-15))*100;
   double rsi14_change2 = ((rsi14_arr[kdata_shift+1] - rsi14_arr[kdata_shift+2])/(rsi14_arr[kdata_shift+2]+1E-15))*100;
   double rsi14_change3 = ((rsi14_arr[kdata_shift+2] - rsi14_arr[kdata_shift+3])/(rsi14_arr[kdata_shift+3]+1E-15))*100;
   double rsi14_change4 = ((rsi14_arr[kdata_shift+3] - rsi14_arr[kdata_shift+4])/(rsi14_arr[kdata_shift+4]+1E-15))*100;
   double rsi14_change5 = ((rsi14_arr[kdata_shift+4] - rsi14_arr[kdata_shift+5])/(rsi14_arr[kdata_shift+5]+1E-15))*100;
   double rsi14_change6 = ((rsi14_arr[kdata_shift+5] - rsi14_arr[kdata_shift+6])/(rsi14_arr[kdata_shift+6]+1E-15))*100;
   double rsi14_change7 = ((rsi14_arr[kdata_shift+6] - rsi14_arr[kdata_shift+7])/(rsi14_arr[kdata_shift+7]+1E-15))*100;
   double rsi14_change8 = ((rsi14_arr[kdata_shift+7] - rsi14_arr[kdata_shift+8])/(rsi14_arr[kdata_shift+8]+1E-15))*100;
   double rsi14_change9 = ((rsi14_arr[kdata_shift+8] - rsi14_arr[kdata_shift+9])/(rsi14_arr[kdata_shift+9]+1E-15))*100;
   double rsi14_change10 = ((rsi14_arr[kdata_shift+9] - rsi14_arr[kdata_shift+10])/(rsi14_arr[kdata_shift+10]+1E-15))*100;

   double rsi14_current_change1 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+1])/(rsi14_arr[kdata_shift+1]+1E-15))*100;
   double rsi14_current_change2 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+2])/(rsi14_arr[kdata_shift+2]+1E-15))*100;
   double rsi14_current_change3 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+3])/(rsi14_arr[kdata_shift+3]+1E-15))*100;
   double rsi14_current_change4 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+4])/(rsi14_arr[kdata_shift+4]+1E-15))*100;
   double rsi14_current_change5 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+5])/(rsi14_arr[kdata_shift+5]+1E-15))*100;
   double rsi14_current_change6 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+6])/(rsi14_arr[kdata_shift+6]+1E-15))*100;
   double rsi14_current_change7 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+7])/(rsi14_arr[kdata_shift+7]+1E-15))*100;
   double rsi14_current_change8 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+8])/(rsi14_arr[kdata_shift+8]+1E-15))*100;
   double rsi14_current_change9 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+9])/(rsi14_arr[kdata_shift+9]+1E-15))*100;
   double rsi14_current_change10 = ((rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+10])/(rsi14_arr[kdata_shift+10]+1E-15))*100;

   double rsi5_changeValue1 = rsi5_arr[kdata_shift] - rsi5_arr[kdata_shift+1];      //rsi变化值
   double rsi5_changeValue2 = rsi5_arr[kdata_shift+1] - rsi5_arr[kdata_shift+2];
   double rsi5_changeValue3 = rsi5_arr[kdata_shift+2] - rsi5_arr[kdata_shift+3];
   double rsi5_changeValue4 = rsi5_arr[kdata_shift+3] - rsi5_arr[kdata_shift+4];
   double rsi5_changeValue5 = rsi5_arr[kdata_shift+4] - rsi5_arr[kdata_shift+5];
   double rsi5_changeValue6 = rsi5_arr[kdata_shift+5] - rsi5_arr[kdata_shift+6];
   double rsi5_changeValue7 = rsi5_arr[kdata_shift+6] - rsi5_arr[kdata_shift+7];
   double rsi5_changeValue8 = rsi5_arr[kdata_shift+7] - rsi5_arr[kdata_shift+8];
   double rsi5_changeValue9 = rsi5_arr[kdata_shift+8] - rsi5_arr[kdata_shift+9];
   double rsi5_changeValue10 = rsi5_arr[kdata_shift+9] - rsi5_arr[kdata_shift+10];

   double rsi14_changeValue1 = rsi14_arr[kdata_shift] - rsi14_arr[kdata_shift+1];
   double rsi14_changeValue2 = rsi14_arr[kdata_shift+1] - rsi14_arr[kdata_shift+2];
   double rsi14_changeValue3 = rsi14_arr[kdata_shift+2] - rsi14_arr[kdata_shift+3];
   double rsi14_changeValue4 = rsi14_arr[kdata_shift+3] - rsi14_arr[kdata_shift+4];
   double rsi14_changeValue5 = rsi14_arr[kdata_shift+4] - rsi14_arr[kdata_shift+5];
   double rsi14_changeValue6 = rsi14_arr[kdata_shift+5] - rsi14_arr[kdata_shift+6];
   double rsi14_changeValue7 = rsi14_arr[kdata_shift+6] - rsi14_arr[kdata_shift+7];
   double rsi14_changeValue8 = rsi14_arr[kdata_shift+7] - rsi14_arr[kdata_shift+8];
   double rsi14_changeValue9 = rsi14_arr[kdata_shift+8] - rsi14_arr[kdata_shift+9];
   double rsi14_changeValue10 = rsi14_arr[kdata_shift+9] - rsi14_arr[kdata_shift+10];


//ArrayPrint(rsi5_arr);
//ArrayPrint(rsi14_arr);
//----------------------------------------RSI反映情况类型判定----------------------------------------
   double rsi_5_14_type = TypeRSI(rsi5_arr, rsi14_arr, kdata_shift);


//SAR
   double sar_arr[];
   SAR(sar_arr,_Symbol,timeframe_currently,0.02,2,count_num);

   double sar = sar_arr[kdata_shift];


   double sar_change1 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+1])/sar_arr[kdata_shift+1])*100;     //sar变化率
   double sar_change2 = ((sar_arr[kdata_shift+1] - sar_arr[kdata_shift+2])/sar_arr[kdata_shift+2])*100;
   double sar_change3 = ((sar_arr[kdata_shift+2] - sar_arr[kdata_shift+3])/sar_arr[kdata_shift+3])*100;
   double sar_change4 = ((sar_arr[kdata_shift+3] - sar_arr[kdata_shift+4])/sar_arr[kdata_shift+4])*100;
   double sar_change5 = ((sar_arr[kdata_shift+4] - sar_arr[kdata_shift+5])/sar_arr[kdata_shift+5])*100;
   double sar_change6 = ((sar_arr[kdata_shift+5] - sar_arr[kdata_shift+6])/sar_arr[kdata_shift+6])*100;
   double sar_change7 = ((sar_arr[kdata_shift+6] - sar_arr[kdata_shift+7])/sar_arr[kdata_shift+7])*100;
   double sar_change8 = ((sar_arr[kdata_shift+7] - sar_arr[kdata_shift+8])/sar_arr[kdata_shift+8])*100;
   double sar_change9 = ((sar_arr[kdata_shift+8] - sar_arr[kdata_shift+9])/sar_arr[kdata_shift+9])*100;
   double sar_change10 = ((sar_arr[kdata_shift+9] - sar_arr[kdata_shift+10])/sar_arr[kdata_shift+10])*100;

   double sar_current_change1 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+1])/sar_arr[kdata_shift+1])*100;
   double sar_current_change2 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+2])/sar_arr[kdata_shift+2])*100;
   double sar_current_change3 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+3])/sar_arr[kdata_shift+3])*100;
   double sar_current_change4 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+4])/sar_arr[kdata_shift+4])*100;
   double sar_current_change5 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+5])/sar_arr[kdata_shift+5])*100;
   double sar_current_change6 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+6])/sar_arr[kdata_shift+6])*100;
   double sar_current_change7 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+7])/sar_arr[kdata_shift+7])*100;
   double sar_current_change8 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+8])/sar_arr[kdata_shift+8])*100;
   double sar_current_change9 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+9])/sar_arr[kdata_shift+9])*100;
   double sar_current_change10 = ((sar_arr[kdata_shift] - sar_arr[kdata_shift+10])/sar_arr[kdata_shift+10])*100;

   double sar_changeValue1 = sar_arr[kdata_shift] - sar_arr[kdata_shift+1];     //sar变化值
   double sar_changeValue2 = sar_arr[kdata_shift+1] - sar_arr[kdata_shift+2];
   double sar_changeValue3 = sar_arr[kdata_shift+2] - sar_arr[kdata_shift+3];
   double sar_changeValue4 = sar_arr[kdata_shift+3] - sar_arr[kdata_shift+4];
   double sar_changeValue5 = sar_arr[kdata_shift+4] - sar_arr[kdata_shift+5];
   double sar_changeValue6 = sar_arr[kdata_shift+5] - sar_arr[kdata_shift+6];
   double sar_changeValue7 = sar_arr[kdata_shift+6] - sar_arr[kdata_shift+7];
   double sar_changeValue8 = sar_arr[kdata_shift+7] - sar_arr[kdata_shift+8];
   double sar_changeValue9 = sar_arr[kdata_shift+8] - sar_arr[kdata_shift+9];
   double sar_changeValue10 = sar_arr[kdata_shift+9] - sar_arr[kdata_shift+10];


//ArrayPrint(sar_arr);
//----------------------------------------SAR反映情况类型判定----------------------------------------
   double sar_type = TypeSAR(sar_arr, close_, kdata_shift);


//ADX
   double adx_arr[];
   double DI_plus_arr[];
   double DI_minus_arr[];
   ADX(adx_arr,DI_plus_arr,DI_minus_arr,_Symbol,timeframe_currently,5,count_num);

   double adx = adx_arr[kdata_shift];
   double adx_DI_plus = DI_plus_arr[kdata_shift];
   double adx_DI_minus = DI_minus_arr[kdata_shift];

   double adx_change1 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+1])/(adx_arr[kdata_shift+1]+1E-15))*100;     //adx变化率
   double adx_change2 = ((adx_arr[kdata_shift+1] - adx_arr[kdata_shift+2])/(adx_arr[kdata_shift+2]+1E-15))*100;
   double adx_change3 = ((adx_arr[kdata_shift+2] - adx_arr[kdata_shift+3])/(adx_arr[kdata_shift+3]+1E-15))*100;
   double adx_change4 = ((adx_arr[kdata_shift+3] - adx_arr[kdata_shift+4])/(adx_arr[kdata_shift+4]+1E-15))*100;
   double adx_change5 = ((adx_arr[kdata_shift+4] - adx_arr[kdata_shift+5])/(adx_arr[kdata_shift+5]+1E-15))*100;
   double adx_change6 = ((adx_arr[kdata_shift+5] - adx_arr[kdata_shift+6])/(adx_arr[kdata_shift+6]+1E-15))*100;
   double adx_change7 = ((adx_arr[kdata_shift+6] - adx_arr[kdata_shift+7])/(adx_arr[kdata_shift+7]+1E-15))*100;
   double adx_change8 = ((adx_arr[kdata_shift+7] - adx_arr[kdata_shift+8])/(adx_arr[kdata_shift+8]+1E-15))*100;
   double adx_change9 = ((adx_arr[kdata_shift+8] - adx_arr[kdata_shift+9])/(adx_arr[kdata_shift+9]+1E-15))*100;
   double adx_change10 = ((adx_arr[kdata_shift+9] - adx_arr[kdata_shift+10])/(adx_arr[kdata_shift+10]+1E-15))*100;

   double adx_current_change1 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+1])/(adx_arr[kdata_shift+1]+1E-15))*100;
   double adx_current_change2 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+2])/(adx_arr[kdata_shift+2]+1E-15))*100;
   double adx_current_change3 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+3])/(adx_arr[kdata_shift+3]+1E-15))*100;
   double adx_current_change4 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+4])/(adx_arr[kdata_shift+4]+1E-15))*100;
   double adx_current_change5 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+5])/(adx_arr[kdata_shift+5]+1E-15))*100;
   double adx_current_change6 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+6])/(adx_arr[kdata_shift+6]+1E-15))*100;
   double adx_current_change7 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+7])/(adx_arr[kdata_shift+7]+1E-15))*100;
   double adx_current_change8 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+8])/(adx_arr[kdata_shift+8]+1E-15))*100;
   double adx_current_change9 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+9])/(adx_arr[kdata_shift+9]+1E-15))*100;
   double adx_current_change10 = ((adx_arr[kdata_shift] - adx_arr[kdata_shift+10])/(adx_arr[kdata_shift+10]+1E-15))*100;

   double adx_changeValue1 = adx_arr[kdata_shift] - adx_arr[kdata_shift+1];
   double adx_changeValue2 = adx_arr[kdata_shift+1] - adx_arr[kdata_shift+2];
   double adx_changeValue3 = adx_arr[kdata_shift+2] - adx_arr[kdata_shift+3];
   double adx_changeValue4 = adx_arr[kdata_shift+3] - adx_arr[kdata_shift+4];
   double adx_changeValue5 = adx_arr[kdata_shift+4] - adx_arr[kdata_shift+5];
   double adx_changeValue6 = adx_arr[kdata_shift+5] - adx_arr[kdata_shift+6];
   double adx_changeValue7 = adx_arr[kdata_shift+6] - adx_arr[kdata_shift+7];
   double adx_changeValue8 = adx_arr[kdata_shift+7] - adx_arr[kdata_shift+8];
   double adx_changeValue9 = adx_arr[kdata_shift+8] - adx_arr[kdata_shift+9];
   double adx_changeValue10 = adx_arr[kdata_shift+9] - adx_arr[kdata_shift+10];

//ArrayPrint(adx_arr);
//ArrayPrint(DI_plus_arr);
//ArrayPrint(DI_minus_arr);
//----------------------------------------ADX反映情况类型判定----------------------------------------
   double adx_type = TypeADX(adx_arr, kdata_shift);


//CCI
   double cci_arr[];
   CCI(cci_arr,_Symbol,timeframe_currently,5,PRICE_CLOSE,count_num);

   double cci = cci_arr[kdata_shift];


   double cci_change1 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+1])/(MathAbs(cci_arr[kdata_shift+1])+1E-15))*100;     //cci变化率
   double cci_change2 = ((cci_arr[kdata_shift+1] - cci_arr[kdata_shift+2])/(MathAbs(cci_arr[kdata_shift+2])+1E-15))*100;
   double cci_change3 = ((cci_arr[kdata_shift+2] - cci_arr[kdata_shift+3])/(MathAbs(cci_arr[kdata_shift+3])+1E-15))*100;
   double cci_change4 = ((cci_arr[kdata_shift+3] - cci_arr[kdata_shift+4])/(MathAbs(cci_arr[kdata_shift+4])+1E-15))*100;
   double cci_change5 = ((cci_arr[kdata_shift+4] - cci_arr[kdata_shift+5])/(MathAbs(cci_arr[kdata_shift+5])+1E-15))*100;
   double cci_change6 = ((cci_arr[kdata_shift+5] - cci_arr[kdata_shift+6])/(MathAbs(cci_arr[kdata_shift+6])+1E-15))*100;
   double cci_change7 = ((cci_arr[kdata_shift+6] - cci_arr[kdata_shift+7])/(MathAbs(cci_arr[kdata_shift+7])+1E-15))*100;
   double cci_change8 = ((cci_arr[kdata_shift+7] - cci_arr[kdata_shift+8])/(MathAbs(cci_arr[kdata_shift+8])+1E-15))*100;
   double cci_change9 = ((cci_arr[kdata_shift+8] - cci_arr[kdata_shift+9])/(MathAbs(cci_arr[kdata_shift+9])+1E-15))*100;
   double cci_change10 = ((cci_arr[kdata_shift+9] - cci_arr[kdata_shift+10])/(MathAbs(cci_arr[kdata_shift+10])+1E-15))*100;

   double cci_current_change1 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+1])/(MathAbs(cci_arr[kdata_shift+1])+1E-15))*100;
   double cci_current_change2 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+2])/(MathAbs(cci_arr[kdata_shift+2])+1E-15))*100;
   double cci_current_change3 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+3])/(MathAbs(cci_arr[kdata_shift+3])+1E-15))*100;
   double cci_current_change4 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+4])/(MathAbs(cci_arr[kdata_shift+4])+1E-15))*100;
   double cci_current_change5 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+5])/(MathAbs(cci_arr[kdata_shift+5])+1E-15))*100;
   double cci_current_change6 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+6])/(MathAbs(cci_arr[kdata_shift+6])+1E-15))*100;
   double cci_current_change7 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+7])/(MathAbs(cci_arr[kdata_shift+7])+1E-15))*100;
   double cci_current_change8 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+8])/(MathAbs(cci_arr[kdata_shift+8])+1E-15))*100;
   double cci_current_change9 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+9])/(MathAbs(cci_arr[kdata_shift+9])+1E-15))*100;
   double cci_current_change10 = ((cci_arr[kdata_shift] - cci_arr[kdata_shift+10])/(MathAbs(cci_arr[kdata_shift+10])+1E-15))*100;

   double cci_changeValue1 = cci_arr[kdata_shift] - cci_arr[kdata_shift+1];     //cci变化值
   double cci_changeValue2 = cci_arr[kdata_shift+1] - cci_arr[kdata_shift+2];
   double cci_changeValue3 = cci_arr[kdata_shift+2] - cci_arr[kdata_shift+3];
   double cci_changeValue4 = cci_arr[kdata_shift+3] - cci_arr[kdata_shift+4];
   double cci_changeValue5 = cci_arr[kdata_shift+4] - cci_arr[kdata_shift+5];
   double cci_changeValue6 = cci_arr[kdata_shift+5] - cci_arr[kdata_shift+6];
   double cci_changeValue7 = cci_arr[kdata_shift+6] - cci_arr[kdata_shift+7];
   double cci_changeValue8 = cci_arr[kdata_shift+7] - cci_arr[kdata_shift+8];
   double cci_changeValue9 = cci_arr[kdata_shift+8] - cci_arr[kdata_shift+9];
   double cci_changeValue10 = cci_arr[kdata_shift+9] - cci_arr[kdata_shift+10];


//ArrayPrint(cci_arr);
//----------------------------------------CCI反映情况类型判定----------------------------------------
   double cci_type = TypeCCI(cci_arr, kdata_shift);

//BOLL
   double base_arr[];
   double upper_arr[];
   double lower_arr[];
   Bands(base_arr,upper_arr,lower_arr,_Symbol,timeframe_currently,5,0,2,PRICE_CLOSE,count_num);

   double boll_upper_band = upper_arr[kdata_shift];
   double boll_middle_band = base_arr[kdata_shift];
   double boll_lower_band = lower_arr[kdata_shift];


   double boll_change1 = ((base_arr[kdata_shift] - base_arr[kdata_shift+1])/base_arr[kdata_shift+1])*100;     //boll_middle_band变化率
   double boll_change2 = ((base_arr[kdata_shift+1] - base_arr[kdata_shift+2])/base_arr[kdata_shift+2])*100;
   double boll_change3 = ((base_arr[kdata_shift+2] - base_arr[kdata_shift+3])/base_arr[kdata_shift+3])*100;
   double boll_change4 = ((base_arr[kdata_shift+3] - base_arr[kdata_shift+4])/base_arr[kdata_shift+4])*100;
   double boll_change5 = ((base_arr[kdata_shift+4] - base_arr[kdata_shift+5])/base_arr[kdata_shift+5])*100;
   double boll_change6 = ((base_arr[kdata_shift+5] - base_arr[kdata_shift+6])/base_arr[kdata_shift+6])*100;
   double boll_change7 = ((base_arr[kdata_shift+6] - base_arr[kdata_shift+7])/base_arr[kdata_shift+7])*100;
   double boll_change8 = ((base_arr[kdata_shift+7] - base_arr[kdata_shift+8])/base_arr[kdata_shift+8])*100;
   double boll_change9 = ((base_arr[kdata_shift+8] - base_arr[kdata_shift+9])/base_arr[kdata_shift+9])*100;
   double boll_change10 = ((base_arr[kdata_shift+9] - base_arr[kdata_shift+10])/base_arr[kdata_shift+10])*100;

   double boll_current_change1 = ((base_arr[kdata_shift] - base_arr[kdata_shift+1])/base_arr[kdata_shift+1])*100;
   double boll_current_change2 = ((base_arr[kdata_shift] - base_arr[kdata_shift+2])/base_arr[kdata_shift+2])*100;
   double boll_current_change3 = ((base_arr[kdata_shift] - base_arr[kdata_shift+3])/base_arr[kdata_shift+3])*100;
   double boll_current_change4 = ((base_arr[kdata_shift] - base_arr[kdata_shift+4])/base_arr[kdata_shift+4])*100;
   double boll_current_change5 = ((base_arr[kdata_shift] - base_arr[kdata_shift+5])/base_arr[kdata_shift+5])*100;
   double boll_current_change6 = ((base_arr[kdata_shift] - base_arr[kdata_shift+6])/base_arr[kdata_shift+6])*100;
   double boll_current_change7 = ((base_arr[kdata_shift] - base_arr[kdata_shift+7])/base_arr[kdata_shift+7])*100;
   double boll_current_change8 = ((base_arr[kdata_shift] - base_arr[kdata_shift+8])/base_arr[kdata_shift+8])*100;
   double boll_current_change9 = ((base_arr[kdata_shift] - base_arr[kdata_shift+9])/base_arr[kdata_shift+9])*100;
   double boll_current_change10 = ((base_arr[kdata_shift] - base_arr[kdata_shift+10])/base_arr[kdata_shift+10])*100;


//ArrayPrint(base_arr);
//ArrayPrint(upper_arr);
//ArrayPrint(lower_arr);
//------------------------------BOLL反映情况类型判定----------------------------------------
   double boll_type = TypeBOLL(base_arr, upper_arr, lower_arr, open_, close_, kdata_shift);



//STOCH
   double slowK_arr[];
   double slowD_arr[];
   STOCH(slowK_arr,slowD_arr,_Symbol,timeframe_currently,5,3,3,MODE_SMA,STO_CLOSECLOSE,count_num);

   double slowk = slowK_arr[kdata_shift];
   double slowd = slowD_arr[kdata_shift];



   double slowk_change1 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+1])/(slowK_arr[kdata_shift+1]+1E-15))*100;     //
   double slowk_change2 = ((slowK_arr[kdata_shift+1] - slowK_arr[kdata_shift+2])/(slowK_arr[kdata_shift+2]+1E-15))*100;
   double slowk_change3 = ((slowK_arr[kdata_shift+2] - slowK_arr[kdata_shift+3])/(slowK_arr[kdata_shift+3]+1E-15))*100;
   double slowk_change4 = ((slowK_arr[kdata_shift+3] - slowK_arr[kdata_shift+4])/(slowK_arr[kdata_shift+4]+1E-15))*100;
   double slowk_change5 = ((slowK_arr[kdata_shift+4] - slowK_arr[kdata_shift+5])/(slowK_arr[kdata_shift+5]+1E-15))*100;
   double slowk_change6 = ((slowK_arr[kdata_shift+5] - slowK_arr[kdata_shift+6])/(slowK_arr[kdata_shift+6]+1E-15))*100;
   double slowk_change7 = ((slowK_arr[kdata_shift+6] - slowK_arr[kdata_shift+7])/(slowK_arr[kdata_shift+7]+1E-15))*100;
   double slowk_change8 = ((slowK_arr[kdata_shift+7] - slowK_arr[kdata_shift+8])/(slowK_arr[kdata_shift+8]+1E-15))*100;
   double slowk_change9 = ((slowK_arr[kdata_shift+8] - slowK_arr[kdata_shift+9])/(slowK_arr[kdata_shift+9]+1E-15))*100;
   double slowk_change10 = ((slowK_arr[kdata_shift+9] - slowK_arr[kdata_shift+10])/(slowK_arr[kdata_shift+10]+1E-15))*100;



   double slowk_current_change1 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+1])/(slowK_arr[kdata_shift+1]+1E-15))*100;
   double slowk_current_change2 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+2])/(slowK_arr[kdata_shift+2]+1E-15))*100;
   double slowk_current_change3 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+3])/(slowK_arr[kdata_shift+3]+1E-15))*100;
   double slowk_current_change4 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+4])/(slowK_arr[kdata_shift+4]+1E-15))*100;
   double slowk_current_change5 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+5])/(slowK_arr[kdata_shift+5]+1E-15))*100;
   double slowk_current_change6 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+6])/(slowK_arr[kdata_shift+6]+1E-15))*100;
   double slowk_current_change7 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+7])/(slowK_arr[kdata_shift+7]+1E-15))*100;
   double slowk_current_change8 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+8])/(slowK_arr[kdata_shift+8]+1E-15))*100;
   double slowk_current_change9 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+9])/(slowK_arr[kdata_shift+9]+1E-15))*100;
   double slowk_current_change10 = ((slowK_arr[kdata_shift] - slowK_arr[kdata_shift+10])/(slowK_arr[kdata_shift+10]+1E-15))*100;


   double slowk_changeValue1 = slowK_arr[kdata_shift] - slowK_arr[kdata_shift+1];     //值
   double slowk_changeValue2 = slowK_arr[kdata_shift+1] - slowK_arr[kdata_shift+2];
   double slowk_changeValue3 = slowK_arr[kdata_shift+2] - slowK_arr[kdata_shift+3];
   double slowk_changeValue4 = slowK_arr[kdata_shift+3] - slowK_arr[kdata_shift+4];
   double slowk_changeValue5 = slowK_arr[kdata_shift+4] - slowK_arr[kdata_shift+5];
   double slowk_changeValue6 = slowK_arr[kdata_shift+5] - slowK_arr[kdata_shift+6];
   double slowk_changeValue7 = slowK_arr[kdata_shift+6] - slowK_arr[kdata_shift+7];
   double slowk_changeValue8 = slowK_arr[kdata_shift+7] - slowK_arr[kdata_shift+8];
   double slowk_changeValue9 = slowK_arr[kdata_shift+8] - slowK_arr[kdata_shift+9];
   double slowk_changeValue10 = slowK_arr[kdata_shift+9] - slowK_arr[kdata_shift+10];



//ArrayPrint(slowK_arr);
//ArrayPrint(slowD_arr);
//----------------------------------------STOCH反映情况类型判定----------------------------------------
   double stoch_type = TypeSTOCH(slowK_arr, slowD_arr, kdata_shift);



//AC
   double ac_value_arr[];
   double ac_color_arr[];
   AC(ac_value_arr,ac_color_arr,_Symbol,timeframe_currently,count_num);

   double ac_value = ac_value_arr[kdata_shift];
   double ac_color = ac_color_arr[kdata_shift];


   double ac_change1 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+1])/(MathAbs(ac_value_arr[kdata_shift+1])+1E-15))*100;     //ac变化率
   double ac_change2 = ((ac_value_arr[kdata_shift+1] - ac_value_arr[kdata_shift+2])/(MathAbs(ac_value_arr[kdata_shift+2])+1E-15))*100;
   double ac_change3 = ((ac_value_arr[kdata_shift+2] - ac_value_arr[kdata_shift+3])/(MathAbs(ac_value_arr[kdata_shift+3])+1E-15))*100;
   double ac_change4 = ((ac_value_arr[kdata_shift+3] - ac_value_arr[kdata_shift+4])/(MathAbs(ac_value_arr[kdata_shift+4])+1E-15))*100;
   double ac_change5 = ((ac_value_arr[kdata_shift+4] - ac_value_arr[kdata_shift+5])/(MathAbs(ac_value_arr[kdata_shift+5])+1E-15))*100;
   double ac_change6 = ((ac_value_arr[kdata_shift+5] - ac_value_arr[kdata_shift+6])/(MathAbs(ac_value_arr[kdata_shift+6])+1E-15))*100;
   double ac_change7 = ((ac_value_arr[kdata_shift+6] - ac_value_arr[kdata_shift+7])/(MathAbs(ac_value_arr[kdata_shift+7])+1E-15))*100;
   double ac_change8 = ((ac_value_arr[kdata_shift+7] - ac_value_arr[kdata_shift+8])/(MathAbs(ac_value_arr[kdata_shift+8])+1E-15))*100;
   double ac_change9 = ((ac_value_arr[kdata_shift+8] - ac_value_arr[kdata_shift+9])/(MathAbs(ac_value_arr[kdata_shift+9])+1E-15))*100;
   double ac_change10 = ((ac_value_arr[kdata_shift+9] - ac_value_arr[kdata_shift+10])/(MathAbs(ac_value_arr[kdata_shift+10])+1E-15))*100;


   double ac_current_change1 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+1])/(MathAbs(ac_value_arr[kdata_shift+1])+1E-15))*100;
   double ac_current_change2 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+2])/(MathAbs(ac_value_arr[kdata_shift+2])+1E-15))*100;
   double ac_current_change3 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+3])/(MathAbs(ac_value_arr[kdata_shift+3])+1E-15))*100;
   double ac_current_change4 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+4])/(MathAbs(ac_value_arr[kdata_shift+4])+1E-15))*100;
   double ac_current_change5 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+5])/(MathAbs(ac_value_arr[kdata_shift+5])+1E-15))*100;
   double ac_current_change6 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+6])/(MathAbs(ac_value_arr[kdata_shift+6])+1E-15))*100;
   double ac_current_change7 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+7])/(MathAbs(ac_value_arr[kdata_shift+7])+1E-15))*100;
   double ac_current_change8 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+8])/(MathAbs(ac_value_arr[kdata_shift+8])+1E-15))*100;
   double ac_current_change9 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+9])/(MathAbs(ac_value_arr[kdata_shift+9])+1E-15))*100;
   double ac_current_change10 = ((ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+10])/(MathAbs(ac_value_arr[kdata_shift+10])+1E-15))*100;

   double ac_changeValue1 = ac_value_arr[kdata_shift] - ac_value_arr[kdata_shift+1];     //ac变化值
   double ac_changeValue2 = ac_value_arr[kdata_shift+1] - ac_value_arr[kdata_shift+2];
   double ac_changeValue3 = ac_value_arr[kdata_shift+2] - ac_value_arr[kdata_shift+3];
   double ac_changeValue4 = ac_value_arr[kdata_shift+3] - ac_value_arr[kdata_shift+4];
   double ac_changeValue5 = ac_value_arr[kdata_shift+4] - ac_value_arr[kdata_shift+5];
   double ac_changeValue6 = ac_value_arr[kdata_shift+5] - ac_value_arr[kdata_shift+6];
   double ac_changeValue7 = ac_value_arr[kdata_shift+6] - ac_value_arr[kdata_shift+7];
   double ac_changeValue8 = ac_value_arr[kdata_shift+7] - ac_value_arr[kdata_shift+8];
   double ac_changeValue9 = ac_value_arr[kdata_shift+8] - ac_value_arr[kdata_shift+9];
   double ac_changeValue10 = ac_value_arr[kdata_shift+9] - ac_value_arr[kdata_shift+10];

//printf("AC");
//ArrayPrint(ac_value_arr);
//ArrayPrint(ac_color_arr);
//----------------------------------------AC反映情况类型判定----------------------------------------
   double ac_type = TypeAC(ac_value_arr, ac_color_arr, kdata_shift);



//AD
   double ad_arr[];
   AD(ad_arr,_Symbol,timeframe_currently,VOLUME_TICK,count_num);

   double ad = ad_arr[kdata_shift];

   double ad_change1 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+1])/(MathAbs(ad_arr[kdata_shift+1])+1E-15))*100;     //ad变化率
   double ad_change2 = ((ad_arr[kdata_shift+1] - ad_arr[kdata_shift+2])/(MathAbs(ad_arr[kdata_shift+2])+1E-15))*100;
   double ad_change3 = ((ad_arr[kdata_shift+2] - ad_arr[kdata_shift+3])/(MathAbs(ad_arr[kdata_shift+3])+1E-15))*100;
   double ad_change4 = ((ad_arr[kdata_shift+3] - ad_arr[kdata_shift+4])/(MathAbs(ad_arr[kdata_shift+4])+1E-15))*100;
   double ad_change5 = ((ad_arr[kdata_shift+4] - ad_arr[kdata_shift+5])/(MathAbs(ad_arr[kdata_shift+5])+1E-15))*100;
   double ad_change6 = ((ad_arr[kdata_shift+5] - ad_arr[kdata_shift+6])/(MathAbs(ad_arr[kdata_shift+6])+1E-15))*100;
   double ad_change7 = ((ad_arr[kdata_shift+6] - ad_arr[kdata_shift+7])/(MathAbs(ad_arr[kdata_shift+7])+1E-15))*100;
   double ad_change8 = ((ad_arr[kdata_shift+7] - ad_arr[kdata_shift+8])/(MathAbs(ad_arr[kdata_shift+8])+1E-15))*100;
   double ad_change9 = ((ad_arr[kdata_shift+8] - ad_arr[kdata_shift+9])/(MathAbs(ad_arr[kdata_shift+9])+1E-15))*100;
   double ad_change10 = ((ad_arr[kdata_shift+9] - ad_arr[kdata_shift+10])/(MathAbs(ad_arr[kdata_shift+10])+1E-15))*100;


   double ad_current_change1 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+1])/(MathAbs(ad_arr[kdata_shift+1])+1E-15))*100;
   double ad_current_change2 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+2])/(MathAbs(ad_arr[kdata_shift+2])+1E-15))*100;
   double ad_current_change3 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+3])/(MathAbs(ad_arr[kdata_shift+3])+1E-15))*100;
   double ad_current_change4 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+4])/(MathAbs(ad_arr[kdata_shift+4])+1E-15))*100;
   double ad_current_change5 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+5])/(MathAbs(ad_arr[kdata_shift+5])+1E-15))*100;
   double ad_current_change6 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+6])/(MathAbs(ad_arr[kdata_shift+6])+1E-15))*100;
   double ad_current_change7 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+7])/(MathAbs(ad_arr[kdata_shift+7])+1E-15))*100;
   double ad_current_change8 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+8])/(MathAbs(ad_arr[kdata_shift+8])+1E-15))*100;
   double ad_current_change9 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+9])/(MathAbs(ad_arr[kdata_shift+9])+1E-15))*100;
   double ad_current_change10 = ((ad_arr[kdata_shift] - ad_arr[kdata_shift+10])/(MathAbs(ad_arr[kdata_shift+10])+1E-15))*100;


//printf("AD");
//ArrayPrint(ad_arr);
//----------------------------------------AD反映情况类型判定----------------------------------------
   double ad_type = TypeAD(ad_arr, kdata_shift);



//ADXWilder
   double adxWilder_arr[];
   double adxWilder_DI_plus_arr[];
   double adxWilder_DI_minus_arr[];
   ADXWilder(adxWilder_arr,adxWilder_DI_plus_arr,adxWilder_DI_minus_arr,_Symbol,timeframe_currently,5,count_num);

   double adxWilder = adxWilder_arr[kdata_shift];
   double adxWilder_DI_plus = adxWilder_DI_plus_arr[kdata_shift];
   double adxWilder_DI_minus = adxWilder_DI_minus_arr[kdata_shift];

   double adxWilder_change1 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+1])/(adxWilder_arr[kdata_shift+1]+1E-15))*100;     //ADXWilder变化率
   double adxWilder_change2 = ((adxWilder_arr[kdata_shift+1] - adxWilder_arr[kdata_shift+2])/(adxWilder_arr[kdata_shift+2]+1E-15))*100;
   double adxWilder_change3 = ((adxWilder_arr[kdata_shift+2] - adxWilder_arr[kdata_shift+3])/(adxWilder_arr[kdata_shift+3]+1E-15))*100;
   double adxWilder_change4 = ((adxWilder_arr[kdata_shift+3] - adxWilder_arr[kdata_shift+4])/(adxWilder_arr[kdata_shift+4]+1E-15))*100;
   double adxWilder_change5 = ((adxWilder_arr[kdata_shift+4] - adxWilder_arr[kdata_shift+5])/(adxWilder_arr[kdata_shift+5]+1E-15))*100;
   double adxWilder_change6 = ((adxWilder_arr[kdata_shift+5] - adxWilder_arr[kdata_shift+6])/(adxWilder_arr[kdata_shift+6]+1E-15))*100;
   double adxWilder_change7 = ((adxWilder_arr[kdata_shift+6] - adxWilder_arr[kdata_shift+7])/(adxWilder_arr[kdata_shift+7]+1E-15))*100;
   double adxWilder_change8 = ((adxWilder_arr[kdata_shift+7] - adxWilder_arr[kdata_shift+8])/(adxWilder_arr[kdata_shift+8]+1E-15))*100;
   double adxWilder_change9 = ((adxWilder_arr[kdata_shift+8] - adxWilder_arr[kdata_shift+9])/(adxWilder_arr[kdata_shift+9]+1E-15))*100;
   double adxWilder_change10 = ((adxWilder_arr[kdata_shift+9] - adxWilder_arr[kdata_shift+10])/(adxWilder_arr[kdata_shift+10]+1E-15))*100;


   double adxWilder_current_change1 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+1])/(adxWilder_arr[kdata_shift+1]+1E-15))*100;
   double adxWilder_current_change2 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+2])/(adxWilder_arr[kdata_shift+2]+1E-15))*100;
   double adxWilder_current_change3 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+3])/(adxWilder_arr[kdata_shift+3]+1E-15))*100;
   double adxWilder_current_change4 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+4])/(adxWilder_arr[kdata_shift+4]+1E-15))*100;
   double adxWilder_current_change5 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+5])/(adxWilder_arr[kdata_shift+5]+1E-15))*100;
   double adxWilder_current_change6 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+6])/(adxWilder_arr[kdata_shift+6]+1E-15))*100;
   double adxWilder_current_change7 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+7])/(adxWilder_arr[kdata_shift+7]+1E-15))*100;
   double adxWilder_current_change8 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+8])/(adxWilder_arr[kdata_shift+8]+1E-15))*100;
   double adxWilder_current_change9 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+9])/(adxWilder_arr[kdata_shift+9]+1E-15))*100;
   double adxWilder_current_change10 = ((adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+10])/(adxWilder_arr[kdata_shift+10]+1E-15))*100;


   double adxWilder_changeValue1 = adxWilder_arr[kdata_shift] - adxWilder_arr[kdata_shift+1];     //ADXWilder变化值
   double adxWilder_changeValue2 = adxWilder_arr[kdata_shift+1] - adxWilder_arr[kdata_shift+2];
   double adxWilder_changeValue3 = adxWilder_arr[kdata_shift+2] - adxWilder_arr[kdata_shift+3];
   double adxWilder_changeValue4 = adxWilder_arr[kdata_shift+3] - adxWilder_arr[kdata_shift+4];
   double adxWilder_changeValue5 = adxWilder_arr[kdata_shift+4] - adxWilder_arr[kdata_shift+5];
   double adxWilder_changeValue6 = adxWilder_arr[kdata_shift+5] - adxWilder_arr[kdata_shift+6];
   double adxWilder_changeValue7 = adxWilder_arr[kdata_shift+6] - adxWilder_arr[kdata_shift+7];
   double adxWilder_changeValue8 = adxWilder_arr[kdata_shift+7] - adxWilder_arr[kdata_shift+8];
   double adxWilder_changeValue9 = adxWilder_arr[kdata_shift+8] - adxWilder_arr[kdata_shift+9];
   double adxWilder_changeValue10 = adxWilder_arr[kdata_shift+9] - adxWilder_arr[kdata_shift+10];



//printf("ADXWilder");
//ArrayPrint(adxWilder_arr);
//ArrayPrint(adxWilder_DI_plus_arr);
//ArrayPrint(adxWilder_DI_minus_arr
//----------------------------------------ADXWilder反映情况类型判定----------------------------------------
   double adxWilder_type = TypeADXWilder(adxWilder_arr, kdata_shift);



//Alligator
   double jaws_arr[];
   double teeth_arr[];
   double lips_arr[];
   Alligator(jaws_arr,teeth_arr,lips_arr,_Symbol,timeframe_currently,13,8,8,5,5,3,MODE_SMMA,PRICE_CLOSE,count_num);

   double jaws = jaws_arr[kdata_shift];
   double teeth = teeth_arr[kdata_shift];
   double lips = lips_arr[kdata_shift];



   double lips_change1 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+1])/lips_arr[kdata_shift+1])*100;     //lips变化率
   double lips_change2 = ((lips_arr[kdata_shift+1] - lips_arr[kdata_shift+2])/lips_arr[kdata_shift+2])*100;
   double lips_change3 = ((lips_arr[kdata_shift+2] - lips_arr[kdata_shift+3])/lips_arr[kdata_shift+3])*100;
   double lips_change4 = ((lips_arr[kdata_shift+3] - lips_arr[kdata_shift+4])/lips_arr[kdata_shift+4])*100;
   double lips_change5 = ((lips_arr[kdata_shift+4] - lips_arr[kdata_shift+5])/lips_arr[kdata_shift+5])*100;
   double lips_change6 = ((lips_arr[kdata_shift+5] - lips_arr[kdata_shift+6])/lips_arr[kdata_shift+6])*100;
   double lips_change7 = ((lips_arr[kdata_shift+6] - lips_arr[kdata_shift+7])/lips_arr[kdata_shift+7])*100;
   double lips_change8 = ((lips_arr[kdata_shift+7] - lips_arr[kdata_shift+8])/lips_arr[kdata_shift+8])*100;
   double lips_change9 = ((lips_arr[kdata_shift+8] - lips_arr[kdata_shift+9])/lips_arr[kdata_shift+9])*100;
   double lips_change10 = ((lips_arr[kdata_shift+9] - lips_arr[kdata_shift+10])/lips_arr[kdata_shift+10])*100;



   double lips_current_change1 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+1])/lips_arr[kdata_shift+1])*100;
   double lips_current_change2 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+2])/lips_arr[kdata_shift+2])*100;
   double lips_current_change3 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+3])/lips_arr[kdata_shift+3])*100;
   double lips_current_change4 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+4])/lips_arr[kdata_shift+4])*100;
   double lips_current_change5 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+5])/lips_arr[kdata_shift+5])*100;
   double lips_current_change6 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+6])/lips_arr[kdata_shift+6])*100;
   double lips_current_change7 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+7])/lips_arr[kdata_shift+7])*100;
   double lips_current_change8 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+8])/lips_arr[kdata_shift+8])*100;
   double lips_current_change9 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+9])/lips_arr[kdata_shift+9])*100;
   double lips_current_change10 = ((lips_arr[kdata_shift] - lips_arr[kdata_shift+10])/lips_arr[kdata_shift+10])*100;


   double lips_changeValue1 = lips_arr[kdata_shift] - lips_arr[kdata_shift+1];     //lips变化值
   double lips_changeValue2 = lips_arr[kdata_shift+1] - lips_arr[kdata_shift+2];
   double lips_changeValue3 = lips_arr[kdata_shift+2] - lips_arr[kdata_shift+3];
   double lips_changeValue4 = lips_arr[kdata_shift+3] - lips_arr[kdata_shift+4];
   double lips_changeValue5 = lips_arr[kdata_shift+4] - lips_arr[kdata_shift+5];
   double lips_changeValue6 = lips_arr[kdata_shift+5] - lips_arr[kdata_shift+6];
   double lips_changeValue7 = lips_arr[kdata_shift+6] - lips_arr[kdata_shift+7];
   double lips_changeValue8 = lips_arr[kdata_shift+7] - lips_arr[kdata_shift+8];
   double lips_changeValue9 = lips_arr[kdata_shift+8] - lips_arr[kdata_shift+9];
   double lips_changeValue10 = lips_arr[kdata_shift+9] - lips_arr[kdata_shift+10];



//printf("Alligator");
//ArrayPrint(jaws_arr);
//ArrayPrint(teeth_arr);
//ArrayPrint(lips_arr);
//----------------------------------------Alligator反映情况类型判定----------------------------------------
   double alligator_type = TypeAlligator(lips_arr, teeth_arr, jaws_arr, kdata_shift);



//AMA
   double ama_arr[];
   AMA(ama_arr,_Symbol,timeframe_currently,15,2,30,0,PRICE_CLOSE,count_num);
//printf("AMA");
   double ama = ama_arr[kdata_shift];


   double ama_change1 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+1])/ama_arr[kdata_shift+1])*100;     //ama变化率
   double ama_change2 = ((ama_arr[kdata_shift+1] - ama_arr[kdata_shift+2])/ama_arr[kdata_shift+2])*100;
   double ama_change3 = ((ama_arr[kdata_shift+2] - ama_arr[kdata_shift+3])/ama_arr[kdata_shift+3])*100;
   double ama_change4 = ((ama_arr[kdata_shift+3] - ama_arr[kdata_shift+4])/ama_arr[kdata_shift+4])*100;
   double ama_change5 = ((ama_arr[kdata_shift+4] - ama_arr[kdata_shift+5])/ama_arr[kdata_shift+5])*100;
   double ama_change6 = ((ama_arr[kdata_shift+5] - ama_arr[kdata_shift+6])/ama_arr[kdata_shift+6])*100;
   double ama_change7 = ((ama_arr[kdata_shift+6] - ama_arr[kdata_shift+7])/ama_arr[kdata_shift+7])*100;
   double ama_change8 = ((ama_arr[kdata_shift+7] - ama_arr[kdata_shift+8])/ama_arr[kdata_shift+8])*100;
   double ama_change9 = ((ama_arr[kdata_shift+8] - ama_arr[kdata_shift+9])/ama_arr[kdata_shift+9])*100;
   double ama_change10 = ((ama_arr[kdata_shift+9] - ama_arr[kdata_shift+10])/ama_arr[kdata_shift+10])*100;


   double ama_current_change1 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+1])/ama_arr[kdata_shift+1])*100;
   double ama_current_change2 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+2])/ama_arr[kdata_shift+2])*100;
   double ama_current_change3 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+3])/ama_arr[kdata_shift+3])*100;
   double ama_current_change4 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+4])/ama_arr[kdata_shift+4])*100;
   double ama_current_change5 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+5])/ama_arr[kdata_shift+5])*100;
   double ama_current_change6 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+6])/ama_arr[kdata_shift+6])*100;
   double ama_current_change7 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+7])/ama_arr[kdata_shift+7])*100;
   double ama_current_change8 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+8])/ama_arr[kdata_shift+8])*100;
   double ama_current_change9 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+9])/ama_arr[kdata_shift+9])*100;
   double ama_current_change10 = ((ama_arr[kdata_shift] - ama_arr[kdata_shift+10])/ama_arr[kdata_shift+10])*100;



   double ama_changeValue1 = ama_arr[kdata_shift] - ama_arr[kdata_shift+1];     //ama变化值
   double ama_changeValue2 = ama_arr[kdata_shift+1] - ama_arr[kdata_shift+2];
   double ama_changeValue3 = ama_arr[kdata_shift+2] - ama_arr[kdata_shift+3];
   double ama_changeValue4 = ama_arr[kdata_shift+3] - ama_arr[kdata_shift+4];
   double ama_changeValue5 = ama_arr[kdata_shift+4] - ama_arr[kdata_shift+5];
   double ama_changeValue6 = ama_arr[kdata_shift+5] - ama_arr[kdata_shift+6];
   double ama_changeValue7 = ama_arr[kdata_shift+6] - ama_arr[kdata_shift+7];
   double ama_changeValue8 = ama_arr[kdata_shift+7] - ama_arr[kdata_shift+8];
   double ama_changeValue9 = ama_arr[kdata_shift+8] - ama_arr[kdata_shift+9];
   double ama_changeValue10 = ama_arr[kdata_shift+9] - ama_arr[kdata_shift+10];



//ArrayPrint(ama_arr);
//----------------------------------------AMA反映情况类型判定----------------------------------------
   double ama_type = TypeAMA(ama_arr, close_, close_1, kdata_shift);


//AO
   double ao_value_arr[];
   double ao_color_arr[];
   AO(ao_value_arr,ao_color_arr,_Symbol,timeframe_currently,count_num);

   double ao_value = ao_value_arr[kdata_shift];
   double ao_color = ao_color_arr[kdata_shift];


   double ao_change1 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+1])/(MathAbs(ao_value_arr[kdata_shift+1])+1E-15))*100;     //ao变化率
   double ao_change2 = ((ao_value_arr[kdata_shift+1] - ao_value_arr[kdata_shift+2])/(MathAbs(ao_value_arr[kdata_shift+2])+1E-15))*100;
   double ao_change3 = ((ao_value_arr[kdata_shift+2] - ao_value_arr[kdata_shift+3])/(MathAbs(ao_value_arr[kdata_shift+3])+1E-15))*100;
   double ao_change4 = ((ao_value_arr[kdata_shift+3] - ao_value_arr[kdata_shift+4])/(MathAbs(ao_value_arr[kdata_shift+4])+1E-15))*100;
   double ao_change5 = ((ao_value_arr[kdata_shift+4] - ao_value_arr[kdata_shift+5])/(MathAbs(ao_value_arr[kdata_shift+5])+1E-15))*100;
   double ao_change6 = ((ao_value_arr[kdata_shift+5] - ao_value_arr[kdata_shift+6])/(MathAbs(ao_value_arr[kdata_shift+6])+1E-15))*100;
   double ao_change7 = ((ao_value_arr[kdata_shift+6] - ao_value_arr[kdata_shift+7])/(MathAbs(ao_value_arr[kdata_shift+7])+1E-15))*100;
   double ao_change8 = ((ao_value_arr[kdata_shift+7] - ao_value_arr[kdata_shift+8])/(MathAbs(ao_value_arr[kdata_shift+8])+1E-15))*100;
   double ao_change9 = ((ao_value_arr[kdata_shift+8] - ao_value_arr[kdata_shift+9])/(MathAbs(ao_value_arr[kdata_shift+9])+1E-15))*100;
   double ao_change10 = ((ao_value_arr[kdata_shift+9] - ao_value_arr[kdata_shift+10])/(MathAbs(ao_value_arr[kdata_shift+10])+1E-15))*100;



   double ao_current_change1 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+1])/(MathAbs(ao_value_arr[kdata_shift+1])+1E-15))*100;
   double ao_current_change2 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+2])/(MathAbs(ao_value_arr[kdata_shift+2])+1E-15))*100;
   double ao_current_change3 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+3])/(MathAbs(ao_value_arr[kdata_shift+3])+1E-15))*100;
   double ao_current_change4 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+4])/(MathAbs(ao_value_arr[kdata_shift+4])+1E-15))*100;
   double ao_current_change5 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+5])/(MathAbs(ao_value_arr[kdata_shift+5])+1E-15))*100;
   double ao_current_change6 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+6])/(MathAbs(ao_value_arr[kdata_shift+6])+1E-15))*100;
   double ao_current_change7 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+7])/(MathAbs(ao_value_arr[kdata_shift+7])+1E-15))*100;
   double ao_current_change8 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+8])/(MathAbs(ao_value_arr[kdata_shift+8])+1E-15))*100;
   double ao_current_change9 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+9])/(MathAbs(ao_value_arr[kdata_shift+9])+1E-15))*100;
   double ao_current_change10 = ((ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+10])/(MathAbs(ao_value_arr[kdata_shift+10])+1E-15))*100;



   double ao_changeValue1 = ao_value_arr[kdata_shift] - ao_value_arr[kdata_shift+1];     //ao变化值
   double ao_changeValue2 = ao_value_arr[kdata_shift+1] - ao_value_arr[kdata_shift+2];
   double ao_changeValue3 = ao_value_arr[kdata_shift+2] - ao_value_arr[kdata_shift+3];
   double ao_changeValue4 = ao_value_arr[kdata_shift+3] - ao_value_arr[kdata_shift+4];
   double ao_changeValue5 = ao_value_arr[kdata_shift+4] - ao_value_arr[kdata_shift+5];
   double ao_changeValue6 = ao_value_arr[kdata_shift+5] - ao_value_arr[kdata_shift+6];
   double ao_changeValue7 = ao_value_arr[kdata_shift+6] - ao_value_arr[kdata_shift+7];
   double ao_changeValue8 = ao_value_arr[kdata_shift+7] - ao_value_arr[kdata_shift+8];
   double ao_changeValue9 = ao_value_arr[kdata_shift+8] - ao_value_arr[kdata_shift+9];
   double ao_changeValue10 = ao_value_arr[kdata_shift+9] - ao_value_arr[kdata_shift+10];


//printf("AO");
//ArrayPrint(ao_value_arr);
//ArrayPrint(ao_color_arr);
//----------------------------------------AO反映情况类型判定----------------------------------------
   double ao_type = TypeAO(ao_value_arr, ao_color_arr, kdata_shift);



//BearsPower
   double bearsPower_arr[];
   BearsPower(bearsPower_arr,_Symbol,timeframe_currently,13,count_num);

   double bearsPower = bearsPower_arr[kdata_shift];



   double bears_change1 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+1])/(MathAbs(bearsPower_arr[kdata_shift+1])+1E-15))*100;     //bears变化率
   double bears_change2 = ((bearsPower_arr[kdata_shift+1] - bearsPower_arr[kdata_shift+2])/(MathAbs(bearsPower_arr[kdata_shift+2])+1E-15))*100;
   double bears_change3 = ((bearsPower_arr[kdata_shift+2] - bearsPower_arr[kdata_shift+3])/(MathAbs(bearsPower_arr[kdata_shift+3])+1E-15))*100;
   double bears_change4 = ((bearsPower_arr[kdata_shift+3] - bearsPower_arr[kdata_shift+4])/(MathAbs(bearsPower_arr[kdata_shift+4])+1E-15))*100;
   double bears_change5 = ((bearsPower_arr[kdata_shift+4] - bearsPower_arr[kdata_shift+5])/(MathAbs(bearsPower_arr[kdata_shift+5])+1E-15))*100;
   double bears_change6 = ((bearsPower_arr[kdata_shift+5] - bearsPower_arr[kdata_shift+6])/(MathAbs(bearsPower_arr[kdata_shift+6])+1E-15))*100;
   double bears_change7 = ((bearsPower_arr[kdata_shift+6] - bearsPower_arr[kdata_shift+7])/(MathAbs(bearsPower_arr[kdata_shift+7])+1E-15))*100;
   double bears_change8 = ((bearsPower_arr[kdata_shift+7] - bearsPower_arr[kdata_shift+8])/(MathAbs(bearsPower_arr[kdata_shift+8])+1E-15))*100;
   double bears_change9 = ((bearsPower_arr[kdata_shift+8] - bearsPower_arr[kdata_shift+9])/(MathAbs(bearsPower_arr[kdata_shift+9])+1E-15))*100;
   double bears_change10 = ((bearsPower_arr[kdata_shift+9] - bearsPower_arr[kdata_shift+10])/(MathAbs(bearsPower_arr[kdata_shift+10])+1E-15))*100;



   double bears_current_change1 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+1])/(MathAbs(bearsPower_arr[kdata_shift+1])+1E-15))*100;
   double bears_current_change2 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+2])/(MathAbs(bearsPower_arr[kdata_shift+2])+1E-15))*100;
   double bears_current_change3 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+3])/(MathAbs(bearsPower_arr[kdata_shift+3])+1E-15))*100;
   double bears_current_change4 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+4])/(MathAbs(bearsPower_arr[kdata_shift+4])+1E-15))*100;
   double bears_current_change5 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+5])/(MathAbs(bearsPower_arr[kdata_shift+5])+1E-15))*100;
   double bears_current_change6 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+6])/(MathAbs(bearsPower_arr[kdata_shift+6])+1E-15))*100;
   double bears_current_change7 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+7])/(MathAbs(bearsPower_arr[kdata_shift+7])+1E-15))*100;
   double bears_current_change8 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+8])/(MathAbs(bearsPower_arr[kdata_shift+8])+1E-15))*100;
   double bears_current_change9 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+9])/(MathAbs(bearsPower_arr[kdata_shift+9])+1E-15))*100;
   double bears_current_change10 = ((bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+10])/(MathAbs(bearsPower_arr[kdata_shift+10])+1E-15))*100;


   double bears_changeValue1 = bearsPower_arr[kdata_shift] - bearsPower_arr[kdata_shift+1];     //bears变化率
   double bears_changeValue2 = bearsPower_arr[kdata_shift+1] - bearsPower_arr[kdata_shift+2];
   double bears_changeValue3 = bearsPower_arr[kdata_shift+2] - bearsPower_arr[kdata_shift+3];
   double bears_changeValue4 = bearsPower_arr[kdata_shift+3] - bearsPower_arr[kdata_shift+4];
   double bears_changeValue5 = bearsPower_arr[kdata_shift+4] - bearsPower_arr[kdata_shift+5];
   double bears_changeValue6 = bearsPower_arr[kdata_shift+5] - bearsPower_arr[kdata_shift+6];
   double bears_changeValue7 = bearsPower_arr[kdata_shift+6] - bearsPower_arr[kdata_shift+7];
   double bears_changeValue8 = bearsPower_arr[kdata_shift+7] - bearsPower_arr[kdata_shift+8];
   double bears_changeValue9 = bearsPower_arr[kdata_shift+8] - bearsPower_arr[kdata_shift+9];
   double bears_changeValue10 = bearsPower_arr[kdata_shift+9] - bearsPower_arr[kdata_shift+10];


//printf("BearsPower");
//ArrayPrint(bearsPower_arr);
//----------------------------------------BearsPower反映情况类型判定----------------------------------------
   double bearsPower_type = TypeBearsPower(bearsPower_arr, kdata_shift);



//BullsPower
   double bullsPower_arr[];
   BullsPower(bullsPower_arr,_Symbol,timeframe_currently,13,count_num);

   double bullsPower = bullsPower_arr[kdata_shift];



   double bulls_change1 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+1])/(MathAbs(bullsPower_arr[kdata_shift+1])+1E-15))*100;     //bulls变化率
   double bulls_change2 = ((bullsPower_arr[kdata_shift+1] - bullsPower_arr[kdata_shift+2])/(MathAbs(bullsPower_arr[kdata_shift+2])+1E-15))*100;
   double bulls_change3 = ((bullsPower_arr[kdata_shift+2] - bullsPower_arr[kdata_shift+3])/(MathAbs(bullsPower_arr[kdata_shift+3])+1E-15))*100;
   double bulls_change4 = ((bullsPower_arr[kdata_shift+3] - bullsPower_arr[kdata_shift+4])/(MathAbs(bullsPower_arr[kdata_shift+4])+1E-15))*100;
   double bulls_change5 = ((bullsPower_arr[kdata_shift+4] - bullsPower_arr[kdata_shift+5])/(MathAbs(bullsPower_arr[kdata_shift+5])+1E-15))*100;
   double bulls_change6 = ((bullsPower_arr[kdata_shift+5] - bullsPower_arr[kdata_shift+6])/(MathAbs(bullsPower_arr[kdata_shift+6])+1E-15))*100;
   double bulls_change7 = ((bullsPower_arr[kdata_shift+6] - bullsPower_arr[kdata_shift+7])/(MathAbs(bullsPower_arr[kdata_shift+7])+1E-15))*100;
   double bulls_change8 = ((bullsPower_arr[kdata_shift+7] - bullsPower_arr[kdata_shift+8])/(MathAbs(bullsPower_arr[kdata_shift+8])+1E-15))*100;
   double bulls_change9 = ((bullsPower_arr[kdata_shift+8] - bullsPower_arr[kdata_shift+9])/(MathAbs(bullsPower_arr[kdata_shift+9])+1E-15))*100;
   double bulls_change10 = ((bullsPower_arr[kdata_shift+9] - bullsPower_arr[kdata_shift+10])/(MathAbs(bullsPower_arr[kdata_shift+10])+1E-15))*100;


   double bulls_current_change1 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+1])/(MathAbs(bullsPower_arr[kdata_shift+1])+1E-15))*100;
   double bulls_current_change2 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+2])/(MathAbs(bullsPower_arr[kdata_shift+2])+1E-15))*100;
   double bulls_current_change3 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+3])/(MathAbs(bullsPower_arr[kdata_shift+3])+1E-15))*100;
   double bulls_current_change4 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+4])/(MathAbs(bullsPower_arr[kdata_shift+4])+1E-15))*100;
   double bulls_current_change5 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+5])/(MathAbs(bullsPower_arr[kdata_shift+5])+1E-15))*100;
   double bulls_current_change6 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+6])/(MathAbs(bullsPower_arr[kdata_shift+6])+1E-15))*100;
   double bulls_current_change7 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+7])/(MathAbs(bullsPower_arr[kdata_shift+7])+1E-15))*100;
   double bulls_current_change8 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+8])/(MathAbs(bullsPower_arr[kdata_shift+8])+1E-15))*100;
   double bulls_current_change9 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+9])/(MathAbs(bullsPower_arr[kdata_shift+9])+1E-15))*100;
   double bulls_current_change10 = ((bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+10])/(MathAbs(bullsPower_arr[kdata_shift+10])+1E-15))*100;


   double bulls_changeValue1 = bullsPower_arr[kdata_shift] - bullsPower_arr[kdata_shift+1];     //bulls变化值
   double bulls_changeValue2 = bullsPower_arr[kdata_shift+1] - bullsPower_arr[kdata_shift+2];
   double bulls_changeValue3 = bullsPower_arr[kdata_shift+2] - bullsPower_arr[kdata_shift+3];
   double bulls_changeValue4 = bullsPower_arr[kdata_shift+3] - bullsPower_arr[kdata_shift+4];
   double bulls_changeValue5 = bullsPower_arr[kdata_shift+4] - bullsPower_arr[kdata_shift+5];
   double bulls_changeValue6 = bullsPower_arr[kdata_shift+5] - bullsPower_arr[kdata_shift+6];
   double bulls_changeValue7 = bullsPower_arr[kdata_shift+6] - bullsPower_arr[kdata_shift+7];
   double bulls_changeValue8 = bullsPower_arr[kdata_shift+7] - bullsPower_arr[kdata_shift+8];
   double bulls_changeValue9 = bullsPower_arr[kdata_shift+8] - bullsPower_arr[kdata_shift+9];
   double bulls_changeValue10 = bullsPower_arr[kdata_shift+9] - bullsPower_arr[kdata_shift+10];



//printf("BullsPower");
//ArrayPrint(bullsPower_arr);
//----------------------------------------BullsPower反映情况类型判定----------------------------------------
   double bullsPower_type = TypeBullsPower(bullsPower_arr, kdata_shift);



//Chaikin
   double chaikin_arr[];
   Chaikin(chaikin_arr,_Symbol,timeframe_currently,3,10,MODE_EMA,VOLUME_TICK,count_num);

   double chaikin = chaikin_arr[kdata_shift];


   double chaikin_change1 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+1])/(MathAbs(chaikin_arr[kdata_shift+1])+1E-15))*100;     //chaikin变化率
   double chaikin_change2 = ((chaikin_arr[kdata_shift+1] - chaikin_arr[kdata_shift+2])/(MathAbs(chaikin_arr[kdata_shift+2])+1E-15))*100;
   double chaikin_change3 = ((chaikin_arr[kdata_shift+2] - chaikin_arr[kdata_shift+3])/(MathAbs(chaikin_arr[kdata_shift+3])+1E-15))*100;
   double chaikin_change4 = ((chaikin_arr[kdata_shift+3] - chaikin_arr[kdata_shift+4])/(MathAbs(chaikin_arr[kdata_shift+4])+1E-15))*100;
   double chaikin_change5 = ((chaikin_arr[kdata_shift+4] - chaikin_arr[kdata_shift+5])/(MathAbs(chaikin_arr[kdata_shift+5])+1E-15))*100;
   double chaikin_change6 = ((chaikin_arr[kdata_shift+5] - chaikin_arr[kdata_shift+6])/(MathAbs(chaikin_arr[kdata_shift+6])+1E-15))*100;
   double chaikin_change7 = ((chaikin_arr[kdata_shift+6] - chaikin_arr[kdata_shift+7])/(MathAbs(chaikin_arr[kdata_shift+7])+1E-15))*100;
   double chaikin_change8 = ((chaikin_arr[kdata_shift+7] - chaikin_arr[kdata_shift+8])/(MathAbs(chaikin_arr[kdata_shift+8])+1E-15))*100;
   double chaikin_change9 = ((chaikin_arr[kdata_shift+8] - chaikin_arr[kdata_shift+9])/(MathAbs(chaikin_arr[kdata_shift+9])+1E-15))*100;
   double chaikin_change10 = ((chaikin_arr[kdata_shift+9] - chaikin_arr[kdata_shift+10])/(MathAbs(chaikin_arr[kdata_shift+10])+1E-15))*100;


   double chaikin_current_change1 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+1])/(MathAbs(chaikin_arr[kdata_shift+1])+1E-15))*100;
   double chaikin_current_change2 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+2])/(MathAbs(chaikin_arr[kdata_shift+2])+1E-15))*100;
   double chaikin_current_change3 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+3])/(MathAbs(chaikin_arr[kdata_shift+3])+1E-15))*100;
   double chaikin_current_change4 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+4])/(MathAbs(chaikin_arr[kdata_shift+4])+1E-15))*100;
   double chaikin_current_change5 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+5])/(MathAbs(chaikin_arr[kdata_shift+5])+1E-15))*100;
   double chaikin_current_change6 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+6])/(MathAbs(chaikin_arr[kdata_shift+6])+1E-15))*100;
   double chaikin_current_change7 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+7])/(MathAbs(chaikin_arr[kdata_shift+7])+1E-15))*100;
   double chaikin_current_change8 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+8])/(MathAbs(chaikin_arr[kdata_shift+8])+1E-15))*100;
   double chaikin_current_change9 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+9])/(MathAbs(chaikin_arr[kdata_shift+9])+1E-15))*100;
   double chaikin_current_change10 = ((chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+10])/(MathAbs(chaikin_arr[kdata_shift+10])+1E-15))*100;



   double chaikin_changeValue1 = chaikin_arr[kdata_shift] - chaikin_arr[kdata_shift+1];
   double chaikin_changeValue2 = chaikin_arr[kdata_shift+1] - chaikin_arr[kdata_shift+2];
   double chaikin_changeValue3 = chaikin_arr[kdata_shift+2] - chaikin_arr[kdata_shift+3];
   double chaikin_changeValue4 = chaikin_arr[kdata_shift+3] - chaikin_arr[kdata_shift+4];
   double chaikin_changeValue5 = chaikin_arr[kdata_shift+4] - chaikin_arr[kdata_shift+5];
   double chaikin_changeValue6 = chaikin_arr[kdata_shift+5] - chaikin_arr[kdata_shift+6];
   double chaikin_changeValue7 = chaikin_arr[kdata_shift+6] - chaikin_arr[kdata_shift+7];
   double chaikin_changeValue8 = chaikin_arr[kdata_shift+7] - chaikin_arr[kdata_shift+8];
   double chaikin_changeValue9 = chaikin_arr[kdata_shift+8] - chaikin_arr[kdata_shift+9];
   double chaikin_changeValue10 = chaikin_arr[kdata_shift+9] - chaikin_arr[kdata_shift+10];



//printf("Chaikin");
//ArrayPrint(chaikin_arr);
//----------------------------------------Chaikin反映情况类型判定----------------------------------------
   double chaikin_type = TypeChaikin(chaikin_arr, kdata_shift);



//DEMA
   double dema_arr[];
   DEMA(dema_arr,_Symbol,timeframe_currently,14,0,PRICE_CLOSE,count_num);

   double dema = dema_arr[kdata_shift];


   double dema_change1 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+1])/dema_arr[kdata_shift+1])*100;     //dema变化率
   double dema_change2 = ((dema_arr[kdata_shift+1] - dema_arr[kdata_shift+2])/dema_arr[kdata_shift+2])*100;
   double dema_change3 = ((dema_arr[kdata_shift+2] - dema_arr[kdata_shift+3])/dema_arr[kdata_shift+3])*100;
   double dema_change4 = ((dema_arr[kdata_shift+3] - dema_arr[kdata_shift+4])/dema_arr[kdata_shift+4])*100;
   double dema_change5 = ((dema_arr[kdata_shift+4] - dema_arr[kdata_shift+5])/dema_arr[kdata_shift+5])*100;
   double dema_change6 = ((dema_arr[kdata_shift+5] - dema_arr[kdata_shift+6])/dema_arr[kdata_shift+6])*100;
   double dema_change7 = ((dema_arr[kdata_shift+6] - dema_arr[kdata_shift+7])/dema_arr[kdata_shift+7])*100;
   double dema_change8 = ((dema_arr[kdata_shift+7] - dema_arr[kdata_shift+8])/dema_arr[kdata_shift+8])*100;
   double dema_change9 = ((dema_arr[kdata_shift+8] - dema_arr[kdata_shift+9])/dema_arr[kdata_shift+9])*100;
   double dema_change10 = ((dema_arr[kdata_shift+9] - dema_arr[kdata_shift+10])/dema_arr[kdata_shift+10])*100;


   double dema_current_change1 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+1])/dema_arr[kdata_shift+1])*100;
   double dema_current_change2 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+2])/dema_arr[kdata_shift+2])*100;
   double dema_current_change3 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+3])/dema_arr[kdata_shift+3])*100;
   double dema_current_change4 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+4])/dema_arr[kdata_shift+4])*100;
   double dema_current_change5 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+5])/dema_arr[kdata_shift+5])*100;
   double dema_current_change6 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+6])/dema_arr[kdata_shift+6])*100;
   double dema_current_change7 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+7])/dema_arr[kdata_shift+7])*100;
   double dema_current_change8 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+8])/dema_arr[kdata_shift+8])*100;
   double dema_current_change9 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+9])/dema_arr[kdata_shift+9])*100;
   double dema_current_change10 = ((dema_arr[kdata_shift] - dema_arr[kdata_shift+10])/dema_arr[kdata_shift+10])*100;



//printf("DEMA");
//ArrayPrint(dema_arr);
//----------------------------------------DEMA反映情况类型判定----------------------------------------
   double dema_type = TypeDEMA(dema_arr, close_, close_1, kdata_shift);



//DeMarker
   double deMarker_arr[];
   DeMarker(deMarker_arr,_Symbol,timeframe_currently,14,count_num);

   double deMarker = deMarker_arr[kdata_shift];


   double deMarker_change1 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+1])/(deMarker_arr[kdata_shift+1]+1E-15))*100;     //deMarker变化率
   double deMarker_change2 = ((deMarker_arr[kdata_shift+1] - deMarker_arr[kdata_shift+2])/(deMarker_arr[kdata_shift+2]+1E-15))*100;
   double deMarker_change3 = ((deMarker_arr[kdata_shift+2] - deMarker_arr[kdata_shift+3])/(deMarker_arr[kdata_shift+3]+1E-15))*100;
   double deMarker_change4 = ((deMarker_arr[kdata_shift+3] - deMarker_arr[kdata_shift+4])/(deMarker_arr[kdata_shift+4]+1E-15))*100;
   double deMarker_change5 = ((deMarker_arr[kdata_shift+4] - deMarker_arr[kdata_shift+5])/(deMarker_arr[kdata_shift+5]+1E-15))*100;
   double deMarker_change6 = ((deMarker_arr[kdata_shift+5] - deMarker_arr[kdata_shift+6])/(deMarker_arr[kdata_shift+6]+1E-15))*100;
   double deMarker_change7 = ((deMarker_arr[kdata_shift+6] - deMarker_arr[kdata_shift+7])/(deMarker_arr[kdata_shift+7]+1E-15))*100;
   double deMarker_change8 = ((deMarker_arr[kdata_shift+7] - deMarker_arr[kdata_shift+8])/(deMarker_arr[kdata_shift+8]+1E-15))*100;
   double deMarker_change9 = ((deMarker_arr[kdata_shift+8] - deMarker_arr[kdata_shift+9])/(deMarker_arr[kdata_shift+9]+1E-15))*100;
   double deMarker_change10 = ((deMarker_arr[kdata_shift+9] - deMarker_arr[kdata_shift+10])/(deMarker_arr[kdata_shift+10]+1E-15))*100;



   double deMarker_current_change1 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+1])/(deMarker_arr[kdata_shift+1]+1E-15))*100;
   double deMarker_current_change2 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+2])/(deMarker_arr[kdata_shift+2]+1E-15))*100;
   double deMarker_current_change3 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+3])/(deMarker_arr[kdata_shift+3]+1E-15))*100;
   double deMarker_current_change4 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+4])/(deMarker_arr[kdata_shift+4]+1E-15))*100;
   double deMarker_current_change5 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+5])/(deMarker_arr[kdata_shift+5]+1E-15))*100;
   double deMarker_current_change6 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+6])/(deMarker_arr[kdata_shift+6]+1E-15))*100;
   double deMarker_current_change7 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+7])/(deMarker_arr[kdata_shift+7]+1E-15))*100;
   double deMarker_current_change8 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+8])/(deMarker_arr[kdata_shift+8]+1E-15))*100;
   double deMarker_current_change9 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+9])/(deMarker_arr[kdata_shift+9]+1E-15))*100;
   double deMarker_current_change10 = ((deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+10])/(deMarker_arr[kdata_shift+10]+1E-15))*100;



   double deMarker_changeValue1 = deMarker_arr[kdata_shift] - deMarker_arr[kdata_shift+1];     //deMarker变化值
   double deMarker_changeValue2 = deMarker_arr[kdata_shift+1] - deMarker_arr[kdata_shift+2];
   double deMarker_changeValue3 = deMarker_arr[kdata_shift+2] - deMarker_arr[kdata_shift+3];
   double deMarker_changeValue4 = deMarker_arr[kdata_shift+3] - deMarker_arr[kdata_shift+4];
   double deMarker_changeValue5 = deMarker_arr[kdata_shift+4] - deMarker_arr[kdata_shift+5];
   double deMarker_changeValue6 = deMarker_arr[kdata_shift+5] - deMarker_arr[kdata_shift+6];
   double deMarker_changeValue7 = deMarker_arr[kdata_shift+6] - deMarker_arr[kdata_shift+7];
   double deMarker_changeValue8 = deMarker_arr[kdata_shift+7] - deMarker_arr[kdata_shift+8];
   double deMarker_changeValue9 = deMarker_arr[kdata_shift+8] - deMarker_arr[kdata_shift+9];
   double deMarker_changeValue10 = deMarker_arr[kdata_shift+9] - deMarker_arr[kdata_shift+10];


//printf("DeMarker");
//ArrayPrint(deMarker_arr);
//----------------------------------------DeMarker反映情况类型判定----------------------------------------
   double deMarker_type = TypeDeMarker(deMarker_arr, kdata_shift);



//Envelopes
   double envelopes_upper_arr[];
   double envelopes_lower_arr[];
   Envelopes(envelopes_upper_arr,envelopes_lower_arr,_Symbol,timeframe_currently,14,0,MODE_SMA,PRICE_CLOSE,0.1,count_num);

   double envelopes_upper_value = envelopes_upper_arr[kdata_shift];
   double envelopes_lower_value = envelopes_lower_arr[kdata_shift];

//printf("Envelopes");
//ArrayPrint(envelopes_upper_arr);
//ArrayPrint(envelopes_lower_arr);
//----------------------------------------Envelopes反映情况类型判定----------------------------------------
   double envelopes_type = TypeEnvelopes(envelopes_lower_arr, envelopes_upper_arr, close_, close_1, kdata_shift);



//Force
   double force_arr[];
   Force(force_arr,_Symbol,timeframe_currently,13,MODE_SMA,VOLUME_TICK,count_num);

   double force = force_arr[kdata_shift];


   double force_change1 = ((force_arr[kdata_shift] - force_arr[kdata_shift+1])/(MathAbs(force_arr[kdata_shift+1])+1E-15))*100;     //force变化率
   double force_change2 = ((force_arr[kdata_shift+1] - force_arr[kdata_shift+2])/(MathAbs(force_arr[kdata_shift+2])+1E-15))*100;
   double force_change3 = ((force_arr[kdata_shift+2] - force_arr[kdata_shift+3])/(MathAbs(force_arr[kdata_shift+3])+1E-15))*100;
   double force_change4 = ((force_arr[kdata_shift+3] - force_arr[kdata_shift+4])/(MathAbs(force_arr[kdata_shift+4])+1E-15))*100;
   double force_change5 = ((force_arr[kdata_shift+4] - force_arr[kdata_shift+5])/(MathAbs(force_arr[kdata_shift+5])+1E-15))*100;
   double force_change6 = ((force_arr[kdata_shift+5] - force_arr[kdata_shift+6])/(MathAbs(force_arr[kdata_shift+6])+1E-15))*100;
   double force_change7 = ((force_arr[kdata_shift+6] - force_arr[kdata_shift+7])/(MathAbs(force_arr[kdata_shift+7])+1E-15))*100;
   double force_change8 = ((force_arr[kdata_shift+7] - force_arr[kdata_shift+8])/(MathAbs(force_arr[kdata_shift+8])+1E-15))*100;
   double force_change9 = ((force_arr[kdata_shift+8] - force_arr[kdata_shift+9])/(MathAbs(force_arr[kdata_shift+9])+1E-15))*100;
   double force_change10 = ((force_arr[kdata_shift+9] - force_arr[kdata_shift+10])/(MathAbs(force_arr[kdata_shift+10])+1E-15))*100;



   double force_current_change1 = ((force_arr[kdata_shift] - force_arr[kdata_shift+1])/(MathAbs(force_arr[kdata_shift+1])+1E-15))*100;
   double force_current_change2 = ((force_arr[kdata_shift] - force_arr[kdata_shift+2])/(MathAbs(force_arr[kdata_shift+2])+1E-15))*100;
   double force_current_change3 = ((force_arr[kdata_shift] - force_arr[kdata_shift+3])/(MathAbs(force_arr[kdata_shift+3])+1E-15))*100;
   double force_current_change4 = ((force_arr[kdata_shift] - force_arr[kdata_shift+4])/(MathAbs(force_arr[kdata_shift+4])+1E-15))*100;
   double force_current_change5 = ((force_arr[kdata_shift] - force_arr[kdata_shift+5])/(MathAbs(force_arr[kdata_shift+5])+1E-15))*100;
   double force_current_change6 = ((force_arr[kdata_shift] - force_arr[kdata_shift+6])/(MathAbs(force_arr[kdata_shift+6])+1E-15))*100;
   double force_current_change7 = ((force_arr[kdata_shift] - force_arr[kdata_shift+7])/(MathAbs(force_arr[kdata_shift+7])+1E-15))*100;
   double force_current_change8 = ((force_arr[kdata_shift] - force_arr[kdata_shift+8])/(MathAbs(force_arr[kdata_shift+8])+1E-15))*100;
   double force_current_change9 = ((force_arr[kdata_shift] - force_arr[kdata_shift+9])/(MathAbs(force_arr[kdata_shift+9])+1E-15))*100;
   double force_current_change10 = ((force_arr[kdata_shift] - force_arr[kdata_shift+10])/(MathAbs(force_arr[kdata_shift+10])+1E-15))*100;


   double force_changeValue1 = force_arr[kdata_shift] - force_arr[kdata_shift+1];     //force变化值
   double force_changeValue2 = force_arr[kdata_shift+1] - force_arr[kdata_shift+2];
   double force_changeValue3 = force_arr[kdata_shift+2] - force_arr[kdata_shift+3];
   double force_changeValue4 = force_arr[kdata_shift+3] - force_arr[kdata_shift+4];
   double force_changeValue5 = force_arr[kdata_shift+4] - force_arr[kdata_shift+5];
   double force_changeValue6 = force_arr[kdata_shift+5] - force_arr[kdata_shift+6];
   double force_changeValue7 = force_arr[kdata_shift+6] - force_arr[kdata_shift+7];
   double force_changeValue8 = force_arr[kdata_shift+7] - force_arr[kdata_shift+8];
   double force_changeValue9 = force_arr[kdata_shift+8] - force_arr[kdata_shift+9];
   double force_changeValue10 = force_arr[kdata_shift+9] - force_arr[kdata_shift+10];


//printf("Force");
//ArrayPrint(force_arr);
//----------------------------------------Force反映情况类型判定----------------------------------------
   double force_type = TypeForce(force_arr, close_, close_1, kdata_shift);



//Fractals***************************************************************************************************************************************************************************
   double fractals_up_arr[];
   double fractals_down_arr[];
   Fractals(fractals_up_arr,fractals_down_arr,_Symbol,timeframe_currently,count_num);

   if(fractals_up_arr[kdata_shift] > 9E+15)
     {
      double fractals_up_arrow = 0;
     }
   else
     {
      double fractals_up_arrow = fractals_up_arr[kdata_shift];
     }

   if(fractals_down_arr[kdata_shift] > 9E+15)
     {
      double fractals_down_arrow = 0;
     }
   else
     {
      double fractals_down_arrow = fractals_down_arr[kdata_shift];
     }


//printf("Fractals");
//ArrayPrint(fractals_up_arr);
//ArrayPrint(fractals_down_arr);
//----------------------------------------Fractals反映情况类型判定----------------------------------------
   double fractals_type = TypeFractals(fractals_up_arr, fractals_down_arr, kdata_shift);



//FrAMA
   double frAMA_arr[];
   FrAMA(frAMA_arr,_Symbol,timeframe_currently,14,0,PRICE_CLOSE,count_num);

   double frAMA = frAMA_arr[kdata_shift];



   double frAMA_change1 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+1])/frAMA_arr[kdata_shift+1])*100;     //frAMA变化率
   double frAMA_change2 = ((frAMA_arr[kdata_shift+1] - frAMA_arr[kdata_shift+2])/frAMA_arr[kdata_shift+2])*100;
   double frAMA_change3 = ((frAMA_arr[kdata_shift+2] - frAMA_arr[kdata_shift+3])/frAMA_arr[kdata_shift+3])*100;
   double frAMA_change4 = ((frAMA_arr[kdata_shift+3] - frAMA_arr[kdata_shift+4])/frAMA_arr[kdata_shift+4])*100;
   double frAMA_change5 = ((frAMA_arr[kdata_shift+4] - frAMA_arr[kdata_shift+5])/frAMA_arr[kdata_shift+5])*100;
   double frAMA_change6 = ((frAMA_arr[kdata_shift+5] - frAMA_arr[kdata_shift+6])/frAMA_arr[kdata_shift+6])*100;
   double frAMA_change7 = ((frAMA_arr[kdata_shift+6] - frAMA_arr[kdata_shift+7])/frAMA_arr[kdata_shift+7])*100;
   double frAMA_change8 = ((frAMA_arr[kdata_shift+7] - frAMA_arr[kdata_shift+8])/frAMA_arr[kdata_shift+8])*100;
   double frAMA_change9 = ((frAMA_arr[kdata_shift+8] - frAMA_arr[kdata_shift+9])/frAMA_arr[kdata_shift+9])*100;
   double frAMA_change10 = ((frAMA_arr[kdata_shift+9] - frAMA_arr[kdata_shift+10])/frAMA_arr[kdata_shift+10])*100;



   double frAMA_current_change1 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+1])/frAMA_arr[kdata_shift+1])*100;
   double frAMA_current_change2 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+2])/frAMA_arr[kdata_shift+2])*100;
   double frAMA_current_change3 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+3])/frAMA_arr[kdata_shift+3])*100;
   double frAMA_current_change4 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+4])/frAMA_arr[kdata_shift+4])*100;
   double frAMA_current_change5 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+5])/frAMA_arr[kdata_shift+5])*100;
   double frAMA_current_change6 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+6])/frAMA_arr[kdata_shift+6])*100;
   double frAMA_current_change7 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+7])/frAMA_arr[kdata_shift+7])*100;
   double frAMA_current_change8 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+8])/frAMA_arr[kdata_shift+8])*100;
   double frAMA_current_change9 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+9])/frAMA_arr[kdata_shift+9])*100;
   double frAMA_current_change10 = ((frAMA_arr[kdata_shift] - frAMA_arr[kdata_shift+10])/frAMA_arr[kdata_shift+10])*100;


//printf("FrAMA");
//ArrayPrint(frAMA_arr);
//----------------------------------------FrAMA反映情况类型判定----------------------------------------
   double frAMA_type = TypeFrAMA(frAMA_arr, close_, close_1, kdata_shift);



//Gator
   double gator_ups_arr[];
   double gator_up_color_arr[];
   double gator_down_arr[];
   double gator_down_color_arr[];
   Gator(gator_ups_arr,gator_up_color_arr,gator_down_arr,gator_down_color_arr,_Symbol,timeframe_currently,13,8,8,5,5,3,MODE_SMMA,PRICE_CLOSE,count_num);

   double gator_ups = gator_ups_arr[kdata_shift];
   double gator_up_color = gator_up_color_arr[kdata_shift];
   double gator_downs = gator_down_arr[kdata_shift];
   double gator_downs_color = gator_down_color_arr[kdata_shift];


//printf("Gator");
//ArrayPrint(gator_ups_arr);
//ArrayPrint(gator_up_color_arr);
//ArrayPrint(gator_down_arr);
//ArrayPrint(gator_down_color_arr);
//----------------------------------------Gator反映情况类型判定----------------------------------------
   double gator_type = TypeGator(gator_up_color_arr, gator_down_color_arr, kdata_shift);



//Ichimoku
   double tenkan_sen_arr[];
   double kijun_sen_arr[];
   double senkou_span_A_arr[];
   double senkou_span_B_arr[];
   double chinkou_span_arr[];
   Ichimoku(tenkan_sen_arr,kijun_sen_arr,senkou_span_A_arr,senkou_span_B_arr,chinkou_span_arr,_Symbol,timeframe_currently,9,26,52,count_num);

   double tenkan_sen = tenkan_sen_arr[kdata_shift];
   double kijun_sen = kijun_sen_arr[kdata_shift];
   double senkou_span_A = senkou_span_A_arr[kdata_shift];
   double senkou_span_B = senkou_span_B_arr[kdata_shift];
   double chinkou_span = chinkou_span_arr[kdata_shift];

//printf("Ichimoku");
//ArrayPrint(tenkan_sen_arr);
//ArrayPrint(kijun_sen_arr);
//ArrayPrint(senkou_span_A_arr);
//ArrayPrint(senkou_span_B_arr);
//ArrayPrint(chinkou_span_arr);
//----------------------------------------Ichimoku反映情况类型判定----------------------------------------
   double ichimoku_type = TypeIchimoku(tenkan_sen_arr, kijun_sen_arr, senkou_span_A_arr, senkou_span_B_arr, close_, kdata_shift);



//BWMFI
   double bwmfi_value_arr[];
   double bwmfi_color_arr[];
   BWMFI(bwmfi_value_arr,bwmfi_color_arr,_Symbol,timeframe_currently,VOLUME_TICK,count_num);

   double bwmfi_value = bwmfi_value_arr[kdata_shift];
   double bwmfi_color = bwmfi_color_arr[kdata_shift];


   double bwmfi_change1 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+1])/(MathAbs(bwmfi_value_arr[kdata_shift+1])+1E-15))*100;     //bwmfi变化率
   double bwmfi_change2 = ((bwmfi_value_arr[kdata_shift+1] - bwmfi_value_arr[kdata_shift+2])/(MathAbs(bwmfi_value_arr[kdata_shift+2])+1E-15))*100;
   double bwmfi_change3 = ((bwmfi_value_arr[kdata_shift+2] - bwmfi_value_arr[kdata_shift+3])/(MathAbs(bwmfi_value_arr[kdata_shift+3])+1E-15))*100;
   double bwmfi_change4 = ((bwmfi_value_arr[kdata_shift+3] - bwmfi_value_arr[kdata_shift+4])/(MathAbs(bwmfi_value_arr[kdata_shift+4])+1E-15))*100;
   double bwmfi_change5 = ((bwmfi_value_arr[kdata_shift+4] - bwmfi_value_arr[kdata_shift+5])/(MathAbs(bwmfi_value_arr[kdata_shift+5])+1E-15))*100;
   double bwmfi_change6 = ((bwmfi_value_arr[kdata_shift+5] - bwmfi_value_arr[kdata_shift+6])/(MathAbs(bwmfi_value_arr[kdata_shift+6])+1E-15))*100;
   double bwmfi_change7 = ((bwmfi_value_arr[kdata_shift+6] - bwmfi_value_arr[kdata_shift+7])/(MathAbs(bwmfi_value_arr[kdata_shift+7])+1E-15))*100;
   double bwmfi_change8 = ((bwmfi_value_arr[kdata_shift+7] - bwmfi_value_arr[kdata_shift+8])/(MathAbs(bwmfi_value_arr[kdata_shift+8])+1E-15))*100;
   double bwmfi_change9 = ((bwmfi_value_arr[kdata_shift+8] - bwmfi_value_arr[kdata_shift+9])/(MathAbs(bwmfi_value_arr[kdata_shift+9])+1E-15))*100;
   double bwmfi_change10 = ((bwmfi_value_arr[kdata_shift+9] - bwmfi_value_arr[kdata_shift+10])/(MathAbs(bwmfi_value_arr[kdata_shift+10])+1E-15))*100;



   double bwmfi_current_change1 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+1])/(MathAbs(bwmfi_value_arr[kdata_shift+1])+1E-15))*100;
   double bwmfi_current_change2 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+2])/(MathAbs(bwmfi_value_arr[kdata_shift+2])+1E-15))*100;
   double bwmfi_current_change3 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+3])/(MathAbs(bwmfi_value_arr[kdata_shift+3])+1E-15))*100;
   double bwmfi_current_change4 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+4])/(MathAbs(bwmfi_value_arr[kdata_shift+4])+1E-15))*100;
   double bwmfi_current_change5 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+5])/(MathAbs(bwmfi_value_arr[kdata_shift+5])+1E-15))*100;
   double bwmfi_current_change6 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+6])/(MathAbs(bwmfi_value_arr[kdata_shift+6])+1E-15))*100;
   double bwmfi_current_change7 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+7])/(MathAbs(bwmfi_value_arr[kdata_shift+7])+1E-15))*100;
   double bwmfi_current_change8 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+8])/(MathAbs(bwmfi_value_arr[kdata_shift+8])+1E-15))*100;
   double bwmfi_current_change9 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+9])/(MathAbs(bwmfi_value_arr[kdata_shift+9])+1E-15))*100;
   double bwmfi_current_change10 = ((bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+10])/(MathAbs(bwmfi_value_arr[kdata_shift+10])+1E-15))*100;



   double bwmfi_changeValue1 = bwmfi_value_arr[kdata_shift] - bwmfi_value_arr[kdata_shift+1];     //bwmfi变化值
   double bwmfi_changeValue2 = bwmfi_value_arr[kdata_shift+1] - bwmfi_value_arr[kdata_shift+2];
   double bwmfi_changeValue3 = bwmfi_value_arr[kdata_shift+2] - bwmfi_value_arr[kdata_shift+3];
   double bwmfi_changeValue4 = bwmfi_value_arr[kdata_shift+3] - bwmfi_value_arr[kdata_shift+4];
   double bwmfi_changeValue5 = bwmfi_value_arr[kdata_shift+4] - bwmfi_value_arr[kdata_shift+5];
   double bwmfi_changeValue6 = bwmfi_value_arr[kdata_shift+5] - bwmfi_value_arr[kdata_shift+6];
   double bwmfi_changeValue7 = bwmfi_value_arr[kdata_shift+6] - bwmfi_value_arr[kdata_shift+7];
   double bwmfi_changeValue8 = bwmfi_value_arr[kdata_shift+7] - bwmfi_value_arr[kdata_shift+8];
   double bwmfi_changeValue9 = bwmfi_value_arr[kdata_shift+8] - bwmfi_value_arr[kdata_shift+9];
   double bwmfi_changeValue10 = bwmfi_value_arr[kdata_shift+9] - bwmfi_value_arr[kdata_shift+10];



//printf("BWMFI");
//ArrayPrint(bwmfi_value_arr);
//ArrayPrint(bwmfi_color_arr);
//----------------------------------------BWMFI反映情况类型判定----------------------------------------
   double bwmfi_type = TypeBWMFI(bwmfi_color_arr, kdata_shift);



//Momentum
   double momentum_arr[];
   Momentum(momentum_arr,_Symbol,timeframe_currently,14,PRICE_CLOSE,count_num);

   double momentum = momentum_arr[kdata_shift];


   double momentum_change1 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+1])/(MathAbs(momentum_arr[kdata_shift+1])+1E-15))*100;     //momentum变化率
   double momentum_change2 = ((momentum_arr[kdata_shift+1] - momentum_arr[kdata_shift+2])/(MathAbs(momentum_arr[kdata_shift+2])+1E-15))*100;
   double momentum_change3 = ((momentum_arr[kdata_shift+2] - momentum_arr[kdata_shift+3])/(MathAbs(momentum_arr[kdata_shift+3])+1E-15))*100;
   double momentum_change4 = ((momentum_arr[kdata_shift+3] - momentum_arr[kdata_shift+4])/(MathAbs(momentum_arr[kdata_shift+4])+1E-15))*100;
   double momentum_change5 = ((momentum_arr[kdata_shift+4] - momentum_arr[kdata_shift+5])/(MathAbs(momentum_arr[kdata_shift+5])+1E-15))*100;
   double momentum_change6 = ((momentum_arr[kdata_shift+5] - momentum_arr[kdata_shift+6])/(MathAbs(momentum_arr[kdata_shift+6])+1E-15))*100;
   double momentum_change7 = ((momentum_arr[kdata_shift+6] - momentum_arr[kdata_shift+7])/(MathAbs(momentum_arr[kdata_shift+7])+1E-15))*100;
   double momentum_change8 = ((momentum_arr[kdata_shift+7] - momentum_arr[kdata_shift+8])/(MathAbs(momentum_arr[kdata_shift+8])+1E-15))*100;
   double momentum_change9 = ((momentum_arr[kdata_shift+8] - momentum_arr[kdata_shift+9])/(MathAbs(momentum_arr[kdata_shift+9])+1E-15))*100;
   double momentum_change10 = ((momentum_arr[kdata_shift+9] - momentum_arr[kdata_shift+10])/(MathAbs(momentum_arr[kdata_shift+10])+1E-15))*100;


   double momentum_current_change1 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+1])/(MathAbs(momentum_arr[kdata_shift+1])+1E-15))*100;
   double momentum_current_change2 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+2])/(MathAbs(momentum_arr[kdata_shift+2])+1E-15))*100;
   double momentum_current_change3 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+3])/(MathAbs(momentum_arr[kdata_shift+3])+1E-15))*100;
   double momentum_current_change4 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+4])/(MathAbs(momentum_arr[kdata_shift+4])+1E-15))*100;
   double momentum_current_change5 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+5])/(MathAbs(momentum_arr[kdata_shift+5])+1E-15))*100;
   double momentum_current_change6 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+6])/(MathAbs(momentum_arr[kdata_shift+6])+1E-15))*100;
   double momentum_current_change7 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+7])/(MathAbs(momentum_arr[kdata_shift+7])+1E-15))*100;
   double momentum_current_change8 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+8])/(MathAbs(momentum_arr[kdata_shift+8])+1E-15))*100;
   double momentum_current_change9 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+9])/(MathAbs(momentum_arr[kdata_shift+9])+1E-15))*100;
   double momentum_current_change10 = ((momentum_arr[kdata_shift] - momentum_arr[kdata_shift+10])/(MathAbs(momentum_arr[kdata_shift+10])+1E-15))*100;



   double momentum_changeValue1 = momentum_arr[kdata_shift] - momentum_arr[kdata_shift+1];     //momentum变化值
   double momentum_changeValue2 = momentum_arr[kdata_shift+1] - momentum_arr[kdata_shift+2];
   double momentum_changeValue3 = momentum_arr[kdata_shift+2] - momentum_arr[kdata_shift+3];
   double momentum_changeValue4 = momentum_arr[kdata_shift+3] - momentum_arr[kdata_shift+4];
   double momentum_changeValue5 = momentum_arr[kdata_shift+4] - momentum_arr[kdata_shift+5];
   double momentum_changeValue6 = momentum_arr[kdata_shift+5] - momentum_arr[kdata_shift+6];
   double momentum_changeValue7 = momentum_arr[kdata_shift+6] - momentum_arr[kdata_shift+7];
   double momentum_changeValue8 = momentum_arr[kdata_shift+7] - momentum_arr[kdata_shift+8];
   double momentum_changeValue9 = momentum_arr[kdata_shift+8] - momentum_arr[kdata_shift+9];
   double momentum_changeValue10 = momentum_arr[kdata_shift+9] - momentum_arr[kdata_shift+10];


//printf("Momentum");
//ArrayPrint(momentum_arr);
//----------------------------------------Momentum反映情况类型判定----------------------------------------
   double momentum_type = TypeMomentum(momentum_arr, kdata_shift);



//MFI
   double mfi_arr[];
   MFI(mfi_arr,_Symbol,timeframe_currently,14,VOLUME_TICK,count_num);

   double mfi = mfi_arr[kdata_shift];


   double mfi_change1 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+1])/(mfi_arr[kdata_shift+1]+1E-15))*100;     //mfi变化率
   double mfi_change2 = ((mfi_arr[kdata_shift+1] - mfi_arr[kdata_shift+2])/(mfi_arr[kdata_shift+2]+1E-15))*100;
   double mfi_change3 = ((mfi_arr[kdata_shift+2] - mfi_arr[kdata_shift+3])/(mfi_arr[kdata_shift+3]+1E-15))*100;
   double mfi_change4 = ((mfi_arr[kdata_shift+3] - mfi_arr[kdata_shift+4])/(mfi_arr[kdata_shift+4]+1E-15))*100;
   double mfi_change5 = ((mfi_arr[kdata_shift+4] - mfi_arr[kdata_shift+5])/(mfi_arr[kdata_shift+5]+1E-15))*100;
   double mfi_change6 = ((mfi_arr[kdata_shift+5] - mfi_arr[kdata_shift+6])/(mfi_arr[kdata_shift+6]+1E-15))*100;
   double mfi_change7 = ((mfi_arr[kdata_shift+6] - mfi_arr[kdata_shift+7])/(mfi_arr[kdata_shift+7]+1E-15))*100;
   double mfi_change8 = ((mfi_arr[kdata_shift+7] - mfi_arr[kdata_shift+8])/(mfi_arr[kdata_shift+8]+1E-15))*100;
   double mfi_change9 = ((mfi_arr[kdata_shift+8] - mfi_arr[kdata_shift+9])/(mfi_arr[kdata_shift+9]+1E-15))*100;
   double mfi_change10 = ((mfi_arr[kdata_shift+9] - mfi_arr[kdata_shift+10])/(mfi_arr[kdata_shift+10]+1E-15))*100;



   double mfi_current_change1 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+1])/(mfi_arr[kdata_shift+1]+1E-15))*100;
   double mfi_current_change2 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+2])/(mfi_arr[kdata_shift+2]+1E-15))*100;
   double mfi_current_change3 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+3])/(mfi_arr[kdata_shift+3]+1E-15))*100;
   double mfi_current_change4 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+4])/(mfi_arr[kdata_shift+4]+1E-15))*100;
   double mfi_current_change5 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+5])/(mfi_arr[kdata_shift+5]+1E-15))*100;
   double mfi_current_change6 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+6])/(mfi_arr[kdata_shift+6]+1E-15))*100;
   double mfi_current_change7 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+7])/(mfi_arr[kdata_shift+7]+1E-15))*100;
   double mfi_current_change8 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+8])/(mfi_arr[kdata_shift+8]+1E-15))*100;
   double mfi_current_change9 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+9])/(mfi_arr[kdata_shift+9]+1E-15))*100;
   double mfi_current_change10 = ((mfi_arr[kdata_shift] - mfi_arr[kdata_shift+10])/(mfi_arr[kdata_shift+10]+1E-15))*100;



   double mfi_changeValue1 = mfi_arr[kdata_shift] - mfi_arr[kdata_shift+1];     //mfi变化值
   double mfi_changeValue2 = mfi_arr[kdata_shift+1] - mfi_arr[kdata_shift+2];
   double mfi_changeValue3 = mfi_arr[kdata_shift+2] - mfi_arr[kdata_shift+3];
   double mfi_changeValue4 = mfi_arr[kdata_shift+3] - mfi_arr[kdata_shift+4];
   double mfi_changeValue5 = mfi_arr[kdata_shift+4] - mfi_arr[kdata_shift+5];
   double mfi_changeValue6 = mfi_arr[kdata_shift+5] - mfi_arr[kdata_shift+6];
   double mfi_changeValue7 = mfi_arr[kdata_shift+6] - mfi_arr[kdata_shift+7];
   double mfi_changeValue8 = mfi_arr[kdata_shift+7] - mfi_arr[kdata_shift+8];
   double mfi_changeValue9 = mfi_arr[kdata_shift+8] - mfi_arr[kdata_shift+9];
   double mfi_changeValue10 = mfi_arr[kdata_shift+9] - mfi_arr[kdata_shift+10];


//printf("MFI");
//ArrayPrint(mfi_arr);
//----------------------------------------MFI反映情况类型判定----------------------------------------
   double mfi_type = TypeMFI(mfi_arr, kdata_shift);



//OsMA
   double osMA_arr[];
   OsMA(osMA_arr,_Symbol,timeframe_currently,12,26,9,PRICE_CLOSE,count_num);

   double osMA = osMA_arr[kdata_shift];


   double osMA_change1 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+1])/(MathAbs(osMA_arr[kdata_shift+1])+1E-15))*100;     //osMA变化率
   double osMA_change2 = ((osMA_arr[kdata_shift+1] - osMA_arr[kdata_shift+2])/(MathAbs(osMA_arr[kdata_shift+2])+1E-15))*100;
   double osMA_change3 = ((osMA_arr[kdata_shift+2] - osMA_arr[kdata_shift+3])/(MathAbs(osMA_arr[kdata_shift+3])+1E-15))*100;
   double osMA_change4 = ((osMA_arr[kdata_shift+3] - osMA_arr[kdata_shift+4])/(MathAbs(osMA_arr[kdata_shift+4])+1E-15))*100;
   double osMA_change5 = ((osMA_arr[kdata_shift+4] - osMA_arr[kdata_shift+5])/(MathAbs(osMA_arr[kdata_shift+5])+1E-15))*100;
   double osMA_change6 = ((osMA_arr[kdata_shift+5] - osMA_arr[kdata_shift+6])/(MathAbs(osMA_arr[kdata_shift+6])+1E-15))*100;
   double osMA_change7 = ((osMA_arr[kdata_shift+6] - osMA_arr[kdata_shift+7])/(MathAbs(osMA_arr[kdata_shift+7])+1E-15))*100;
   double osMA_change8 = ((osMA_arr[kdata_shift+7] - osMA_arr[kdata_shift+8])/(MathAbs(osMA_arr[kdata_shift+8])+1E-15))*100;
   double osMA_change9 = ((osMA_arr[kdata_shift+8] - osMA_arr[kdata_shift+9])/(MathAbs(osMA_arr[kdata_shift+9])+1E-15))*100;
   double osMA_change10 = ((osMA_arr[kdata_shift+9] - osMA_arr[kdata_shift+10])/(MathAbs(osMA_arr[kdata_shift+10])+1E-15))*100;



   double osMA_current_change1 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+1])/(MathAbs(osMA_arr[kdata_shift+1])+1E-15))*100;
   double osMA_current_change2 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+2])/(MathAbs(osMA_arr[kdata_shift+2])+1E-15))*100;
   double osMA_current_change3 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+3])/(MathAbs(osMA_arr[kdata_shift+3])+1E-15))*100;
   double osMA_current_change4 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+4])/(MathAbs(osMA_arr[kdata_shift+4])+1E-15))*100;
   double osMA_current_change5 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+5])/(MathAbs(osMA_arr[kdata_shift+5])+1E-15))*100;
   double osMA_current_change6 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+6])/(MathAbs(osMA_arr[kdata_shift+6])+1E-15))*100;
   double osMA_current_change7 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+7])/(MathAbs(osMA_arr[kdata_shift+7])+1E-15))*100;
   double osMA_current_change8 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+8])/(MathAbs(osMA_arr[kdata_shift+8])+1E-15))*100;
   double osMA_current_change9 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+9])/(MathAbs(osMA_arr[kdata_shift+9])+1E-15))*100;
   double osMA_current_change10 = ((osMA_arr[kdata_shift] - osMA_arr[kdata_shift+10])/(MathAbs(osMA_arr[kdata_shift+10])+1E-15))*100;



   double osMA_changeValue1 = osMA_arr[kdata_shift] - osMA_arr[kdata_shift+1];
   double osMA_changeValue2 = osMA_arr[kdata_shift+1] - osMA_arr[kdata_shift+2];
   double osMA_changeValue3 = osMA_arr[kdata_shift+2] - osMA_arr[kdata_shift+3];
   double osMA_changeValue4 = osMA_arr[kdata_shift+3] - osMA_arr[kdata_shift+4];
   double osMA_changeValue5 = osMA_arr[kdata_shift+4] - osMA_arr[kdata_shift+5];
   double osMA_changeValue6 = osMA_arr[kdata_shift+5] - osMA_arr[kdata_shift+6];
   double osMA_changeValue7 = osMA_arr[kdata_shift+6] - osMA_arr[kdata_shift+7];
   double osMA_changeValue8 = osMA_arr[kdata_shift+7] - osMA_arr[kdata_shift+8];
   double osMA_changeValue9 = osMA_arr[kdata_shift+8] - osMA_arr[kdata_shift+9];
   double osMA_changeValue10 = osMA_arr[kdata_shift+9] - osMA_arr[kdata_shift+10];


//printf("OsMA");
//ArrayPrint(osMA_arr);
//----------------------------------------OsMA反映情况类型判定----------------------------------------
   double osMA_type = TypeOsMA(osMA_arr, kdata_shift);



//OBV
   double obv_arr[];
   OBV(obv_arr,_Symbol,timeframe_currently,VOLUME_TICK,count_num);

   double obv = obv_arr[kdata_shift];



   double obv_change1 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+1])/(MathAbs(obv_arr[kdata_shift+1])+1E-15))*100;     //obv变化率
   double obv_change2 = ((obv_arr[kdata_shift+1] - obv_arr[kdata_shift+2])/(MathAbs(obv_arr[kdata_shift+2])+1E-15))*100;
   double obv_change3 = ((obv_arr[kdata_shift+2] - obv_arr[kdata_shift+3])/(MathAbs(obv_arr[kdata_shift+3])+1E-15))*100;
   double obv_change4 = ((obv_arr[kdata_shift+3] - obv_arr[kdata_shift+4])/(MathAbs(obv_arr[kdata_shift+4])+1E-15))*100;
   double obv_change5 = ((obv_arr[kdata_shift+4] - obv_arr[kdata_shift+5])/(MathAbs(obv_arr[kdata_shift+5])+1E-15))*100;
   double obv_change6 = ((obv_arr[kdata_shift+5] - obv_arr[kdata_shift+6])/(MathAbs(obv_arr[kdata_shift+6])+1E-15))*100;
   double obv_change7 = ((obv_arr[kdata_shift+6] - obv_arr[kdata_shift+7])/(MathAbs(obv_arr[kdata_shift+7])+1E-15))*100;
   double obv_change8 = ((obv_arr[kdata_shift+7] - obv_arr[kdata_shift+8])/(MathAbs(obv_arr[kdata_shift+8])+1E-15))*100;
   double obv_change9 = ((obv_arr[kdata_shift+8] - obv_arr[kdata_shift+9])/(MathAbs(obv_arr[kdata_shift+9])+1E-15))*100;
   double obv_change10 = ((obv_arr[kdata_shift+9] - obv_arr[kdata_shift+10])/(MathAbs(obv_arr[kdata_shift+10])+1E-15))*100;


   double obv_current_change1 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+1])/(MathAbs(obv_arr[kdata_shift+1])+1E-15))*100;
   double obv_current_change2 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+2])/(MathAbs(obv_arr[kdata_shift+2])+1E-15))*100;
   double obv_current_change3 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+3])/(MathAbs(obv_arr[kdata_shift+3])+1E-15))*100;
   double obv_current_change4 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+4])/(MathAbs(obv_arr[kdata_shift+4])+1E-15))*100;
   double obv_current_change5 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+5])/(MathAbs(obv_arr[kdata_shift+5])+1E-15))*100;
   double obv_current_change6 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+6])/(MathAbs(obv_arr[kdata_shift+6])+1E-15))*100;
   double obv_current_change7 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+7])/(MathAbs(obv_arr[kdata_shift+7])+1E-15))*100;
   double obv_current_change8 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+8])/(MathAbs(obv_arr[kdata_shift+8])+1E-15))*100;
   double obv_current_change9 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+9])/(MathAbs(obv_arr[kdata_shift+9])+1E-15))*100;
   double obv_current_change10 = ((obv_arr[kdata_shift] - obv_arr[kdata_shift+10])/(MathAbs(obv_arr[kdata_shift+10])+1E-15))*100;

//printf("OBV");
//ArrayPrint(obv_arr);
//----------------------------------------OBV反映情况类型判定----------------------------------------
   double obv_type = TypeOBV(obv_arr, close_, close_1, kdata_shift);



//RVI
   double rvi_arr[];
   double rvi_signal_arr[];
   RVI(rvi_arr,rvi_signal_arr,_Symbol,timeframe_currently,10,count_num);

   double rvi = rvi_arr[kdata_shift];
   double rvi_signal = rvi_signal_arr[kdata_shift];


   double rvi_change1 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+1])/(MathAbs(rvi_arr[kdata_shift+1])+1E-15))*100;     //rvi变化率
   double rvi_change2 = ((rvi_arr[kdata_shift+1] - rvi_arr[kdata_shift+2])/(MathAbs(rvi_arr[kdata_shift+2])+1E-15))*100;
   double rvi_change3 = ((rvi_arr[kdata_shift+2] - rvi_arr[kdata_shift+3])/(MathAbs(rvi_arr[kdata_shift+3])+1E-15))*100;
   double rvi_change4 = ((rvi_arr[kdata_shift+3] - rvi_arr[kdata_shift+4])/(MathAbs(rvi_arr[kdata_shift+4])+1E-15))*100;
   double rvi_change5 = ((rvi_arr[kdata_shift+4] - rvi_arr[kdata_shift+5])/(MathAbs(rvi_arr[kdata_shift+5])+1E-15))*100;
   double rvi_change6 = ((rvi_arr[kdata_shift+5] - rvi_arr[kdata_shift+6])/(MathAbs(rvi_arr[kdata_shift+6])+1E-15))*100;
   double rvi_change7 = ((rvi_arr[kdata_shift+6] - rvi_arr[kdata_shift+7])/(MathAbs(rvi_arr[kdata_shift+7])+1E-15))*100;
   double rvi_change8 = ((rvi_arr[kdata_shift+7] - rvi_arr[kdata_shift+8])/(MathAbs(rvi_arr[kdata_shift+8])+1E-15))*100;
   double rvi_change9 = ((rvi_arr[kdata_shift+8] - rvi_arr[kdata_shift+9])/(MathAbs(rvi_arr[kdata_shift+9])+1E-15))*100;
   double rvi_change10 = ((rvi_arr[kdata_shift+9] - rvi_arr[kdata_shift+10])/(MathAbs(rvi_arr[kdata_shift+10])+1E-15))*100;


   double rvi_current_change1 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+1])/(MathAbs(rvi_arr[kdata_shift+1])+1E-15))*100;
   double rvi_current_change2 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+2])/(MathAbs(rvi_arr[kdata_shift+2])+1E-15))*100;
   double rvi_current_change3 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+3])/(MathAbs(rvi_arr[kdata_shift+3])+1E-15))*100;
   double rvi_current_change4 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+4])/(MathAbs(rvi_arr[kdata_shift+4])+1E-15))*100;
   double rvi_current_change5 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+5])/(MathAbs(rvi_arr[kdata_shift+5])+1E-15))*100;
   double rvi_current_change6 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+6])/(MathAbs(rvi_arr[kdata_shift+6])+1E-15))*100;
   double rvi_current_change7 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+7])/(MathAbs(rvi_arr[kdata_shift+7])+1E-15))*100;
   double rvi_current_change8 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+8])/(MathAbs(rvi_arr[kdata_shift+8])+1E-15))*100;
   double rvi_current_change9 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+9])/(MathAbs(rvi_arr[kdata_shift+9])+1E-15))*100;
   double rvi_current_change10 = ((rvi_arr[kdata_shift] - rvi_arr[kdata_shift+10])/(MathAbs(rvi_arr[kdata_shift+10])+1E-15))*100;



   double rvi_changeValue1 = rvi_arr[kdata_shift] - rvi_arr[kdata_shift+1];     //rvi变化值
   double rvi_changeValue2 = rvi_arr[kdata_shift+1] - rvi_arr[kdata_shift+2];
   double rvi_changeValue3 = rvi_arr[kdata_shift+2] - rvi_arr[kdata_shift+3];
   double rvi_changeValue4 = rvi_arr[kdata_shift+3] - rvi_arr[kdata_shift+4];
   double rvi_changeValue5 = rvi_arr[kdata_shift+4] - rvi_arr[kdata_shift+5];
   double rvi_changeValue6 = rvi_arr[kdata_shift+5] - rvi_arr[kdata_shift+6];
   double rvi_changeValue7 = rvi_arr[kdata_shift+6] - rvi_arr[kdata_shift+7];
   double rvi_changeValue8 = rvi_arr[kdata_shift+7] - rvi_arr[kdata_shift+8];
   double rvi_changeValue9 = rvi_arr[kdata_shift+8] - rvi_arr[kdata_shift+9];
   double rvi_changeValue10 = rvi_arr[kdata_shift+9] - rvi_arr[kdata_shift+10];


//printf("RVI");
//ArrayPrint(rvi_arr);
//ArrayPrint(rvi_signal_arr);
//----------------------------------------RVI反映情况类型判定----------------------------------------
   double rvi_type = TypeRVI(rvi_arr, rvi_signal_arr, kdata_shift);



//StdDev
   double stdDev_arr[];
   StdDev(stdDev_arr,_Symbol,timeframe_currently,20,0,MODE_SMA,PRICE_CLOSE,count_num);

   double stdDev = stdDev_arr[kdata_shift];


   double stdDev_change1 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+1])/stdDev_arr[kdata_shift+1])*100;     //stdDev变化率
   double stdDev_change2 = ((stdDev_arr[kdata_shift+1] - stdDev_arr[kdata_shift+2])/stdDev_arr[kdata_shift+2])*100;
   double stdDev_change3 = ((stdDev_arr[kdata_shift+2] - stdDev_arr[kdata_shift+3])/stdDev_arr[kdata_shift+3])*100;
   double stdDev_change4 = ((stdDev_arr[kdata_shift+3] - stdDev_arr[kdata_shift+4])/stdDev_arr[kdata_shift+4])*100;
   double stdDev_change5 = ((stdDev_arr[kdata_shift+4] - stdDev_arr[kdata_shift+5])/stdDev_arr[kdata_shift+5])*100;
   double stdDev_change6 = ((stdDev_arr[kdata_shift+5] - stdDev_arr[kdata_shift+6])/stdDev_arr[kdata_shift+6])*100;
   double stdDev_change7 = ((stdDev_arr[kdata_shift+6] - stdDev_arr[kdata_shift+7])/stdDev_arr[kdata_shift+7])*100;
   double stdDev_change8 = ((stdDev_arr[kdata_shift+7] - stdDev_arr[kdata_shift+8])/stdDev_arr[kdata_shift+8])*100;
   double stdDev_change9 = ((stdDev_arr[kdata_shift+8] - stdDev_arr[kdata_shift+9])/stdDev_arr[kdata_shift+9])*100;
   double stdDev_change10 = ((stdDev_arr[kdata_shift+9] - stdDev_arr[kdata_shift+10])/stdDev_arr[kdata_shift+10])*100;



   double stdDev_current_change1 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+1])/stdDev_arr[kdata_shift+1])*100;
   double stdDev_current_change2 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+2])/stdDev_arr[kdata_shift+2])*100;
   double stdDev_current_change3 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+3])/stdDev_arr[kdata_shift+3])*100;
   double stdDev_current_change4 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+4])/stdDev_arr[kdata_shift+4])*100;
   double stdDev_current_change5 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+5])/stdDev_arr[kdata_shift+5])*100;
   double stdDev_current_change6 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+6])/stdDev_arr[kdata_shift+6])*100;
   double stdDev_current_change7 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+7])/stdDev_arr[kdata_shift+7])*100;
   double stdDev_current_change8 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+8])/stdDev_arr[kdata_shift+8])*100;
   double stdDev_current_change9 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+9])/stdDev_arr[kdata_shift+9])*100;
   double stdDev_current_change10 = ((stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+10])/stdDev_arr[kdata_shift+10])*100;


   double stdDev_changeValue1 = stdDev_arr[kdata_shift] - stdDev_arr[kdata_shift+1];     //stdDev变化值
   double stdDev_changeValue2 = stdDev_arr[kdata_shift+1] - stdDev_arr[kdata_shift+2];
   double stdDev_changeValue3 = stdDev_arr[kdata_shift+2] - stdDev_arr[kdata_shift+3];
   double stdDev_changeValue4 = stdDev_arr[kdata_shift+3] - stdDev_arr[kdata_shift+4];
   double stdDev_changeValue5 = stdDev_arr[kdata_shift+4] - stdDev_arr[kdata_shift+5];
   double stdDev_changeValue6 = stdDev_arr[kdata_shift+5] - stdDev_arr[kdata_shift+6];
   double stdDev_changeValue7 = stdDev_arr[kdata_shift+6] - stdDev_arr[kdata_shift+7];
   double stdDev_changeValue8 = stdDev_arr[kdata_shift+7] - stdDev_arr[kdata_shift+8];
   double stdDev_changeValue9 = stdDev_arr[kdata_shift+8] - stdDev_arr[kdata_shift+9];
   double stdDev_changeValue10 = stdDev_arr[kdata_shift+9] - stdDev_arr[kdata_shift+10];


//printf("StdDev");
//ArrayPrint(stdDev_arr);
//----------------------------------------StdDev反映情况类型判定----------------------------------------
   double stdDev_type = TypeStdDev(stdDev_arr, kdata_shift);



//TEMA
   double tema_arr[];
   TEMA(tema_arr,_Symbol,timeframe_currently,14,0,PRICE_CLOSE,count_num);

   double tema = tema_arr[kdata_shift];


   double tema_change1 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+1])/tema_arr[kdata_shift+1])*100;     //tema变化率
   double tema_change2 = ((tema_arr[kdata_shift+1] - tema_arr[kdata_shift+2])/tema_arr[kdata_shift+2])*100;
   double tema_change3 = ((tema_arr[kdata_shift+2] - tema_arr[kdata_shift+3])/tema_arr[kdata_shift+3])*100;
   double tema_change4 = ((tema_arr[kdata_shift+3] - tema_arr[kdata_shift+4])/tema_arr[kdata_shift+4])*100;
   double tema_change5 = ((tema_arr[kdata_shift+4] - tema_arr[kdata_shift+5])/tema_arr[kdata_shift+5])*100;
   double tema_change6 = ((tema_arr[kdata_shift+5] - tema_arr[kdata_shift+6])/tema_arr[kdata_shift+6])*100;
   double tema_change7 = ((tema_arr[kdata_shift+6] - tema_arr[kdata_shift+7])/tema_arr[kdata_shift+7])*100;
   double tema_change8 = ((tema_arr[kdata_shift+7] - tema_arr[kdata_shift+8])/tema_arr[kdata_shift+8])*100;
   double tema_change9 = ((tema_arr[kdata_shift+8] - tema_arr[kdata_shift+9])/tema_arr[kdata_shift+9])*100;
   double tema_change10 = ((tema_arr[kdata_shift+9] - tema_arr[kdata_shift+10])/tema_arr[kdata_shift+10])*100;



   double tema_current_change1 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+1])/tema_arr[kdata_shift+1])*100;
   double tema_current_change2 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+2])/tema_arr[kdata_shift+2])*100;
   double tema_current_change3 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+3])/tema_arr[kdata_shift+3])*100;
   double tema_current_change4 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+4])/tema_arr[kdata_shift+4])*100;
   double tema_current_change5 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+5])/tema_arr[kdata_shift+5])*100;
   double tema_current_change6 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+6])/tema_arr[kdata_shift+6])*100;
   double tema_current_change7 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+7])/tema_arr[kdata_shift+7])*100;
   double tema_current_change8 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+8])/tema_arr[kdata_shift+8])*100;
   double tema_current_change9 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+9])/tema_arr[kdata_shift+9])*100;
   double tema_current_change10 = ((tema_arr[kdata_shift] - tema_arr[kdata_shift+10])/tema_arr[kdata_shift+10])*100;


//printf("TEMA");
//ArrayPrint(tema_arr);
//----------------------------------------TEMA反映情况类型判定----------------------------------------
   double tema_type = TypeTEMA(tema_arr, close_, close_1, kdata_shift);



//TriX
   double triX_arr[];
   TriX(triX_arr,_Symbol,timeframe_currently,14,PRICE_CLOSE,count_num);

   double triX = triX_arr[kdata_shift];



   double triX_change1 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+1])/(MathAbs(triX_arr[kdata_shift+1])+1E-15))*100;     //triX变化率
   double triX_change2 = ((triX_arr[kdata_shift+1] - triX_arr[kdata_shift+2])/(MathAbs(triX_arr[kdata_shift+2])+1E-15))*100;
   double triX_change3 = ((triX_arr[kdata_shift+2] - triX_arr[kdata_shift+3])/(MathAbs(triX_arr[kdata_shift+3])+1E-15))*100;
   double triX_change4 = ((triX_arr[kdata_shift+3] - triX_arr[kdata_shift+4])/(MathAbs(triX_arr[kdata_shift+4])+1E-15))*100;
   double triX_change5 = ((triX_arr[kdata_shift+4] - triX_arr[kdata_shift+5])/(MathAbs(triX_arr[kdata_shift+5])+1E-15))*100;
   double triX_change6 = ((triX_arr[kdata_shift+5] - triX_arr[kdata_shift+6])/(MathAbs(triX_arr[kdata_shift+6])+1E-15))*100;
   double triX_change7 = ((triX_arr[kdata_shift+6] - triX_arr[kdata_shift+7])/(MathAbs(triX_arr[kdata_shift+7])+1E-15))*100;
   double triX_change8 = ((triX_arr[kdata_shift+7] - triX_arr[kdata_shift+8])/(MathAbs(triX_arr[kdata_shift+8])+1E-15))*100;
   double triX_change9 = ((triX_arr[kdata_shift+8] - triX_arr[kdata_shift+9])/(MathAbs(triX_arr[kdata_shift+9])+1E-15))*100;
   double triX_change10 = ((triX_arr[kdata_shift+9] - triX_arr[kdata_shift+10])/(MathAbs(triX_arr[kdata_shift+10])+1E-15))*100;



   double triX_current_change1 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+1])/(MathAbs(triX_arr[kdata_shift+1])+1E-15))*100;
   double triX_current_change2 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+2])/(MathAbs(triX_arr[kdata_shift+2])+1E-15))*100;
   double triX_current_change3 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+3])/(MathAbs(triX_arr[kdata_shift+3])+1E-15))*100;
   double triX_current_change4 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+4])/(MathAbs(triX_arr[kdata_shift+4])+1E-15))*100;
   double triX_current_change5 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+5])/(MathAbs(triX_arr[kdata_shift+5])+1E-15))*100;
   double triX_current_change6 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+6])/(MathAbs(triX_arr[kdata_shift+6])+1E-15))*100;
   double triX_current_change7 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+7])/(MathAbs(triX_arr[kdata_shift+7])+1E-15))*100;
   double triX_current_change8 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+8])/(MathAbs(triX_arr[kdata_shift+8])+1E-15))*100;
   double triX_current_change9 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+9])/(MathAbs(triX_arr[kdata_shift+9])+1E-15))*100;
   double triX_current_change10 = ((triX_arr[kdata_shift] - triX_arr[kdata_shift+10])/(MathAbs(triX_arr[kdata_shift+10])+1E-15))*100;


//printf("TriX");
//ArrayPrint(triX_arr);
//----------------------------------------TriX反映情况类型判定----------------------------------------
   double triX_type = TypeTriX(triX_arr, kdata_shift);



//WPR
   double wpr_arr[];
   WPR(wpr_arr,_Symbol,timeframe_currently,14,count_num);

   double wpr = wpr_arr[kdata_shift];


   double wpr_change1 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+1])/(MathAbs(wpr_arr[kdata_shift+1])+1E-15))*100;     //wpr变化率
   double wpr_change2 = ((wpr_arr[kdata_shift+1] - wpr_arr[kdata_shift+2])/(MathAbs(wpr_arr[kdata_shift+2])+1E-15))*100;
   double wpr_change3 = ((wpr_arr[kdata_shift+2] - wpr_arr[kdata_shift+3])/(MathAbs(wpr_arr[kdata_shift+3])+1E-15))*100;
   double wpr_change4 = ((wpr_arr[kdata_shift+3] - wpr_arr[kdata_shift+4])/(MathAbs(wpr_arr[kdata_shift+4])+1E-15))*100;
   double wpr_change5 = ((wpr_arr[kdata_shift+4] - wpr_arr[kdata_shift+5])/(MathAbs(wpr_arr[kdata_shift+5])+1E-15))*100;
   double wpr_change6 = ((wpr_arr[kdata_shift+5] - wpr_arr[kdata_shift+6])/(MathAbs(wpr_arr[kdata_shift+6])+1E-15))*100;
   double wpr_change7 = ((wpr_arr[kdata_shift+6] - wpr_arr[kdata_shift+7])/(MathAbs(wpr_arr[kdata_shift+7])+1E-15))*100;
   double wpr_change8 = ((wpr_arr[kdata_shift+7] - wpr_arr[kdata_shift+8])/(MathAbs(wpr_arr[kdata_shift+8])+1E-15))*100;
   double wpr_change9 = ((wpr_arr[kdata_shift+8] - wpr_arr[kdata_shift+9])/(MathAbs(wpr_arr[kdata_shift+9])+1E-15))*100;
   double wpr_change10 = ((wpr_arr[kdata_shift+9] - wpr_arr[kdata_shift+10])/(MathAbs(wpr_arr[kdata_shift+10])+1E-15))*100;


   double wpr_current_change1 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+1])/(MathAbs(wpr_arr[kdata_shift+1])+1E-15))*100;
   double wpr_current_change2 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+2])/(MathAbs(wpr_arr[kdata_shift+2])+1E-15))*100;
   double wpr_current_change3 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+3])/(MathAbs(wpr_arr[kdata_shift+3])+1E-15))*100;
   double wpr_current_change4 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+4])/(MathAbs(wpr_arr[kdata_shift+4])+1E-15))*100;
   double wpr_current_change5 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+5])/(MathAbs(wpr_arr[kdata_shift+5])+1E-15))*100;
   double wpr_current_change6 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+6])/(MathAbs(wpr_arr[kdata_shift+6])+1E-15))*100;
   double wpr_current_change7 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+7])/(MathAbs(wpr_arr[kdata_shift+7])+1E-15))*100;
   double wpr_current_change8 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+8])/(MathAbs(wpr_arr[kdata_shift+8])+1E-15))*100;
   double wpr_current_change9 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+9])/(MathAbs(wpr_arr[kdata_shift+9])+1E-15))*100;
   double wpr_current_change10 = ((wpr_arr[kdata_shift] - wpr_arr[kdata_shift+10])/(MathAbs(wpr_arr[kdata_shift+10])+1E-15))*100;



   double wpr_changeValue1 = wpr_arr[kdata_shift] - wpr_arr[kdata_shift+1];     //wpr变化值
   double wpr_changeValue2 = wpr_arr[kdata_shift+1] - wpr_arr[kdata_shift+2];
   double wpr_changeValue3 = wpr_arr[kdata_shift+2] - wpr_arr[kdata_shift+3];
   double wpr_changeValue4 = wpr_arr[kdata_shift+3] - wpr_arr[kdata_shift+4];
   double wpr_changeValue5 = wpr_arr[kdata_shift+4] - wpr_arr[kdata_shift+5];
   double wpr_changeValue6 = wpr_arr[kdata_shift+5] - wpr_arr[kdata_shift+6];
   double wpr_changeValue7 = wpr_arr[kdata_shift+6] - wpr_arr[kdata_shift+7];
   double wpr_changeValue8 = wpr_arr[kdata_shift+7] - wpr_arr[kdata_shift+8];
   double wpr_changeValue9 = wpr_arr[kdata_shift+8] - wpr_arr[kdata_shift+9];
   double wpr_changeValue10 = wpr_arr[kdata_shift+9] - wpr_arr[kdata_shift+10];


//printf("WPR");
//ArrayPrint(wpr_arr);
//----------------------------------------WPR反映情况类型判定----------------------------------------
   double wpr_type = TypeWPR(wpr_arr, kdata_shift);



//VIDyA
   double vidya_arr[];
   VIDyA(vidya_arr,_Symbol,timeframe_currently,15,12,0,PRICE_CLOSE,count_num);

   double vidya = vidya_arr[kdata_shift];


   double vidya_change1 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+1])/vidya_arr[kdata_shift+1])*100;     //vidya变化率
   double vidya_change2 = ((vidya_arr[kdata_shift+1] - vidya_arr[kdata_shift+2])/vidya_arr[kdata_shift+2])*100;
   double vidya_change3 = ((vidya_arr[kdata_shift+2] - vidya_arr[kdata_shift+3])/vidya_arr[kdata_shift+3])*100;
   double vidya_change4 = ((vidya_arr[kdata_shift+3] - vidya_arr[kdata_shift+4])/vidya_arr[kdata_shift+4])*100;
   double vidya_change5 = ((vidya_arr[kdata_shift+4] - vidya_arr[kdata_shift+5])/vidya_arr[kdata_shift+5])*100;
   double vidya_change6 = ((vidya_arr[kdata_shift+5] - vidya_arr[kdata_shift+6])/vidya_arr[kdata_shift+6])*100;
   double vidya_change7 = ((vidya_arr[kdata_shift+6] - vidya_arr[kdata_shift+7])/vidya_arr[kdata_shift+7])*100;
   double vidya_change8 = ((vidya_arr[kdata_shift+7] - vidya_arr[kdata_shift+8])/vidya_arr[kdata_shift+8])*100;
   double vidya_change9 = ((vidya_arr[kdata_shift+8] - vidya_arr[kdata_shift+9])/vidya_arr[kdata_shift+9])*100;
   double vidya_change10 = ((vidya_arr[kdata_shift+9] - vidya_arr[kdata_shift+10])/vidya_arr[kdata_shift+10])*100;


   double vidya_current_change1 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+1])/vidya_arr[kdata_shift+1])*100;
   double vidya_current_change2 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+2])/vidya_arr[kdata_shift+2])*100;
   double vidya_current_change3 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+3])/vidya_arr[kdata_shift+3])*100;
   double vidya_current_change4 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+4])/vidya_arr[kdata_shift+4])*100;
   double vidya_current_change5 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+5])/vidya_arr[kdata_shift+5])*100;
   double vidya_current_change6 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+6])/vidya_arr[kdata_shift+6])*100;
   double vidya_current_change7 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+7])/vidya_arr[kdata_shift+7])*100;
   double vidya_current_change8 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+8])/vidya_arr[kdata_shift+8])*100;
   double vidya_current_change9 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+9])/vidya_arr[kdata_shift+9])*100;
   double vidya_current_change10 = ((vidya_arr[kdata_shift] - vidya_arr[kdata_shift+10])/vidya_arr[kdata_shift+10])*100;

//printf("VIDyA");
//ArrayPrint(vidya_arr);
//----------------------------------------VIDyA反映情况类型判定----------------------------------------
   double vidya_type = TypeVIDyA(vidya_arr, close_, close_1, kdata_shift);


//90日内位置
   if(ArraySize(high_history)>90)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-90,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-90,ArraySize(low_history));
     }
   else
     {
      int index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      int index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   double interval_90 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);

//120日内位置
   if(ArraySize(high_history)>120)
     {
      index_max=ArrayMaximum(high_history,ArraySize(high_history)-120,ArraySize(high_history)); // 最高极值
      index_min=ArrayMinimum(low_history,ArraySize(low_history)-120,ArraySize(low_history));
     }
   else
     {
      int index_max=ArrayMaximum(high_history,0,ArraySize(high_history));
      int index_min=ArrayMinimum(low_history,0,ArraySize(low_history));  // 最低极值
     }

   double interval_120 = (close_ - low_history[index_min])/(high_history[index_max] - low_history[index_min]);


//--------------------------------------------


//---------------------------
//关口位置
   double valpass = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double pass5 = TypePass(MathFloor(valpass - MathFloor(valpass/5)*5),5);
   double pass10 = TypePass(MathFloor(valpass - MathFloor(valpass/10)*10),10);
   double pass100 = TypePass(MathFloor((valpass - MathFloor(valpass/100)*100)/10),10);
   double pass50 = TypePass(MathFloor((valpass - MathFloor(valpass/50)*50)/10),50);

   int num = 0;
   ArrayResize(Data, 1200);

   Data[num++] =volume;
   Data[num++] =atr5;
   Data[num++] =atr10;
   Data[num++] =atr5_change1;
   Data[num++] =atr5_change2;
   Data[num++] =atr5_change3;
   Data[num++] =atr5_change4;
   Data[num++] =atr5_change5;
   Data[num++] =atr5_change6;
   Data[num++] =atr5_change7;
   Data[num++] =atr5_change8;
   Data[num++] =atr5_change9;
   Data[num++] =atr5_change10;
   Data[num++] =atr5_current_change1;
   Data[num++] =atr5_current_change2;
   Data[num++] =atr5_current_change3;
   Data[num++] =atr5_current_change4;
   Data[num++] =atr5_current_change5;
   Data[num++] =atr5_current_change6;
   Data[num++] =atr5_current_change7;
   Data[num++] =atr5_current_change8;
   Data[num++] =atr5_current_change9;
   Data[num++] =atr5_current_change10;
   Data[num++] =atr10_change1;
   Data[num++] =atr10_change2;
   Data[num++] =atr10_change3;
   Data[num++] =atr10_change4;
   Data[num++] =atr10_change5;
   Data[num++] =atr10_change6;
   Data[num++] =atr10_change7;
   Data[num++] =atr10_change8;
   Data[num++] =atr10_change9;
   Data[num++] =atr10_change10;
   Data[num++] =atr10_current_change1;
   Data[num++] =atr10_current_change2;
   Data[num++] =atr10_current_change3;
   Data[num++] =atr10_current_change4;
   Data[num++] =atr10_current_change5;
   Data[num++] =atr10_current_change6;
   Data[num++] =atr10_current_change7;
   Data[num++] =atr10_current_change8;
   Data[num++] =atr10_current_change9;
   Data[num++] =atr10_current_change10;
   Data[num++] =macd;
   Data[num++] =macd_change1;
   Data[num++] =macd_change2;
   Data[num++] =macd_change3;
   Data[num++] =macd_change4;
   Data[num++] =macd_change5;
   Data[num++] =macd_change6;
   Data[num++] =macd_change7;
   Data[num++] =macd_change8;
   Data[num++] =macd_change9;
   Data[num++] =macd_change10;
   Data[num++] =macd_current_change1;
   Data[num++] =macd_current_change2;
   Data[num++] =macd_current_change3;
   Data[num++] =macd_current_change4;
   Data[num++] =macd_current_change5;
   Data[num++] =macd_current_change6;
   Data[num++] =macd_current_change7;
   Data[num++] =macd_current_change8;
   Data[num++] =macd_current_change9;
   Data[num++] =macd_current_change10;
   Data[num++] =sma5;
   Data[num++] =sma10;
   Data[num++] =sma5_change1;
   Data[num++] =sma5_change2;
   Data[num++] =sma5_change3;
   Data[num++] =sma5_change4;
   Data[num++] =sma5_change5;
   Data[num++] =sma5_change6;
   Data[num++] =sma5_change7;
   Data[num++] =sma5_change8;
   Data[num++] =sma5_change9;
   Data[num++] =sma5_change10;
   Data[num++] =sma5_current_change1;
   Data[num++] =sma5_current_change2;
   Data[num++] =sma5_current_change3;
   Data[num++] =sma5_current_change4;
   Data[num++] =sma5_current_change5;
   Data[num++] =sma5_current_change6;
   Data[num++] =sma5_current_change7;
   Data[num++] =sma5_current_change8;
   Data[num++] =sma5_current_change9;
   Data[num++] =sma5_current_change10;
   Data[num++] =sma10_change1;
   Data[num++] =sma10_change2;
   Data[num++] =sma10_change3;
   Data[num++] =sma10_change4;
   Data[num++] =sma10_change5;
   Data[num++] =sma10_change6;
   Data[num++] =sma10_change7;
   Data[num++] =sma10_change8;
   Data[num++] =sma10_change9;
   Data[num++] =sma10_change10;
   Data[num++] =sma10_current_change1;
   Data[num++] =sma10_current_change2;
   Data[num++] =sma10_current_change3;
   Data[num++] =sma10_current_change4;
   Data[num++] =sma10_current_change5;
   Data[num++] =sma10_current_change6;
   Data[num++] =sma10_current_change7;
   Data[num++] =sma10_current_change8;
   Data[num++] =sma10_current_change9;
   Data[num++] =sma10_current_change10;
   Data[num++] =ema5;
   Data[num++] =ema10;
   Data[num++] =ema5_change1;
   Data[num++] =ema5_change2;
   Data[num++] =ema5_change3;
   Data[num++] =ema5_change4;
   Data[num++] =ema5_change5;
   Data[num++] =ema5_change6;
   Data[num++] =ema5_change7;
   Data[num++] =ema5_change8;
   Data[num++] =ema5_change9;
   Data[num++] =ema5_change10;
   Data[num++] =ema5_current_change1;
   Data[num++] =ema5_current_change2;
   Data[num++] =ema5_current_change3;
   Data[num++] =ema5_current_change4;
   Data[num++] =ema5_current_change5;
   Data[num++] =ema5_current_change6;
   Data[num++] =ema5_current_change7;
   Data[num++] =ema5_current_change8;
   Data[num++] =ema5_current_change9;
   Data[num++] =ema5_current_change10;
   Data[num++] =ema10_change1;
   Data[num++] =ema10_change2;
   Data[num++] =ema10_change3;
   Data[num++] =ema10_change4;
   Data[num++] =ema10_change5;
   Data[num++] =ema10_change6;
   Data[num++] =ema10_change7;
   Data[num++] =ema10_change8;
   Data[num++] =ema10_change9;
   Data[num++] =ema10_change10;
   Data[num++] =ema10_current_change1;
   Data[num++] =ema10_current_change2;
   Data[num++] =ema10_current_change3;
   Data[num++] =ema10_current_change4;
   Data[num++] =ema10_current_change5;
   Data[num++] =ema10_current_change6;
   Data[num++] =ema10_current_change7;
   Data[num++] =ema10_current_change8;
   Data[num++] =ema10_current_change9;
   Data[num++] =ema10_current_change10;
   Data[num++] =smma5;
   Data[num++] =smma10;
   Data[num++] =smma5_change1;
   Data[num++] =smma5_change2;
   Data[num++] =smma5_change3;
   Data[num++] =smma5_change4;
   Data[num++] =smma5_change5;
   Data[num++] =smma5_change6;
   Data[num++] =smma5_change7;
   Data[num++] =smma5_change8;
   Data[num++] =smma5_change9;
   Data[num++] =smma5_change10;
   Data[num++] =smma5_current_change1;
   Data[num++] =smma5_current_change2;
   Data[num++] =smma5_current_change3;
   Data[num++] =smma5_current_change4;
   Data[num++] =smma5_current_change5;
   Data[num++] =smma5_current_change6;
   Data[num++] =smma5_current_change7;
   Data[num++] =smma5_current_change8;
   Data[num++] =smma5_current_change9;
   Data[num++] =smma5_current_change10;
   Data[num++] =smma10_change1;
   Data[num++] =smma10_change2;
   Data[num++] =smma10_change3;
   Data[num++] =smma10_change4;
   Data[num++] =smma10_change5;
   Data[num++] =smma10_change6;
   Data[num++] =smma10_change7;
   Data[num++] =smma10_change8;
   Data[num++] =smma10_change9;
   Data[num++] =smma10_change10;
   Data[num++] =smma10_current_change1;
   Data[num++] =smma10_current_change2;
   Data[num++] =smma10_current_change3;
   Data[num++] =smma10_current_change4;
   Data[num++] =smma10_current_change5;
   Data[num++] =smma10_current_change6;
   Data[num++] =smma10_current_change7;
   Data[num++] =smma10_current_change8;
   Data[num++] =smma10_current_change9;
   Data[num++] =smma10_current_change10;
   Data[num++] =lwma5;
   Data[num++] =lwma10;
   Data[num++] =lwma5_change1;
   Data[num++] =lwma5_change2;
   Data[num++] =lwma5_change3;
   Data[num++] =lwma5_change4;
   Data[num++] =lwma5_change5;
   Data[num++] =lwma5_change6;
   Data[num++] =lwma5_change7;
   Data[num++] =lwma5_change8;
   Data[num++] =lwma5_change9;
   Data[num++] =lwma5_change10;
   Data[num++] =lwma5_current_change1;
   Data[num++] =lwma5_current_change2;
   Data[num++] =lwma5_current_change3;
   Data[num++] =lwma5_current_change4;
   Data[num++] =lwma5_current_change5;
   Data[num++] =lwma5_current_change6;
   Data[num++] =lwma5_current_change7;
   Data[num++] =lwma5_current_change8;
   Data[num++] =lwma5_current_change9;
   Data[num++] =lwma5_current_change10;
   Data[num++] =lwma10_change1;
   Data[num++] =lwma10_change2;
   Data[num++] =lwma10_change3;
   Data[num++] =lwma10_change4;
   Data[num++] =lwma10_change5;
   Data[num++] =lwma10_change6;
   Data[num++] =lwma10_change7;
   Data[num++] =lwma10_change8;
   Data[num++] =lwma10_change9;
   Data[num++] =lwma10_change10;
   Data[num++] =lwma10_current_change1;
   Data[num++] =lwma10_current_change2;
   Data[num++] =lwma10_current_change3;
   Data[num++] =lwma10_current_change4;
   Data[num++] =lwma10_current_change5;
   Data[num++] =lwma10_current_change6;
   Data[num++] =lwma10_current_change7;
   Data[num++] =lwma10_current_change8;
   Data[num++] =lwma10_current_change9;
   Data[num++] =lwma10_current_change10;
   Data[num++] =rsi5;
   Data[num++] =rsi14;
   Data[num++] =rsi5_change1;
   Data[num++] =rsi5_change2;
   Data[num++] =rsi5_change3;
   Data[num++] =rsi5_change4;
   Data[num++] =rsi5_change5;
   Data[num++] =rsi5_change6;
   Data[num++] =rsi5_change7;
   Data[num++] =rsi5_change8;
   Data[num++] =rsi5_change9;
   Data[num++] =rsi5_change10;
   Data[num++] =rsi5_current_change1;
   Data[num++] =rsi5_current_change2;
   Data[num++] =rsi5_current_change3;
   Data[num++] =rsi5_current_change4;
   Data[num++] =rsi5_current_change5;
   Data[num++] =rsi5_current_change6;
   Data[num++] =rsi5_current_change7;
   Data[num++] =rsi5_current_change8;
   Data[num++] =rsi5_current_change9;
   Data[num++] =rsi5_current_change10;
   Data[num++] =rsi14_change1;
   Data[num++] =rsi14_change2;
   Data[num++] =rsi14_change3;
   Data[num++] =rsi14_change4;
   Data[num++] =rsi14_change5;
   Data[num++] =rsi14_change6;
   Data[num++] =rsi14_change7;
   Data[num++] =rsi14_change8;
   Data[num++] =rsi14_change9;
   Data[num++] =rsi14_change10;
   Data[num++] =rsi14_current_change1;
   Data[num++] =rsi14_current_change2;
   Data[num++] =rsi14_current_change3;
   Data[num++] =rsi14_current_change4;
   Data[num++] =rsi14_current_change5;
   Data[num++] =rsi14_current_change6;
   Data[num++] =rsi14_current_change7;
   Data[num++] =rsi14_current_change8;
   Data[num++] =rsi14_current_change9;
   Data[num++] =rsi14_current_change10;
   Data[num++] =sar;
   Data[num++] =sar_change1;
   Data[num++] =sar_change2;
   Data[num++] =sar_change3;
   Data[num++] =sar_change4;
   Data[num++] =sar_change5;
   Data[num++] =sar_change6;
   Data[num++] =sar_change7;
   Data[num++] =sar_change8;
   Data[num++] =sar_change9;
   Data[num++] =sar_change10;
   Data[num++] =sar_current_change1;
   Data[num++] =sar_current_change2;
   Data[num++] =sar_current_change3;
   Data[num++] =sar_current_change4;
   Data[num++] =sar_current_change5;
   Data[num++] =sar_current_change6;
   Data[num++] =sar_current_change7;
   Data[num++] =sar_current_change8;
   Data[num++] =sar_current_change9;
   Data[num++] =sar_current_change10;
   Data[num++] =adx;
   Data[num++] =adx_DI_plus;
   Data[num++] =adx_DI_minus;
   Data[num++] =adx_change1;
   Data[num++] =adx_change2;
   Data[num++] =adx_change3;
   Data[num++] =adx_change4;
   Data[num++] =adx_change5;
   Data[num++] =adx_change6;
   Data[num++] =adx_change7;
   Data[num++] =adx_change8;
   Data[num++] =adx_change9;
   Data[num++] =adx_change10;
   Data[num++] =adx_current_change1;
   Data[num++] =adx_current_change2;
   Data[num++] =adx_current_change3;
   Data[num++] =adx_current_change4;
   Data[num++] =adx_current_change5;
   Data[num++] =adx_current_change6;
   Data[num++] =adx_current_change7;
   Data[num++] =adx_current_change8;
   Data[num++] =adx_current_change9;
   Data[num++] =adx_current_change10;
   Data[num++] =cci;
   Data[num++] =cci_change1;
   Data[num++] =cci_change2;
   Data[num++] =cci_change3;
   Data[num++] =cci_change4;
   Data[num++] =cci_change5;
   Data[num++] =cci_change6;
   Data[num++] =cci_change7;
   Data[num++] =cci_change8;
   Data[num++] =cci_change9;
   Data[num++] =cci_change10;
   Data[num++] =cci_current_change1;
   Data[num++] =cci_current_change2;
   Data[num++] =cci_current_change3;
   Data[num++] =cci_current_change4;
   Data[num++] =cci_current_change5;
   Data[num++] =cci_current_change6;
   Data[num++] =cci_current_change7;
   Data[num++] =cci_current_change8;
   Data[num++] =cci_current_change9;
   Data[num++] =cci_current_change10;
   Data[num++] =slowk;
   Data[num++] =slowk_change1;
   Data[num++] =slowk_change2;
   Data[num++] =slowk_change3;
   Data[num++] =slowk_change4;
   Data[num++] =slowk_change5;
   Data[num++] =slowk_change6;
   Data[num++] =slowk_change7;
   Data[num++] =slowk_change8;
   Data[num++] =slowk_change9;
   Data[num++] =slowk_change10;
   Data[num++] =slowk_current_change1;
   Data[num++] =slowk_current_change2;
   Data[num++] =slowk_current_change3;
   Data[num++] =slowk_current_change4;
   Data[num++] =slowk_current_change5;
   Data[num++] =slowk_current_change6;
   Data[num++] =slowk_current_change7;
   Data[num++] =slowk_current_change8;
   Data[num++] =slowk_current_change9;
   Data[num++] =slowk_current_change10;
   Data[num++] =boll_upper_band;
   Data[num++] =boll_middle_band;
   Data[num++] =boll_lower_band;
   Data[num++] =boll_change1;
   Data[num++] =boll_change2;
   Data[num++] =boll_change3;
   Data[num++] =boll_change4;
   Data[num++] =boll_change5;
   Data[num++] =boll_change6;
   Data[num++] =boll_change7;
   Data[num++] =boll_change8;
   Data[num++] =boll_change9;
   Data[num++] =boll_change10;
   Data[num++] =boll_current_change1;
   Data[num++] =boll_current_change2;
   Data[num++] =boll_current_change3;
   Data[num++] =boll_current_change4;
   Data[num++] =boll_current_change5;
   Data[num++] =boll_current_change6;
   Data[num++] =boll_current_change7;
   Data[num++] =boll_current_change8;
   Data[num++] =boll_current_change9;
   Data[num++] =boll_current_change10;
   Data[num++] =ac_value;
   Data[num++] =ac_color;
   Data[num++] =ac_change1;
   Data[num++] =ac_change2;
   Data[num++] =ac_change3;
   Data[num++] =ac_change4;
   Data[num++] =ac_change5;
   Data[num++] =ac_change6;
   Data[num++] =ac_change7;
   Data[num++] =ac_change8;
   Data[num++] =ac_change9;
   Data[num++] =ac_change10;
   Data[num++] =ac_current_change1;
   Data[num++] =ac_current_change2;
   Data[num++] =ac_current_change3;
   Data[num++] =ac_current_change4;
   Data[num++] =ac_current_change5;
   Data[num++] =ac_current_change6;
   Data[num++] =ac_current_change7;
   Data[num++] =ac_current_change8;
   Data[num++] =ac_current_change9;
   Data[num++] =ac_current_change10;
   Data[num++] =ad;
   Data[num++] =ad_change1;
   Data[num++] =ad_change2;
   Data[num++] =ad_change3;
   Data[num++] =ad_change4;
   Data[num++] =ad_change5;
   Data[num++] =ad_change6;
   Data[num++] =ad_change7;
   Data[num++] =ad_change8;
   Data[num++] =ad_change9;
   Data[num++] =ad_change10;
   Data[num++] =ad_current_change1;
   Data[num++] =ad_current_change2;
   Data[num++] =ad_current_change3;
   Data[num++] =ad_current_change4;
   Data[num++] =ad_current_change5;
   Data[num++] =ad_current_change6;
   Data[num++] =ad_current_change7;
   Data[num++] =ad_current_change8;
   Data[num++] =ad_current_change9;
   Data[num++] =ad_current_change10;
   Data[num++] =adxWilder;
   Data[num++] =adxWilder_DI_plus;
   Data[num++] =adxWilder_DI_minus;
   Data[num++] =adxWilder_change1;
   Data[num++] =adxWilder_change2;
   Data[num++] =adxWilder_change3;
   Data[num++] =adxWilder_change4;
   Data[num++] =adxWilder_change5;
   Data[num++] =adxWilder_change6;
   Data[num++] =adxWilder_change7;
   Data[num++] =adxWilder_change8;
   Data[num++] =adxWilder_change9;
   Data[num++] =adxWilder_change10;
   Data[num++] =adxWilder_current_change1;
   Data[num++] =adxWilder_current_change2;
   Data[num++] =adxWilder_current_change3;
   Data[num++] =adxWilder_current_change4;
   Data[num++] =adxWilder_current_change5;
   Data[num++] =adxWilder_current_change6;
   Data[num++] =adxWilder_current_change7;
   Data[num++] =adxWilder_current_change8;
   Data[num++] =adxWilder_current_change9;
   Data[num++] =adxWilder_current_change10;
   Data[num++] =lips;
   Data[num++] =lips_change1;
   Data[num++] =lips_change2;
   Data[num++] =lips_change3;
   Data[num++] =lips_change4;
   Data[num++] =lips_change5;
   Data[num++] =lips_change6;
   Data[num++] =lips_change7;
   Data[num++] =lips_change8;
   Data[num++] =lips_change9;
   Data[num++] =lips_change10;
   Data[num++] =lips_current_change1;
   Data[num++] =lips_current_change2;
   Data[num++] =lips_current_change3;
   Data[num++] =lips_current_change4;
   Data[num++] =lips_current_change5;
   Data[num++] =lips_current_change6;
   Data[num++] =lips_current_change7;
   Data[num++] =lips_current_change8;
   Data[num++] =lips_current_change9;
   Data[num++] =lips_current_change10;
   Data[num++] =ama;
   Data[num++] =ama_change1;
   Data[num++] =ama_change2;
   Data[num++] =ama_change3;
   Data[num++] =ama_change4;
   Data[num++] =ama_change5;
   Data[num++] =ama_change6;
   Data[num++] =ama_change7;
   Data[num++] =ama_change8;
   Data[num++] =ama_change9;
   Data[num++] =ama_change10;
   Data[num++] =ama_current_change1;
   Data[num++] =ama_current_change2;
   Data[num++] =ama_current_change3;
   Data[num++] =ama_current_change4;
   Data[num++] =ama_current_change5;
   Data[num++] =ama_current_change6;
   Data[num++] =ama_current_change7;
   Data[num++] =ama_current_change8;
   Data[num++] =ama_current_change9;
   Data[num++] =ama_current_change10;
   Data[num++] =ao_value;
   Data[num++] =ao_color;
   Data[num++] =ao_change1;
   Data[num++] =ao_change2;
   Data[num++] =ao_change3;
   Data[num++] =ao_change4;
   Data[num++] =ao_change5;
   Data[num++] =ao_change6;
   Data[num++] =ao_change7;
   Data[num++] =ao_change8;
   Data[num++] =ao_change9;
   Data[num++] =ao_change10;
   Data[num++] =ao_current_change1;
   Data[num++] =ao_current_change2;
   Data[num++] =ao_current_change3;
   Data[num++] =ao_current_change4;
   Data[num++] =ao_current_change5;
   Data[num++] =ao_current_change6;
   Data[num++] =ao_current_change7;
   Data[num++] =ao_current_change8;
   Data[num++] =ao_current_change9;
   Data[num++] =ao_current_change10;
   Data[num++] =bears_change1;
   Data[num++] =bears_change2;
   Data[num++] =bears_change3;
   Data[num++] =bears_change4;
   Data[num++] =bears_change5;
   Data[num++] =bears_change6;
   Data[num++] =bears_change7;
   Data[num++] =bears_change8;
   Data[num++] =bears_change9;
   Data[num++] =bears_change10;
   Data[num++] =bears_current_change1;
   Data[num++] =bears_current_change2;
   Data[num++] =bears_current_change3;
   Data[num++] =bears_current_change4;
   Data[num++] =bears_current_change5;
   Data[num++] =bears_current_change6;
   Data[num++] =bears_current_change7;
   Data[num++] =bears_current_change8;
   Data[num++] =bears_current_change9;
   Data[num++] =bears_current_change10;
   Data[num++] =bulls_change1;
   Data[num++] =bulls_change2;
   Data[num++] =bulls_change3;
   Data[num++] =bulls_change4;
   Data[num++] =bulls_change5;
   Data[num++] =bulls_change6;
   Data[num++] =bulls_change7;
   Data[num++] =bulls_change8;
   Data[num++] =bulls_change9;
   Data[num++] =bulls_change10;
   Data[num++] =bulls_current_change1;
   Data[num++] =bulls_current_change2;
   Data[num++] =bulls_current_change3;
   Data[num++] =bulls_current_change4;
   Data[num++] =bulls_current_change5;
   Data[num++] =bulls_current_change6;
   Data[num++] =bulls_current_change7;
   Data[num++] =bulls_current_change8;
   Data[num++] =bulls_current_change9;
   Data[num++] =bulls_current_change10;
   Data[num++] =chaikin;
   Data[num++] =chaikin_change1;
   Data[num++] =chaikin_change2;
   Data[num++] =chaikin_change3;
   Data[num++] =chaikin_change4;
   Data[num++] =chaikin_change5;
   Data[num++] =chaikin_change6;
   Data[num++] =chaikin_change7;
   Data[num++] =chaikin_change8;
   Data[num++] =chaikin_change9;
   Data[num++] =chaikin_change10;
   Data[num++] =chaikin_current_change1;
   Data[num++] =chaikin_current_change2;
   Data[num++] =chaikin_current_change3;
   Data[num++] =chaikin_current_change4;
   Data[num++] =chaikin_current_change5;
   Data[num++] =chaikin_current_change6;
   Data[num++] =chaikin_current_change7;
   Data[num++] =chaikin_current_change8;
   Data[num++] =chaikin_current_change9;
   Data[num++] =chaikin_current_change10;
   Data[num++] =dema;
   Data[num++] =dema_change1;
   Data[num++] =dema_change2;
   Data[num++] =dema_change3;
   Data[num++] =dema_change4;
   Data[num++] =dema_change5;
   Data[num++] =dema_change6;
   Data[num++] =dema_change7;
   Data[num++] =dema_change8;
   Data[num++] =dema_change9;
   Data[num++] =dema_change10;
   Data[num++] =dema_current_change1;
   Data[num++] =dema_current_change2;
   Data[num++] =dema_current_change3;
   Data[num++] =dema_current_change4;
   Data[num++] =dema_current_change5;
   Data[num++] =dema_current_change6;
   Data[num++] =dema_current_change7;
   Data[num++] =dema_current_change8;
   Data[num++] =dema_current_change9;
   Data[num++] =dema_current_change10;
   Data[num++] =deMarker;
   Data[num++] =deMarker_change1;
   Data[num++] =deMarker_change2;
   Data[num++] =deMarker_change3;
   Data[num++] =deMarker_change4;
   Data[num++] =deMarker_change5;
   Data[num++] =deMarker_change6;
   Data[num++] =deMarker_change7;
   Data[num++] =deMarker_change8;
   Data[num++] =deMarker_change9;
   Data[num++] =deMarker_change10;
   Data[num++] =deMarker_current_change1;
   Data[num++] =deMarker_current_change2;
   Data[num++] =deMarker_current_change3;
   Data[num++] =deMarker_current_change4;
   Data[num++] =deMarker_current_change5;
   Data[num++] =deMarker_current_change6;
   Data[num++] =deMarker_current_change7;
   Data[num++] =deMarker_current_change8;
   Data[num++] =deMarker_current_change9;
   Data[num++] =deMarker_current_change10;
   Data[num++] =force;
   Data[num++] =force_change1;
   Data[num++] =force_change2;
   Data[num++] =force_change3;
   Data[num++] =force_change4;
   Data[num++] =force_change5;
   Data[num++] =force_change6;
   Data[num++] =force_change7;
   Data[num++] =force_change8;
   Data[num++] =force_change9;
   Data[num++] =force_change10;
   Data[num++] =force_current_change1;
   Data[num++] =force_current_change2;
   Data[num++] =force_current_change3;
   Data[num++] =force_current_change4;
   Data[num++] =force_current_change5;
   Data[num++] =force_current_change6;
   Data[num++] =force_current_change7;
   Data[num++] =force_current_change8;
   Data[num++] =force_current_change9;
   Data[num++] =force_current_change10;
   Data[num++] =frAMA;
   Data[num++] =frAMA_change1;
   Data[num++] =frAMA_change2;
   Data[num++] =frAMA_change3;
   Data[num++] =frAMA_change4;
   Data[num++] =frAMA_change5;
   Data[num++] =frAMA_change6;
   Data[num++] =frAMA_change7;
   Data[num++] =frAMA_change8;
   Data[num++] =frAMA_change9;
   Data[num++] =frAMA_change10;
   Data[num++] =frAMA_current_change1;
   Data[num++] =frAMA_current_change2;
   Data[num++] =frAMA_current_change3;
   Data[num++] =frAMA_current_change4;
   Data[num++] =frAMA_current_change5;
   Data[num++] =frAMA_current_change6;
   Data[num++] =frAMA_current_change7;
   Data[num++] =frAMA_current_change8;
   Data[num++] =frAMA_current_change9;
   Data[num++] =frAMA_current_change10;
   Data[num++] =bwmfi_value;
   Data[num++] =bwmfi_color;
   Data[num++] =bwmfi_change1;
   Data[num++] =bwmfi_change2;
   Data[num++] =bwmfi_change3;
   Data[num++] =bwmfi_change4;
   Data[num++] =bwmfi_change5;
   Data[num++] =bwmfi_change6;
   Data[num++] =bwmfi_change7;
   Data[num++] =bwmfi_change8;
   Data[num++] =bwmfi_change9;
   Data[num++] =bwmfi_change10;
   Data[num++] =bwmfi_current_change1;
   Data[num++] =bwmfi_current_change2;
   Data[num++] =bwmfi_current_change3;
   Data[num++] =bwmfi_current_change4;
   Data[num++] =bwmfi_current_change5;
   Data[num++] =bwmfi_current_change6;
   Data[num++] =bwmfi_current_change7;
   Data[num++] =bwmfi_current_change8;
   Data[num++] =bwmfi_current_change9;
   Data[num++] =bwmfi_current_change10;
   Data[num++] =momentum;
   Data[num++] =momentum_change1;
   Data[num++] =momentum_change2;
   Data[num++] =momentum_change3;
   Data[num++] =momentum_change4;
   Data[num++] =momentum_change5;
   Data[num++] =momentum_change6;
   Data[num++] =momentum_change7;
   Data[num++] =momentum_change8;
   Data[num++] =momentum_change9;
   Data[num++] =momentum_change10;
   Data[num++] =momentum_current_change1;
   Data[num++] =momentum_current_change2;
   Data[num++] =momentum_current_change3;
   Data[num++] =momentum_current_change4;
   Data[num++] =momentum_current_change5;
   Data[num++] =momentum_current_change6;
   Data[num++] =momentum_current_change7;
   Data[num++] =momentum_current_change8;
   Data[num++] =momentum_current_change9;
   Data[num++] =momentum_current_change10;
   Data[num++] =mfi;
   Data[num++] =mfi_change1;
   Data[num++] =mfi_change2;
   Data[num++] =mfi_change3;
   Data[num++] =mfi_change4;
   Data[num++] =mfi_change5;
   Data[num++] =mfi_change6;
   Data[num++] =mfi_change7;
   Data[num++] =mfi_change8;
   Data[num++] =mfi_change9;
   Data[num++] =mfi_change10;
   Data[num++] =mfi_current_change1;
   Data[num++] =mfi_current_change2;
   Data[num++] =mfi_current_change3;
   Data[num++] =mfi_current_change4;
   Data[num++] =mfi_current_change5;
   Data[num++] =mfi_current_change6;
   Data[num++] =mfi_current_change7;
   Data[num++] =mfi_current_change8;
   Data[num++] =mfi_current_change9;
   Data[num++] =mfi_current_change10;
   Data[num++] =osMA;
   Data[num++] =osMA_change1;
   Data[num++] =osMA_change2;
   Data[num++] =osMA_change3;
   Data[num++] =osMA_change4;
   Data[num++] =osMA_change5;
   Data[num++] =osMA_change6;
   Data[num++] =osMA_change7;
   Data[num++] =osMA_change8;
   Data[num++] =osMA_change9;
   Data[num++] =osMA_change10;
   Data[num++] =osMA_current_change1;
   Data[num++] =osMA_current_change2;
   Data[num++] =osMA_current_change3;
   Data[num++] =osMA_current_change4;
   Data[num++] =osMA_current_change5;
   Data[num++] =osMA_current_change6;
   Data[num++] =osMA_current_change7;
   Data[num++] =osMA_current_change8;
   Data[num++] =osMA_current_change9;
   Data[num++] =osMA_current_change10;
   Data[num++] =obv;
   Data[num++] =obv_change1;
   Data[num++] =obv_change2;
   Data[num++] =obv_change3;
   Data[num++] =obv_change4;
   Data[num++] =obv_change5;
   Data[num++] =obv_change6;
   Data[num++] =obv_change7;
   Data[num++] =obv_change8;
   Data[num++] =obv_change9;
   Data[num++] =obv_change10;
   Data[num++] =obv_current_change1;
   Data[num++] =obv_current_change2;
   Data[num++] =obv_current_change3;
   Data[num++] =obv_current_change4;
   Data[num++] =obv_current_change5;
   Data[num++] =obv_current_change6;
   Data[num++] =obv_current_change7;
   Data[num++] =obv_current_change8;
   Data[num++] =obv_current_change9;
   Data[num++] =obv_current_change10;
   Data[num++] =rvi;
   Data[num++] =rvi_signal;
   Data[num++] =rvi_change1;
   Data[num++] =rvi_change2;
   Data[num++] =rvi_change3;
   Data[num++] =rvi_change4;
   Data[num++] =rvi_change5;
   Data[num++] =rvi_change6;
   Data[num++] =rvi_change7;
   Data[num++] =rvi_change8;
   Data[num++] =rvi_change9;
   Data[num++] =rvi_change10;
   Data[num++] =rvi_current_change1;
   Data[num++] =rvi_current_change2;
   Data[num++] =rvi_current_change3;
   Data[num++] =rvi_current_change4;
   Data[num++] =rvi_current_change5;
   Data[num++] =rvi_current_change6;
   Data[num++] =rvi_current_change7;
   Data[num++] =rvi_current_change8;
   Data[num++] =rvi_current_change9;
   Data[num++] =rvi_current_change10;
   Data[num++] =stdDev;
   Data[num++] =stdDev_change1;
   Data[num++] =stdDev_change2;
   Data[num++] =stdDev_change3;
   Data[num++] =stdDev_change4;
   Data[num++] =stdDev_change5;
   Data[num++] =stdDev_change6;
   Data[num++] =stdDev_change7;
   Data[num++] =stdDev_change8;
   Data[num++] =stdDev_change9;
   Data[num++] =stdDev_change10;
   Data[num++] =stdDev_current_change1;
   Data[num++] =stdDev_current_change2;
   Data[num++] =stdDev_current_change3;
   Data[num++] =stdDev_current_change4;
   Data[num++] =stdDev_current_change5;
   Data[num++] =stdDev_current_change6;
   Data[num++] =stdDev_current_change7;
   Data[num++] =stdDev_current_change8;
   Data[num++] =stdDev_current_change9;
   Data[num++] =stdDev_current_change10;
   Data[num++] =tema;
   Data[num++] =tema_change1;
   Data[num++] =tema_change2;
   Data[num++] =tema_change3;
   Data[num++] =tema_change4;
   Data[num++] =tema_change5;
   Data[num++] =tema_change6;
   Data[num++] =tema_change7;
   Data[num++] =tema_change8;
   Data[num++] =tema_change9;
   Data[num++] =tema_change10;
   Data[num++] =tema_current_change1;
   Data[num++] =tema_current_change2;
   Data[num++] =tema_current_change3;
   Data[num++] =tema_current_change4;
   Data[num++] =tema_current_change5;
   Data[num++] =tema_current_change6;
   Data[num++] =tema_current_change7;
   Data[num++] =tema_current_change8;
   Data[num++] =tema_current_change9;
   Data[num++] =tema_current_change10;
   Data[num++] =triX;
   Data[num++] =triX_change1;
   Data[num++] =triX_change2;
   Data[num++] =triX_change3;
   Data[num++] =triX_change4;
   Data[num++] =triX_change5;
   Data[num++] =triX_change6;
   Data[num++] =triX_change7;
   Data[num++] =triX_change8;
   Data[num++] =triX_change9;
   Data[num++] =triX_change10;
   Data[num++] =triX_current_change1;
   Data[num++] =triX_current_change2;
   Data[num++] =triX_current_change3;
   Data[num++] =triX_current_change4;
   Data[num++] =triX_current_change5;
   Data[num++] =triX_current_change6;
   Data[num++] =triX_current_change7;
   Data[num++] =triX_current_change8;
   Data[num++] =triX_current_change9;
   Data[num++] =triX_current_change10;
   Data[num++] =wpr;
   Data[num++] =wpr_change1;
   Data[num++] =wpr_change2;
   Data[num++] =wpr_change3;
   Data[num++] =wpr_change4;
   Data[num++] =wpr_change5;
   Data[num++] =wpr_change6;
   Data[num++] =wpr_change7;
   Data[num++] =wpr_change8;
   Data[num++] =wpr_change9;
   Data[num++] =wpr_change10;
   Data[num++] =wpr_current_change1;
   Data[num++] =wpr_current_change2;
   Data[num++] =wpr_current_change3;
   Data[num++] =wpr_current_change4;
   Data[num++] =wpr_current_change5;
   Data[num++] =wpr_current_change6;
   Data[num++] =wpr_current_change7;
   Data[num++] =wpr_current_change8;
   Data[num++] =wpr_current_change9;
   Data[num++] =wpr_current_change10;
   Data[num++] =vidya;
   Data[num++] =vidya_change1;
   Data[num++] =vidya_change2;
   Data[num++] =vidya_change3;
   Data[num++] =vidya_change4;
   Data[num++] =vidya_change5;
   Data[num++] =vidya_change6;
   Data[num++] =vidya_change7;
   Data[num++] =vidya_change8;
   Data[num++] =vidya_change9;
   Data[num++] =vidya_change10;
   Data[num++] =vidya_current_change1;
   Data[num++] =vidya_current_change2;
   Data[num++] =vidya_current_change3;
   Data[num++] =vidya_current_change4;
   Data[num++] =vidya_current_change5;
   Data[num++] =vidya_current_change6;
   Data[num++] =vidya_current_change7;
   Data[num++] =vidya_current_change8;
   Data[num++] =vidya_current_change9;
   Data[num++] =vidya_current_change10;
   Data[num++] =macd_type;
   Data[num++] =sar_type;
   Data[num++] =adx_type;
   Data[num++] =cci_type;
   Data[num++] =boll_type;
   Data[num++] =ac_type;
   Data[num++] =ad_type;
   Data[num++] =adxWilder_type;
   Data[num++] =ama_type;
   Data[num++] =ao_type;
   Data[num++] =chaikin_type;
   Data[num++] =dema_type;
   Data[num++] =deMarker_type;
   Data[num++] =force_type;
   Data[num++] =frAMA_type;
   Data[num++] =bwmfi_type;
   Data[num++] =momentum_type;
   Data[num++] =mfi_type;
   Data[num++] =osMA_type;
   Data[num++] =obv_type;
   Data[num++] =rvi_type;
   Data[num++] =stdDev_type;
   Data[num++] =tema_type;
   Data[num++] =triX_type;
   Data[num++] =wpr_type;
   Data[num++] =vidya_type;
   Data[num++] =atr5_changeValue1;
   Data[num++] =atr5_changeValue2;
   Data[num++] =atr5_changeValue3;
   Data[num++] =atr5_changeValue4;
   Data[num++] =atr5_changeValue5;
   Data[num++] =atr5_changeValue6;
   Data[num++] =atr5_changeValue7;
   Data[num++] =atr5_changeValue8;
   Data[num++] =atr5_changeValue9;
   Data[num++] =atr5_changeValue10;
   Data[num++] =atr10_changeValue1;
   Data[num++] =atr10_changeValue2;
   Data[num++] =atr10_changeValue3;
   Data[num++] =atr10_changeValue4;
   Data[num++] =atr10_changeValue5;
   Data[num++] =atr10_changeValue6;
   Data[num++] =atr10_changeValue7;
   Data[num++] =atr10_changeValue8;
   Data[num++] =atr10_changeValue9;
   Data[num++] =atr10_changeValue10;
   Data[num++] =macd_changeValue1;
   Data[num++] =macd_changeValue2;
   Data[num++] =macd_changeValue3;
   Data[num++] =macd_changeValue4;
   Data[num++] =macd_changeValue5;
   Data[num++] =macd_changeValue6;
   Data[num++] =macd_changeValue7;
   Data[num++] =macd_changeValue8;
   Data[num++] =macd_changeValue9;
   Data[num++] =macd_changeValue10;
   Data[num++] =sma5_changeValue1;
   Data[num++] =sma5_changeValue2;
   Data[num++] =sma5_changeValue3;
   Data[num++] =sma5_changeValue4;
   Data[num++] =sma5_changeValue5;
   Data[num++] =sma5_changeValue6;
   Data[num++] =sma5_changeValue7;
   Data[num++] =sma5_changeValue8;
   Data[num++] =sma5_changeValue9;
   Data[num++] =sma5_changeValue10;
   Data[num++] =sma10_changeValue1;
   Data[num++] =sma10_changeValue2;
   Data[num++] =sma10_changeValue3;
   Data[num++] =sma10_changeValue4;
   Data[num++] =sma10_changeValue5;
   Data[num++] =sma10_changeValue6;
   Data[num++] =sma10_changeValue7;
   Data[num++] =sma10_changeValue8;
   Data[num++] =sma10_changeValue9;
   Data[num++] =sma10_changeValue10;
   Data[num++] =rsi5_changeValue1;
   Data[num++] =rsi5_changeValue2;
   Data[num++] =rsi5_changeValue3;
   Data[num++] =rsi5_changeValue4;
   Data[num++] =rsi5_changeValue5;
   Data[num++] =rsi5_changeValue6;
   Data[num++] =rsi5_changeValue7;
   Data[num++] =rsi5_changeValue8;
   Data[num++] =rsi5_changeValue9;
   Data[num++] =rsi5_changeValue10;
   Data[num++] =rsi14_changeValue1;
   Data[num++] =rsi14_changeValue2;
   Data[num++] =rsi14_changeValue3;
   Data[num++] =rsi14_changeValue4;
   Data[num++] =rsi14_changeValue5;
   Data[num++] =rsi14_changeValue6;
   Data[num++] =rsi14_changeValue7;
   Data[num++] =rsi14_changeValue8;
   Data[num++] =rsi14_changeValue9;
   Data[num++] =rsi14_changeValue10;
   Data[num++] =sar_changeValue1;
   Data[num++] =sar_changeValue2;
   Data[num++] =sar_changeValue3;
   Data[num++] =sar_changeValue4;
   Data[num++] =sar_changeValue5;
   Data[num++] =sar_changeValue6;
   Data[num++] =sar_changeValue7;
   Data[num++] =sar_changeValue8;
   Data[num++] =sar_changeValue9;
   Data[num++] =sar_changeValue10;
   Data[num++] =adx_changeValue1;
   Data[num++] =adx_changeValue2;
   Data[num++] =adx_changeValue3;
   Data[num++] =adx_changeValue4;
   Data[num++] =adx_changeValue5;
   Data[num++] =adx_changeValue6;
   Data[num++] =adx_changeValue7;
   Data[num++] =adx_changeValue8;
   Data[num++] =adx_changeValue9;
   Data[num++] =adx_changeValue10;
   Data[num++] =cci_changeValue1;
   Data[num++] =cci_changeValue2;
   Data[num++] =cci_changeValue3;
   Data[num++] =cci_changeValue4;
   Data[num++] =cci_changeValue5;
   Data[num++] =cci_changeValue6;
   Data[num++] =cci_changeValue7;
   Data[num++] =cci_changeValue8;
   Data[num++] =cci_changeValue9;
   Data[num++] =cci_changeValue10;
   Data[num++] =slowk_changeValue1;
   Data[num++] =slowk_changeValue2;
   Data[num++] =slowk_changeValue3;
   Data[num++] =slowk_changeValue4;
   Data[num++] =slowk_changeValue5;
   Data[num++] =slowk_changeValue6;
   Data[num++] =slowk_changeValue7;
   Data[num++] =slowk_changeValue8;
   Data[num++] =slowk_changeValue9;
   Data[num++] =slowk_changeValue10;
   Data[num++] =ac_changeValue1;
   Data[num++] =ac_changeValue2;
   Data[num++] =ac_changeValue3;
   Data[num++] =ac_changeValue4;
   Data[num++] =ac_changeValue5;
   Data[num++] =ac_changeValue6;
   Data[num++] =ac_changeValue7;
   Data[num++] =ac_changeValue8;
   Data[num++] =ac_changeValue9;
   Data[num++] =ac_changeValue10;
   Data[num++] =adxWilder_changeValue1;
   Data[num++] =adxWilder_changeValue2;
   Data[num++] =adxWilder_changeValue3;
   Data[num++] =adxWilder_changeValue4;
   Data[num++] =adxWilder_changeValue5;
   Data[num++] =adxWilder_changeValue6;
   Data[num++] =adxWilder_changeValue7;
   Data[num++] =adxWilder_changeValue8;
   Data[num++] =adxWilder_changeValue9;
   Data[num++] =adxWilder_changeValue10;
   Data[num++] =lips_changeValue1;
   Data[num++] =lips_changeValue2;
   Data[num++] =lips_changeValue3;
   Data[num++] =lips_changeValue4;
   Data[num++] =lips_changeValue5;
   Data[num++] =lips_changeValue6;
   Data[num++] =lips_changeValue7;
   Data[num++] =lips_changeValue8;
   Data[num++] =lips_changeValue9;
   Data[num++] =lips_changeValue10;
   Data[num++] =ama_changeValue1;
   Data[num++] =ama_changeValue2;
   Data[num++] =ama_changeValue3;
   Data[num++] =ama_changeValue4;
   Data[num++] =ama_changeValue5;
   Data[num++] =ama_changeValue6;
   Data[num++] =ama_changeValue7;
   Data[num++] =ama_changeValue8;
   Data[num++] =ama_changeValue9;
   Data[num++] =ama_changeValue10;
   Data[num++] =ao_changeValue1;
   Data[num++] =ao_changeValue2;
   Data[num++] =ao_changeValue3;
   Data[num++] =ao_changeValue4;
   Data[num++] =ao_changeValue5;
   Data[num++] =ao_changeValue6;
   Data[num++] =ao_changeValue7;
   Data[num++] =ao_changeValue8;
   Data[num++] =ao_changeValue9;
   Data[num++] =ao_changeValue10;
   Data[num++] =bears_changeValue1;
   Data[num++] =bears_changeValue2;
   Data[num++] =bears_changeValue3;
   Data[num++] =bears_changeValue4;
   Data[num++] =bears_changeValue5;
   Data[num++] =bears_changeValue6;
   Data[num++] =bears_changeValue7;
   Data[num++] =bears_changeValue8;
   Data[num++] =bears_changeValue9;
   Data[num++] =bears_changeValue10;
   Data[num++] =bulls_changeValue1;
   Data[num++] =bulls_changeValue2;
   Data[num++] =bulls_changeValue3;
   Data[num++] =bulls_changeValue4;
   Data[num++] =bulls_changeValue5;
   Data[num++] =bulls_changeValue6;
   Data[num++] =bulls_changeValue7;
   Data[num++] =bulls_changeValue8;
   Data[num++] =bulls_changeValue9;
   Data[num++] =bulls_changeValue10;
   Data[num++] =chaikin_changeValue1;
   Data[num++] =chaikin_changeValue2;
   Data[num++] =chaikin_changeValue3;
   Data[num++] =chaikin_changeValue4;
   Data[num++] =chaikin_changeValue5;
   Data[num++] =chaikin_changeValue6;
   Data[num++] =chaikin_changeValue7;
   Data[num++] =chaikin_changeValue8;
   Data[num++] =chaikin_changeValue9;
   Data[num++] =chaikin_changeValue10;
   Data[num++] =deMarker_changeValue1;
   Data[num++] =deMarker_changeValue2;
   Data[num++] =deMarker_changeValue3;
   Data[num++] =deMarker_changeValue4;
   Data[num++] =deMarker_changeValue5;
   Data[num++] =deMarker_changeValue6;
   Data[num++] =deMarker_changeValue7;
   Data[num++] =deMarker_changeValue8;
   Data[num++] =deMarker_changeValue9;
   Data[num++] =deMarker_changeValue10;
   Data[num++] =force_changeValue1;
   Data[num++] =force_changeValue2;
   Data[num++] =force_changeValue3;
   Data[num++] =force_changeValue4;
   Data[num++] =force_changeValue5;
   Data[num++] =force_changeValue6;
   Data[num++] =force_changeValue7;
   Data[num++] =force_changeValue8;
   Data[num++] =force_changeValue9;
   Data[num++] =force_changeValue10;
   Data[num++] =bwmfi_changeValue1;
   Data[num++] =bwmfi_changeValue2;
   Data[num++] =bwmfi_changeValue3;
   Data[num++] =bwmfi_changeValue4;
   Data[num++] =bwmfi_changeValue5;
   Data[num++] =bwmfi_changeValue6;
   Data[num++] =bwmfi_changeValue7;
   Data[num++] =bwmfi_changeValue8;
   Data[num++] =bwmfi_changeValue9;
   Data[num++] =bwmfi_changeValue10;
   Data[num++] =momentum_changeValue1;
   Data[num++] =momentum_changeValue2;
   Data[num++] =momentum_changeValue3;
   Data[num++] =momentum_changeValue4;
   Data[num++] =momentum_changeValue5;
   Data[num++] =momentum_changeValue6;
   Data[num++] =momentum_changeValue7;
   Data[num++] =momentum_changeValue8;
   Data[num++] =momentum_changeValue9;
   Data[num++] =momentum_changeValue10;
   Data[num++] =mfi_changeValue1;
   Data[num++] =mfi_changeValue2;
   Data[num++] =mfi_changeValue3;
   Data[num++] =mfi_changeValue4;
   Data[num++] =mfi_changeValue5;
   Data[num++] =mfi_changeValue6;
   Data[num++] =mfi_changeValue7;
   Data[num++] =mfi_changeValue8;
   Data[num++] =mfi_changeValue9;
   Data[num++] =mfi_changeValue10;
   Data[num++] =osMA_changeValue1;
   Data[num++] =osMA_changeValue2;
   Data[num++] =osMA_changeValue3;
   Data[num++] =osMA_changeValue4;
   Data[num++] =osMA_changeValue5;
   Data[num++] =osMA_changeValue6;
   Data[num++] =osMA_changeValue7;
   Data[num++] =osMA_changeValue8;
   Data[num++] =osMA_changeValue9;
   Data[num++] =osMA_changeValue10;
   Data[num++] =rvi_changeValue1;
   Data[num++] =rvi_changeValue2;
   Data[num++] =rvi_changeValue3;
   Data[num++] =rvi_changeValue4;
   Data[num++] =rvi_changeValue5;
   Data[num++] =rvi_changeValue6;
   Data[num++] =rvi_changeValue7;
   Data[num++] =rvi_changeValue8;
   Data[num++] =rvi_changeValue9;
   Data[num++] =rvi_changeValue10;
   Data[num++] =stdDev_changeValue1;
   Data[num++] =stdDev_changeValue2;
   Data[num++] =stdDev_changeValue3;
   Data[num++] =stdDev_changeValue4;
   Data[num++] =stdDev_changeValue5;
   Data[num++] =stdDev_changeValue6;
   Data[num++] =stdDev_changeValue7;
   Data[num++] =stdDev_changeValue8;
   Data[num++] =stdDev_changeValue9;
   Data[num++] =stdDev_changeValue10;
   Data[num++] =wpr_changeValue1;
   Data[num++] =wpr_changeValue2;
   Data[num++] =wpr_changeValue3;
   Data[num++] =wpr_changeValue4;
   Data[num++] =wpr_changeValue5;
   Data[num++] =wpr_changeValue6;
   Data[num++] =wpr_changeValue7;
   Data[num++] =wpr_changeValue8;
   Data[num++] =wpr_changeValue9;
   Data[num++] =wpr_changeValue10;
   Data[num++] =interval_10;
   Data[num++] =interval_20;
   Data[num++] =interval_30;

   Print("curr ArraySize(Data)     ",ArraySize(Data));
//ArrayPrint(KData);
//Print("ArraySize(KData)     ",ArraySize(KData));
  }
//+------------------------------------------------------------------+
