//+------------------------------------------------------------------+
//|                                            TechnicalIndexAll.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                     ATR                                          |
//|            string           symbol,        // 交易品种名称       |
//|            ENUM_TIMEFRAMES  period,        // 周期               |
//|            int              ma_period      // 平均周期           |
//+------------------------------------------------------------------+
bool ATR(double &data[],string symbol,ENUM_TIMEFRAMES period,int i_period,int count)
  {
   ResetLastError();
   int index_handle=iATR(symbol,period,i_period);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }
//+------------------------------------------------------------------+
//|                     MACD                                         |
//|   string              symbol,             // 交易品种名称        |
//|   ENUM_TIMEFRAMES     period,             // 周期                |
//|   int                 fast_ema_period,    // 快速移动平均数周期  |
//|   int                 slow_ema_period,    // 慢速移动平均数周期  |
//|   int                 signal_period,      // 不同点的平均周期    |
//|   ENUM_APPLIED_PRICE  applied_price       // 价格或者处理器的类型|            
//+------------------------------------------------------------------+
bool MACD(double &data[],string symbol,ENUM_TIMEFRAMES period,int fast_ema_period,int slow_ema_period,int signal_period,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iMACD(symbol,period,fast_ema_period,slow_ema_period,signal_period,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//+------------------------------------------------------------------+
//|                     MA                                           |
//|   string               symbol,            // 交易品种名称        |
//|   ENUM_TIMEFRAMES      period,            // 周期                |
//|   int                  ma_period,         // 平均周期            |
//|   int                  ma_shift,          // 平移                |
//|   ENUM_MA_METHOD       ma_method,         // 平滑类型            |
//|   ENUM_APPLIED_PRICE   applied_price      // 价格或者处理程序类型|            
//+------------------------------------------------------------------+
bool MA(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iMA(symbol,period,ma_period,ma_shift,ma_method,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//RSI------------------------------------------------------------------
bool RSI(double &data[],string symbol,ENUM_TIMEFRAMES period,int RSIperiod,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int  index_handle=iRSI(symbol,period,RSIperiod,PRICE_CLOSE);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//SAR------------------------------------------------------------------
bool SAR(double &data[],string symbol,ENUM_TIMEFRAMES period,double step,double maximum,int count)
  {
   ResetLastError();
   int index_handle=iSAR(symbol,period,step,maximum);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//ADX------------------------------------------------------------------
bool ADX(double &ADXBuffer[],double &DI_plusBuffer[],double &DI_minusBuffer[],string symbol,ENUM_TIMEFRAMES period,int adx_period,int count)
  {
   ResetLastError();
   int index_handle=iADX(symbol,period,adx_period);
   
   ArraySetAsSeries(ADXBuffer,true);
   CopyBuffer(index_handle,0,0,count,ADXBuffer);

   ArraySetAsSeries(DI_plusBuffer,true);
   CopyBuffer(index_handle,1,0,count,DI_plusBuffer);

   ArraySetAsSeries(DI_minusBuffer,true);
   CopyBuffer(index_handle,2,0,count,DI_minusBuffer);

   return true;
  }

//CCI------------------------------------------------------------------
bool CCI(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iCCI(symbol,period,ma_period,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }


//STOCH------------------------------------------------------------------
bool STOCH(double &data1[],double &data2[],string symbol,ENUM_TIMEFRAMES period,int Kperiod,int Dperiod,int slowing,ENUM_MA_METHOD  ma_method,ENUM_STO_PRICE price_field,int count)
  {
   ResetLastError();
   int index_handle=iStochastic(symbol,period,Kperiod,Dperiod,slowing,ma_method,price_field);

   ArraySetAsSeries(data1,true);
   CopyBuffer(index_handle,MAIN_LINE,0,count,data1);

   ArraySetAsSeries(data2,true);
   CopyBuffer(index_handle,SIGNAL_LINE,0,count,data2);
   
   return true;
  }

//BOLL Bands------------------------------------------------------------------
bool Bands(double &base_values[],double &upper_values[],double &lower_values[],string symbol,ENUM_TIMEFRAMES period,int bands_period,int bands_shift,double deviation,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iBands(symbol,period,bands_period,bands_shift,deviation,applied_price);
   
   ArraySetAsSeries(base_values,true);
   CopyBuffer(index_handle,0,0,count,base_values);

   ArraySetAsSeries(upper_values,true);
   CopyBuffer(index_handle,1,0,count,upper_values);


   ArraySetAsSeries(lower_values,true);
   CopyBuffer(index_handle,2,0,count,lower_values);
   
   return true;
  }

//AC------------------------------------------------------------------
bool AC(double &values[],double &color_indexes[],string symbol,ENUM_TIMEFRAMES period,int count)
  {
   ResetLastError();
   int index_handle=iAC(symbol,period);
   
   ArraySetAsSeries(values,true);
   CopyBuffer(index_handle,0,0,count,values);

   ArraySetAsSeries(color_indexes,true);
   CopyBuffer(index_handle,1,0,count,color_indexes);

   return true;
  }

//AD------------------------------------------------------------------
bool AD(double &data[],string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume,int count)
  {
   ResetLastError();
   int index_handle=iAD(symbol,period,applied_volume);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//ADXWilder------------------------------------------------------------------
bool ADXWilder(double &ADXBuffer[],double &DI_plusBuffer[],double &DI_minusBuffer[],string symbol,ENUM_TIMEFRAMES period,int adx_period,int count)
  {
   ResetLastError();
   int index_handle=iADXWilder(symbol,period,adx_period);
   
   ArraySetAsSeries(ADXBuffer,true);
   CopyBuffer(index_handle,0,0,count,ADXBuffer);

   ArraySetAsSeries(DI_plusBuffer,true);
   CopyBuffer(index_handle,1,0,count,DI_plusBuffer);

   ArraySetAsSeries(DI_minusBuffer,true);
   CopyBuffer(index_handle,2,0,count,DI_minusBuffer);

   return true;
  }

//Alligator------------------------------------------------------------------
bool Alligator(double &jaws_buffer[],double &teeth_buffer[],double &lips_buffer[],string symbol,ENUM_TIMEFRAMES period,int jaw_period,int jaw_shift,int teeth_period,int teeth_shift,int lips_period,int lips_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iAlligator(symbol,period,jaw_period,jaw_shift,teeth_period, teeth_shift,lips_period,lips_shift,ma_method,applied_price);
   
   ArraySetAsSeries(jaws_buffer,true);
   CopyBuffer(index_handle,0,0,count,jaws_buffer);

   ArraySetAsSeries(teeth_buffer,true);
   CopyBuffer(index_handle,1,0,count,teeth_buffer);

   ArraySetAsSeries(lips_buffer,true);
   CopyBuffer(index_handle,2,0,count,lips_buffer);

   return true;
  }

//AMA------------------------------------------------------------------
bool AMA(double &data[],string symbol,ENUM_TIMEFRAMES period,int ama_period,int fast_ma_period,int slow_ma_period,int ama_shift,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iAMA(symbol,period,ama_period,fast_ma_period,slow_ma_period,ama_shift,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//AO------------------------------------------------------------------
bool AO(double &values[],double &color_indexes[],string symbol,ENUM_TIMEFRAMES period,int count)
  {
   ResetLastError();
   int index_handle=iAO(symbol,period);
   ArraySetAsSeries(values,true);
   CopyBuffer(index_handle,0,0,count,values);

   ArraySetAsSeries(color_indexes,true);
   CopyBuffer(index_handle,1,0,count,color_indexes);

   return true;
  }

//BearsPower------------------------------------------------------------------
bool BearsPower(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int count)
  {
   ResetLastError();
   int index_handle=iBearsPower(symbol,period,ma_period);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//BullsPower------------------------------------------------------------------
bool BullsPower(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int count)
  {
   ResetLastError();
   int index_handle=iBullsPower(symbol,period,ma_period);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//Chaikin------------------------------------------------------------------
bool Chaikin(double &data[],string symbol,ENUM_TIMEFRAMES period,int fast_ma_period,int slow_ma_period,ENUM_MA_METHOD ma_method,ENUM_APPLIED_VOLUME applied_volume,int count)
  {
   ResetLastError();
   int index_handle=iChaikin(symbol,period,fast_ma_period,slow_ma_period,ma_method,applied_volume);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//DEMA------------------------------------------------------------------
bool DEMA(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iDEMA(symbol,period,ma_period,ma_shift,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//DeMarker------------------------------------------------------------------
bool DeMarker(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int count)
  {
   ResetLastError();
   int index_handle=iDeMarker(symbol,period,ma_period);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//Envelopes------------------------------------------------------------------
bool Envelopes(double &upper_values[],double &lower_values[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price,double deviation,int count)
  {
   ResetLastError();
   int index_handle=iEnvelopes(symbol,period,ma_period,ma_shift,ma_method,applied_price,deviation);
   
   ArraySetAsSeries(upper_values,true);
   CopyBuffer(index_handle,0,0,count,upper_values);

   ArraySetAsSeries(lower_values,true);
   CopyBuffer(index_handle,1,0,count,lower_values);

   return true;
  }

//Force------------------------------------------------------------------
bool Force(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_MA_METHOD ma_method,ENUM_APPLIED_VOLUME applied_volume,int count)
  {
   ResetLastError();
   int index_handle=iForce(symbol,period,ma_period,ma_method,applied_volume);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//Fractals------------------------------------------------------------------
bool Fractals(double &up_arrows[],double &down_arrows[],string symbol,ENUM_TIMEFRAMES period,int count)
  {
   ResetLastError();
   int index_handle=iFractals(symbol,period);
   
   ArraySetAsSeries(up_arrows,true);
   CopyBuffer(index_handle,0,0,count,up_arrows);

   ArraySetAsSeries(down_arrows,true);
   CopyBuffer(index_handle,1,0,count,down_arrows);
   
   return true;
  }

//FrAMA------------------------------------------------------------------
bool FrAMA(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iFrAMA(symbol,period,ma_period,ma_shift,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//Gator------------------------------------------------------------------
bool Gator(double &ups_buffer[],double &up_color_buffer[],double &downs_buffer[],double &downs_color_buffer[],string symbol,ENUM_TIMEFRAMES period,int jaw_period,int jaw_shift,int teeth_period,int teeth_shift,int lips_period,int lips_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iGator(symbol,period,jaw_period,jaw_shift,teeth_period,teeth_shift, lips_period,lips_shift,ma_method,applied_price);
   
   ArraySetAsSeries(ups_buffer,true);
   CopyBuffer(index_handle,0,0,count,ups_buffer);

   ArraySetAsSeries(up_color_buffer,true);
   CopyBuffer(index_handle,1,0,count,up_color_buffer);

   ArraySetAsSeries(downs_buffer,true);
   CopyBuffer(index_handle,0,0,count,downs_buffer);

   ArraySetAsSeries(downs_color_buffer,true);
   CopyBuffer(index_handle,1,0,count,downs_color_buffer);

   return true;
  }

//Ichimoku------------------------------------------------------------------
bool Ichimoku(double &tenkan_sen_buffer[],double &kijun_sen_buffer[],double &senkou_span_A_buffer[],double &senkou_span_B_buffer[],double &chinkou_span_buffer[],string symbol,ENUM_TIMEFRAMES period,int tenkan_sen,int kijun_sen,int senkou_span_b,int count)
  {
   ResetLastError();
   int index_handle=iIchimoku(symbol,period,tenkan_sen,kijun_sen,senkou_span_b);
   
   ArraySetAsSeries(tenkan_sen_buffer,true);
   CopyBuffer(index_handle,0,0,count,tenkan_sen_buffer);

   ArraySetAsSeries(kijun_sen_buffer,true);
   CopyBuffer(index_handle,1,0,count,kijun_sen_buffer);

   ArraySetAsSeries(senkou_span_A_buffer,true);
   CopyBuffer(index_handle,2,0,count,senkou_span_A_buffer);

   ArraySetAsSeries(senkou_span_B_buffer,true);
   CopyBuffer(index_handle,3,0,count,senkou_span_B_buffer);

   ArraySetAsSeries(chinkou_span_buffer,true);
   CopyBuffer(index_handle,3,0,count,chinkou_span_buffer);

   return true;
  }

//BWMFI------------------------------------------------------------------
bool BWMFI(double &values[],double &colors[],string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume,int count)
  {
   ResetLastError();
   int index_handle=iBWMFI(symbol,period,applied_volume);
   
   ArraySetAsSeries(values,true);
   CopyBuffer(index_handle,0,0,count,values);
   
   ArraySetAsSeries(colors,true);
   CopyBuffer(index_handle,1,0,count,colors);

   return true;
  }

//Momentum------------------------------------------------------------------
bool Momentum(double &data[],string symbol,ENUM_TIMEFRAMES period,int mom_period,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iMomentum(symbol,period,mom_period,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }


//MFI------------------------------------------------------------------
bool MFI(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_VOLUME applied_volume,int count)
  {
   ResetLastError();
   int index_handle=iMFI(symbol,period,ma_period,applied_volume);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//OsMA------------------------------------------------------------------
bool OsMA(double &data[],string symbol,ENUM_TIMEFRAMES period,int fast_ema_period,int slow_ema_period,int signal_period,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iOsMA(symbol,period,fast_ema_period,slow_ema_period,signal_period,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//OBV------------------------------------------------------------------
bool OBV(double &data[],string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume,int count)
  {
   ResetLastError();
   int index_handle=iOBV(symbol,period,applied_volume);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//RVI------------------------------------------------------------------
bool RVI(double &rvi_buffer[],double &signal_buffer[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int count)
  {
   ResetLastError();
   int index_handle=iRVI(symbol,period,ma_period);
   
   ArraySetAsSeries(rvi_buffer,true);
   CopyBuffer(index_handle,0,0,count,rvi_buffer);

   ArraySetAsSeries(signal_buffer,true);
   CopyBuffer(index_handle,1,0,count,signal_buffer);

   return true;
  }

//StdDev------------------------------------------------------------------
bool StdDev(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int  ma_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iStdDev(symbol,period,ma_period,ma_shift,ma_method,applied_price); 
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//TEMA------------------------------------------------------------------
bool TEMA(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iTEMA(symbol,period,ma_period,ma_shift,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//TriX------------------------------------------------------------------
bool TriX(double &data[],string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iTriX(symbol,period,ma_period,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//WPR------------------------------------------------------------------
bool WPR(double &data[],string symbol,ENUM_TIMEFRAMES period,int calc_period,int count)
  {
   ResetLastError();
   int index_handle=iWPR(symbol,period,calc_period);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }

//VIDyA------------------------------------------------------------------
bool VIDyA(double &data[],string symbol,ENUM_TIMEFRAMES period,int cmo_period,int ema_period,int ma_shift,ENUM_APPLIED_PRICE applied_price,int count)
  {
   ResetLastError();
   int index_handle=iVIDyA(symbol,period,cmo_period,ema_period,ma_shift,applied_price);
   ArraySetAsSeries(data,true);
   CopyBuffer(index_handle,0,0,count,data);

   return true;
  }
//+------------------------------------------------------------------+
