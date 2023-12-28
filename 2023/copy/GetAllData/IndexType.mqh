//+------------------------------------------------------------------+
//|                                                    IndexType.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  ATR                                             |
//+------------------------------------------------------------------+
uchar TypeATR(double &atr5_arr[],double &atr10_arr[],int kdata_shift)
  {
   if(atr5_arr[kdata_shift] <= atr10_arr[kdata_shift])
     {
      return 1;
     }
   else
     {
      return 2;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                 MACD                                             |
//+------------------------------------------------------------------+
uchar TypeMACD(double &macd_arr[], int kdata_shift)
  {
   if(macd_arr[kdata_shift]>=0)
     {
      if(macd_arr[kdata_shift+1]<0)
        {
         return 4;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(macd_arr[kdata_shift+1]>=0)
        {
         return 3;
        }
      else
        {
         return 1;
        }
     }
  }

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                     SMA                                          |
//+------------------------------------------------------------------+
uchar TypeSMA(double &sma5_arr[],double &sma10_arr[],double close_,int kdata_shift)
  {
   if(sma5_arr[kdata_shift] > sma10_arr[kdata_shift])
     {
      if(sma5_arr[kdata_shift] >= close_)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(sma5_arr[kdata_shift] < close_)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        EMA                                       |
//+------------------------------------------------------------------+
uchar TypeEMA(double &ema5_arr[],double &ema10_arr[],double close_,int kdata_shift)
  {
   if(ema5_arr[kdata_shift] > ema10_arr[kdata_shift])
     {
      if(ema5_arr[kdata_shift] >= close_)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(ema5_arr[kdata_shift] < close_)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                      SMMA                                        |
//+------------------------------------------------------------------+
uchar TypeSMMA(double &smma5_arr[],double &smma10_arr[],double close_,int kdata_shift)
  {
   if(smma5_arr[kdata_shift] > smma10_arr[kdata_shift])
     {
      if(smma5_arr[kdata_shift] >= close_)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(smma5_arr[kdata_shift] < close_)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                    LWMA                                          |
//+------------------------------------------------------------------+
uchar TypeLWMA(double &lwma5_arr[],double &lwma10_arr[],double close_,int kdata_shift)
  {
   if(lwma5_arr[kdata_shift] > lwma10_arr[kdata_shift])
     {
      if(lwma5_arr[kdata_shift] >= close_)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(lwma5_arr[kdata_shift] < close_)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                 RSI                                              |
//+------------------------------------------------------------------+
uchar TypeRSI(double &rsi5_arr[],double &rsi14_arr[],int kdata_shift)
  {
   if(20 < rsi5_arr[kdata_shift] < 80)
     {
      if(rsi5_arr[kdata_shift] <= rsi14_arr[kdata_shift])
        {
         if(rsi5_arr[kdata_shift+1] >= rsi14_arr[kdata_shift+1])
           {
            return 5;
           }
         else
           {
            return 7;
           }
        }
      else
        {
         if(rsi5_arr[kdata_shift+1] <= rsi14_arr[kdata_shift+1])
           {
            return 6;
           }
         else
           {
            return 8;
           }
        }
     }
   else
     {
      if(rsi5_arr[kdata_shift] <= 20)
        {
         if(rsi5_arr[kdata_shift] <= rsi14_arr[kdata_shift])
           {
            return 1;
           }
         else
           {
            if(rsi5_arr[kdata_shift+1] <= rsi14_arr[kdata_shift+1])
              {
               return 2;
              }
            else
              {
               return 9;
              }
           }
        }
      else
        {
         if(rsi5_arr[kdata_shift] >= rsi14_arr[kdata_shift])
           {
            return 3;
           }
         else
           {
            if(rsi5_arr[kdata_shift+1] >= rsi14_arr[kdata_shift+1])
              {
               return 4;
              }
            else
              {
               return 10;
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                    SAR                                           |
//+------------------------------------------------------------------+
uchar TypeSAR(double &sar_arr[],double close_,int kdata_shift)
  {
   if(sar_arr[kdata_shift] <= close_)
     {
      if(sar_arr[kdata_shift] >= sar_arr[kdata_shift+1])
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(sar_arr[kdata_shift] >= sar_arr[kdata_shift+1])
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                      ADX                                         |
//+------------------------------------------------------------------+
uchar TypeADX(double &adx_arr[],int kdata_shift)
  {
   if(0 <= adx_arr[kdata_shift] <=25)
     {
      return 1;
     }
   else
     {
      if(25 < adx_arr[kdata_shift] <=50)
        {
         return 2;
        }
      else
        {
         if(50 < adx_arr[kdata_shift] <=75)
           {
            return 3;
           }
         else
           {
            return 4;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                       CCI                                        |
//+------------------------------------------------------------------+
uchar TypeCCI(double &cci_arr[],int kdata_shift)
  {
   if(cci_arr[kdata_shift] >= 100)
     {
      if(cci_arr[kdata_shift+1] <= 100)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(cci_arr[kdata_shift] <= 0)
        {
         if(cci_arr[kdata_shift+1] >= 0)
           {
            return 4;
           }
         else
           {
            return 5;
           }
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        BOLL                                      |
//+------------------------------------------------------------------+
uchar TypeBOLL(double &base_arr[], double &upper_arr[], double &lower_arr[], double open_, double close_, int kdata_shift)
  {
   if((upper_arr[kdata_shift] - lower_arr[kdata_shift]) > (upper_arr[kdata_shift+1] - lower_arr[kdata_shift+1]) && (upper_arr[kdata_shift+1] - lower_arr[kdata_shift+1]) > (upper_arr[kdata_shift+2] - lower_arr[kdata_shift+2]))
     {
      if(close_ > upper_arr[kdata_shift])
        {
         return 1;
        }
      else
        {
         if(base_arr[kdata_shift] <= close_ <= upper_arr[kdata_shift])
           {
            return 2;
           }
         else
           {
            if(lower_arr[kdata_shift] <= close_ <= base_arr[kdata_shift])
              {
               return 3;
              }
            else
              {
               return 4;
              }
           }
        }
     }
   else
     {
        {
         if(close_ > upper_arr[kdata_shift])
           {
            return 5;
           }
         else
           {
            if(base_arr[kdata_shift] <= close_ <= upper_arr[kdata_shift])
              {
               return 6;
              }
            else
              {
               if(lower_arr[kdata_shift] <= close_ <= base_arr[kdata_shift])
                 {
                  return 7;
                 }
               else
                 {
                  return 8;
                 }
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        KD                                        |
//+------------------------------------------------------------------+
uchar TypeSTOCH(double &slowK_arr[], double &slowD_arr[], int kdata_shift)
  {
   if(20 < slowK_arr[kdata_shift] < 80)
     {
      if(slowK_arr[kdata_shift] >= slowD_arr[kdata_shift])
        {
         if(slowK_arr[kdata_shift+1] <= slowD_arr[kdata_shift+1])
           {
            return 5;
           }
         else
           {
            return 7;
           }
        }
      else
        {
         if(slowK_arr[kdata_shift+1] >= slowD_arr[kdata_shift+1])
           {
            return 6;
           }
         else
           {
            return 8;
           }
        }
     }
   else
     {
      if(slowK_arr[kdata_shift] <= 20)
        {
         if(slowK_arr[kdata_shift] >= slowD_arr[kdata_shift])
           {
            if(slowK_arr[kdata_shift+1] <= slowD_arr[kdata_shift+1])
              {
               return 1;
              }
            else
              {
               return 9;
              }
           }
         else
           {
            return 2;
           }
        }
      else
        {
         if(slowK_arr[kdata_shift] >= slowD_arr[kdata_shift])
           {
            return 3;
           }
         else
           {
            if(slowK_arr[kdata_shift+1] >= slowD_arr[kdata_shift+1])
              {
               return 4;
              }
            else
              {
               return 10;
              }

           }
        }

     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                      AC                                          |
//+------------------------------------------------------------------+
uchar TypeAC(double &ac_value_arr[], double &ac_color_arr[], int kdata_shift)
  {
   if(ac_value_arr[kdata_shift] >= 0)
     {
      if(ac_color_arr[kdata_shift] == 1)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(ac_color_arr[kdata_shift] == 1)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                     AD                                           |
//+------------------------------------------------------------------+
uchar TypeAD(double &ad_arr[], int kdata_shift)
  {
   if(ad_arr[kdata_shift] >= ad_arr[kdata_shift+1])
     {
      return 1;
     }
   else
     {
      return 2;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                          ADXWilder                               |
//+------------------------------------------------------------------+
uchar TypeADXWilder(double &adxWilder_arr[], int kdata_shift)
  {
   if(0 <= adxWilder_arr[kdata_shift] <= 25)
     {
      return 1;
     }
   else
     {
      if(25 < adxWilder_arr[kdata_shift] <= 50)
        {
         return 2;
        }
      else
        {
         if(50 < adxWilder_arr[kdata_shift] <= 75)
           {
            return 3;
           }
         else
           {
            return 4;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                            Alligator                             |
//+------------------------------------------------------------------+
uchar TypeAlligator(double &lips_arr[], double &teeth_arr[], double &jaws_arr[], int kdata_shift)
  {
   if(lips_arr[kdata_shift] < teeth_arr[kdata_shift] < jaws_arr[kdata_shift])
     {
      if(lips_arr[kdata_shift] > teeth_arr[kdata_shift])
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(lips_arr[kdata_shift] > teeth_arr[kdata_shift] > jaws_arr[kdata_shift])
        {
         if(lips_arr[kdata_shift] < teeth_arr[kdata_shift])
           {
            return 4;
           }
         else
           {
            return 3;
           }
        }
      else
        {
         return 5;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                       AMA                                        |
//+------------------------------------------------------------------+
uchar TypeAMA(double &ama_arr[], double close_, double close_1, int kdata_shift)
  {
   if(ama_arr[kdata_shift] >= close_)
     {
      if(ama_arr[kdata_shift+1] < close_1)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(ama_arr[kdata_shift+1] > close_1)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                            AO                                    |
//+------------------------------------------------------------------+
uchar TypeAO(double &ao_value_arr[], double &ao_color_arr[], int kdata_shift)
  {
   if(ao_value_arr[kdata_shift] >= 0)
     {
      if(ao_color_arr[kdata_shift] == 1)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(ao_color_arr[kdata_shift] == 1)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                        BearsPower                                |
//+------------------------------------------------------------------+
uchar TypeBearsPower(double &bearsPower_arr[], int kdata_shift)
  {
   if(bearsPower_arr[kdata_shift] > 0)
     {
      if(bearsPower_arr[kdata_shift+1] <= 0)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(bearsPower_arr[kdata_shift+1] >= 0)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                      BullsPower                                  |
//+------------------------------------------------------------------+
uchar TypeBullsPower(double &bullsPower_arr[], int kdata_shift)
  {
   if(bullsPower_arr[kdata_shift] > 0)
     {
      if(bullsPower_arr[kdata_shift+1] <= 0)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(bullsPower_arr[kdata_shift+1] >= 0)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                         Chaikin                                  |
//+------------------------------------------------------------------+
uchar TypeChaikin(double &chaikin_arr[], int kdata_shift)
  {
   if(chaikin_arr[kdata_shift] > 0)
     {
      if(chaikin_arr[kdata_shift+1] <= 0)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(chaikin_arr[kdata_shift+1] >= 0)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        DEMA                                      |
//+------------------------------------------------------------------+
uchar TypeDEMA(double &dema_arr[], double close_, double close_1, int kdata_shift)
  {
   if(dema_arr[kdata_shift] >= close_)
     {
      if(dema_arr[kdata_shift+1] < close_1)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(dema_arr[kdata_shift+1] > close_1)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                   DeMarker                                       |
//+------------------------------------------------------------------+
uchar TypeDeMarker(double &deMarker_arr[], int kdata_shift)
  {
   if(0.3 < deMarker_arr[kdata_shift] < 0.7)
     {
      if(deMarker_arr[kdata_shift] <= deMarker_arr[kdata_shift+1])
        {
         return 5;
        }
      else
        {
         return 6;
        }
     }
   else
     {
      if(deMarker_arr[kdata_shift] >= 0.7)
        {
         if(deMarker_arr[kdata_shift+1] < 0.7)
           {
            return 2;
           }
         else
           {
            return 1;
           }
        }
      else
        {
         if(deMarker_arr[kdata_shift+1] > 0.3)
           {
            return 4;
           }
         else
           {
            return 3;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                              Envelopes                           |
//+------------------------------------------------------------------+
uchar TypeEnvelopes(double &envelopes_lower_arr[], double &envelopes_upper_arr[], double close_, double close_1,int kdata_shift)
  {
   if(envelopes_lower_arr[kdata_shift] <= close_ <= envelopes_upper_arr[kdata_shift])
     {
      return 3;
     }
   else
     {
      if(close_ > envelopes_upper_arr[kdata_shift])
        {
         if(close_1 < envelopes_upper_arr[kdata_shift+1])
           {
            return 2;
           }
         else
           {
            return 1;
           }
        }
      else
        {
         if(close_1 > envelopes_lower_arr[kdata_shift+1])
           {
            return 5;
           }
         else
           {
            return 4;
           }
        }

     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                            Force                                 |
//+------------------------------------------------------------------+
uchar TypeForce(double &force_arr[], double close_, double close_1,int kdata_shift)
  {
   if(close_ > close_1)
     {
      if(force_arr[kdata_shift] > 0)
        {
         if(force_arr[kdata_shift] > force_arr[kdata_shift+1])
           {
            return 1;
           }
         else
           {
            return 2;
           }
        }
      else
        {
         return 3;
        }
     }
   else
     {
      if(force_arr[kdata_shift] < 0)
        {
         if(force_arr[kdata_shift] < force_arr[kdata_shift+1])
           {
            return 4;
           }
         else
           {
            return 5;
           }
        }
      else
        {
         return 6;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                         Fractals                                 |
//+------------------------------------------------------------------+
uchar TypeFractals(double &fractals_up_arr[], double &fractals_down_arr[], int kdata_shift)
  {
   if(fractals_up_arr[kdata_shift+3] < 9E+15)
     {
      return 1;
     }
   else
     {
      if(fractals_down_arr[kdata_shift+3] < 9E+15)
        {
         return 2;
        }
      else
        {
         return 0;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                           FrAMA                                  |
//+------------------------------------------------------------------+
uchar TypeFrAMA(double &frAMA_arr[], double close_, double close_1, int kdata_shift)
  {
   if(frAMA_arr[kdata_shift] >= close_)
     {
      if(frAMA_arr[kdata_shift+1] < close_1)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(frAMA_arr[kdata_shift+1] > close_1)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                            Gator                                      |
//+------------------------------------------------------------------+
uchar TypeGator(double &gator_up_color_arr[], double &gator_down_color_arr[], int kdata_shift)
  {
   if(gator_up_color_arr[kdata_shift] == 0)
     {
      if(gator_down_color_arr[kdata_shift] == 0)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(gator_down_color_arr[kdata_shift] == 0)
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        Ichimoku                                          |
//+------------------------------------------------------------------+
uchar TypeIchimoku(double &tenkan_sen_arr[], double &kijun_sen_arr[], double &senkou_span_A_arr[], double &senkou_span_B_arr[], double close_, int kdata_shift)
  {
   if(tenkan_sen_arr[kdata_shift] >= kijun_sen_arr[kdata_shift])
     {
      if(close_ <= senkou_span_A_arr[kdata_shift])
        {
         return 1;
        }
      if(senkou_span_A_arr[kdata_shift] < close_ < senkou_span_B_arr[kdata_shift])
        {
         return 2;
        }
      else
        {
         return 3;
        }
     }
   else
     {
      if(close_ >= senkou_span_A_arr[kdata_shift])
        {
         return 4;
        }
      if(senkou_span_B_arr[kdata_shift] < close_ < senkou_span_A_arr[kdata_shift])
        {
         return 5;
        }
      else
        {
         return 6;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                         BWMFI                                         |
//+------------------------------------------------------------------+
uchar TypeBWMFI(double &bwmfi_color_arr[], int kdata_shift)
  {
   if(bwmfi_color_arr[kdata_shift] == 0)
     {
      return 1;
     }
   else
     {
      if(bwmfi_color_arr[kdata_shift] == 1)
        {
         return 2;
        }
      else
        {
         if(bwmfi_color_arr[kdata_shift] == 2)
           {
            return 3;
           }
         else
           {
            return 4;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        Momentum                                          |
//+------------------------------------------------------------------+
uchar TypeMomentum(double &momentum_arr[], int kdata_shift)
  {
   if(momentum_arr[kdata_shift] > 100)
     {
      if(momentum_arr[kdata_shift] > momentum_arr[kdata_shift+1])
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(momentum_arr[kdata_shift] > momentum_arr[kdata_shift+1])
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                          MFI                                        |
//+------------------------------------------------------------------+
uchar TypeMFI(double &mfi_arr[], int kdata_shift)
  {
   if(20 <= mfi_arr[kdata_shift] <= 80)
     {
      if(mfi_arr[kdata_shift] < mfi_arr[kdata_shift+1])
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
   else
     {
      if(mfi_arr[kdata_shift] >80)
        {
         if(mfi_arr[kdata_shift] < mfi_arr[kdata_shift+1])
           {
            return 1;
           }
         else
           {
            return 2;
           }
        }
      else
        {
         if(mfi_arr[kdata_shift] < mfi_arr[kdata_shift+1])
           {
            return 5;
           }
         else
           {
            return 6;
           }
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                           OsMA                                       |
//+------------------------------------------------------------------+
uchar TypeOsMA(double &osMA_arr[], int kdata_shift)
  {
   if(osMA_arr[kdata_shift] > 0)
     {
      if(osMA_arr[kdata_shift] <= 0)
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(osMA_arr[kdata_shift] >= 0)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                              OBV                                    |
//+------------------------------------------------------------------+
uchar TypeOBV(double &obv_arr[], double close_, double close_1, int kdata_shift)
  {
   if(close_ > close_1)
     {
      if(obv_arr[kdata_shift] > obv_arr[kdata_shift+1])
        {
         return 1;
        }
      else
        {
         return 2;
        }
     }
   else
     {
      if(obv_arr[kdata_shift] > obv_arr[kdata_shift+1])
        {
         return 3;
        }
      else
        {
         return 4;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                         RVI                                         |
//+------------------------------------------------------------------+
uchar TypeRVI(double &rvi_arr[], double &rvi_signal_arr[], int kdata_shift)
  {
   if(rvi_arr[kdata_shift] > rvi_signal_arr[kdata_shift])
     {
      if(rvi_arr[kdata_shift+1] <= rvi_signal_arr[kdata_shift+1])
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(rvi_arr[kdata_shift+1] >= rvi_signal_arr[kdata_shift+1])
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                        StdDev                                          |
//+------------------------------------------------------------------+
uchar TypeStdDev(double &stdDev_arr[], int kdata_shift)
  {
   if(stdDev_arr[kdata_shift] > stdDev_arr[kdata_shift+1])
     {
      return 1;
     }
   else
     {
      return 2;
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                         TEMA                                         |
//+------------------------------------------------------------------+
uchar TypeTEMA(double &tema_arr[],double close_, double close_1, int kdata_shift)
  {
   if(close_ <= tema_arr[kdata_shift])
     {
      if(close_1 > tema_arr[kdata_shift+1])
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(close_1 <= tema_arr[kdata_shift+1])
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                            TriX                                      |
//+------------------------------------------------------------------+
uchar TypeTriX(double &triX_arr[], int kdata_shift)
  {
   if(triX_arr[kdata_shift] > 0)
     {
      if(triX_arr[kdata_shift+1] < 0)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(triX_arr[kdata_shift+1] > 0)
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                           WPR                                       |
//+------------------------------------------------------------------+
uchar TypeWPR(double &wpr_arr[], int kdata_shift)
  {
   if(wpr_arr[kdata_shift] > -20)
     {
      if(wpr_arr[kdata_shift+1] < -20)
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(wpr_arr[kdata_shift] < -80)
        {
         if(wpr_arr[kdata_shift+1] > -80)
           {
            return 4;
           }
         else
           {
            return 3;
           }
        }
      else
        {
         return 5;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                              VIDyA                                    |
//+------------------------------------------------------------------+
uchar TypeVIDyA(double &vidya_arr[], double close_, double close_1, int kdata_shift)
  {
   if(close_ <= vidya_arr[kdata_shift])
     {
      if(close_1 > vidya_arr[kdata_shift+1])
        {
         return 2;
        }
      else
        {
         return 1;
        }
     }
   else
     {
      if(close_1 <= vidya_arr[kdata_shift+1])
        {
         return 4;
        }
      else
        {
         return 3;
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                              pass                                    |
//+------------------------------------------------------------------+
uchar TypePass(double pass, int num)
  {
   if(num == 5)
     {
      if(pass == 0 || pass == 4)
        {
         return 1;
        }
      else
        {
         return 0;
        }
     }
   else
     {
      if(num == 10)
        {

         if(pass == 0 || pass == 9)
           {
            return 3;
           }
         else
           {
            if(pass == 1 || pass == 8)
              {
               return 2;
              }
            else
              {
               if(pass == 2 || pass == 7)
                 {
                  return 1;
                 }
               else
                 {
                  return 0;
                 }
              }
           }

        }
      else
        {
         if(pass == 0 || pass == 4)
           {
            return 2;
           }
         else
           {
            if(pass == 1 || pass == 3)
              {
               return 1;
              }
            else
              {
               return 0;
              }
           }
        }
     }
  }
//+------------------------------------------------------------------+
