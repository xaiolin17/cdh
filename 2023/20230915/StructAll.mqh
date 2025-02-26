//+------------------------------------------------------------------+
//|                                                    StructAll.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+


struct  KCandle
  {
   datetime          time;             // 时间
   double            open;             // 开盘价
   double            high;             // 最高价
   double            low;              // 最低价
   double            close;             // 收盘价
   long              volume;            // 成交量
   double            open_change1;     // 开盘价变化 （当前-前1）/前1
   double            open_change2;     // （前1-前2）/前2
   double            open_change3;     // （前1-前2）/前2
   double            high_change1;     // 最高价变化
   double            high_change2;
   double            high_change3;
   double            low_change1;      // 最低价变化
   double            low_change2;
   double            low_change3;
   double            close_change1;    // 收盘价变化
   double            close_change2;
   double            close_change3;
   double            volume_change1;  // 成交量变化
   double            volume_change2;
   double            volume_change3;
   double            atr5;       //ATR
   double            atr10;
   double            macd;     //MACD12269
   double            sma5;     //SMA
   double            sma10;
   double            ema5;     //EMA
   double            ema10;
   double            smma5;     //SMMA
   double            smma10;
   double            lwma5;     //LWMA
   double            lwma10;
   double            rsi5;     //RSI
   double            rsi14;
   double            sar;     //SAR
   double            adx;     //ADX
   double            adx_DI_plus;
   double            adx_DI_minus;
   double            cci;     //CCI
   double            slowk;     //STOCH
   double            slowd;
   double            boll_upper_band;     //BOLL
   double            boll_middle_band;
   double            boll_lower_band;
   double            his_interval;    // 历史区间
   double            interval_10;
   double            interval_20;
   double            interval_30;
   double            ac_value;        //AC
   double            ac_color;
   double            ad;            //AD
   double            adxWilder;       //ADXWilder
   double            adxWilder_DI_plus;
   double            adxWilder_DI_minus;
   double            jaws;         //Alligator
   double            teeth;
   double            lips;
   double            ama;                 //AMA
   double            ao_value;            //AO
   double            ao_color;
   double            bearsPower;          //BearsPower
   double            bullsPower;        //BullsPower
   double            chaikin;          //Chaikin
   double            dema;          //DEMA
   double            deMarker;          //DeMarker
   double            envelopes_upper_value;     //Envelopes
   double            envelopes_lower_value;
   double            force;          //Force
   double            fractals_up_arrow;        //Fractals
   double            fractals_down_arrow;
   double            frAMA;         //FrAMA
   double            gator_ups;        //Gator
   double            gator_up_color;
   double            gator_downs;
   double            gator_downs_color;
   double            tenkan_sen;    //Ichimoku
   double            kijun_sen;
   double            senkou_span_A;
   double            senkou_span_B;
   double            chinkou_span;
   double            bwmfi_value;        //BWMFI
   double            bwmfi_color;
   double            momentum;     //Momentum
   double            mfi;     //MFI
   double            osMA;       //OsMA
   double            obv;     //OBV
   double            rvi;     //RVI
   double            rvi_signal;
   double            stdDev;     //StdDev
   double            tema;       //TEMA
   double            triX;       //TriX
   double            wpr;        //WPR
   double            vidya;        //VIDyA
   uchar               atr_5_10_type;     
   uchar               macd_type;     //MACD12269
   uchar               sma_5_10_type;     
   uchar               ema_5_10_type;     
   uchar               smma_5_10_type;     
   uchar               lwma_5_10_type;     
   uchar               rsi_5_14_type;     
   uchar               sar_type;     
   uchar               adx_type;     
   uchar               cci_type;     
   uchar               stoch_type;     
   uchar               boll_type;     
   uchar               ac_type;
   uchar               ad_type;
   uchar               adxWilder_type;
   uchar               alligator_type;
   uchar               ama_type;
   uchar               ao_type;
   uchar               bearsPower_type;
   uchar               bullsPower_type;
   uchar               chaikin_type;
   uchar               dema_type;
   uchar               deMarker_type;
   uchar               envelopes_type;
   uchar               force_type;
   uchar               fractals_type;
   uchar               frAMA_type;
   uchar               gator_type;
   uchar               ichimoku_type;
   uchar               bwmfi_type;
   uchar               momentum_type;
   uchar               mfi_type;
   uchar               osMA_type;
   uchar               obv_type;
   uchar               rvi_type;
   uchar               stdDev_type;
  };
//+------------------------------------------------------------------+
