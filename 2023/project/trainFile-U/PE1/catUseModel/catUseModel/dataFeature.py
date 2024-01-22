import talib
import numpy as np
import pandas as pd

def creatFeature(rates_frame):

    """
    :param rates_frame: DataFrame
    :return: DataFrame
    """
    """
    变化计算
    """

    """
    指标计算
    """
    # ATR 用于衡量价格波动性的指标
    rates_frame['ATR5'] = talib.ATR(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=5)
    rates_frame['ATR10'] = talib.ATR(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=10)
    rates_frame['ATR14'] = talib.ATR(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=14)
    rates_frame['ATR5_changeValue1'] = rates_frame['ATR5'].shift(1)
    rates_frame['ATR5_changeValue1'] = rates_frame['ATR5'] - rates_frame['ATR5_changeValue1']
    rates_frame['ATR5_changeValue2'] = rates_frame['ATR5'].shift(2)
    rates_frame['ATR5_changeValue2'] = rates_frame['ATR5'] - rates_frame['ATR5_changeValue2']
    rates_frame['ATR5_changeValue3'] = rates_frame['ATR5'].shift(3)
    rates_frame['ATR5_changeValue3'] = rates_frame['ATR5'] - rates_frame['ATR5_changeValue3']
    rates_frame['ATR5_changeValue5'] = rates_frame['ATR5'].shift(5)
    rates_frame['ATR5_changeValue5'] = rates_frame['ATR5'] - rates_frame['ATR5_changeValue5']
    rates_frame['ATR5_changeValue10'] = rates_frame['ATR5'].shift(10)
    rates_frame['ATR5_changeValue10'] = rates_frame['ATR5'] - rates_frame['ATR5_changeValue10']

    rates_frame['ATR10_changeValue1'] = rates_frame['ATR10'].shift(1)
    rates_frame['ATR10_changeValue1'] = rates_frame['ATR10'] - rates_frame['ATR10_changeValue1']
    rates_frame['ATR10_changeValue2'] = rates_frame['ATR10'].shift(2)
    rates_frame['ATR10_changeValue2'] = rates_frame['ATR10'] - rates_frame['ATR10_changeValue2']
    rates_frame['ATR10_changeValue3'] = rates_frame['ATR10'].shift(3)
    rates_frame['ATR10_changeValue3'] = rates_frame['ATR10'] - rates_frame['ATR10_changeValue3']
    rates_frame['ATR10_changeValue5'] = rates_frame['ATR10'].shift(5)
    rates_frame['ATR10_changeValue5'] = rates_frame['ATR10'] - rates_frame['ATR10_changeValue5']
    rates_frame['ATR10_changeValue10'] = rates_frame['ATR10'].shift(10)
    rates_frame['ATR10_changeValue10'] = rates_frame['ATR10'] - rates_frame['ATR10_changeValue10']

    rates_frame['ATR14_changeValue1'] = rates_frame['ATR14'].shift(1)
    rates_frame['ATR14_changeValue1'] = rates_frame['ATR14'] - rates_frame['ATR14_changeValue1']
    rates_frame['ATR14_changeValue2'] = rates_frame['ATR14'].shift(2)
    rates_frame['ATR14_changeValue2'] = rates_frame['ATR14'] - rates_frame['ATR14_changeValue2']
    rates_frame['ATR14_changeValue3'] = rates_frame['ATR14'].shift(3)
    rates_frame['ATR14_changeValue3'] = rates_frame['ATR14'] - rates_frame['ATR14_changeValue3']
    rates_frame['ATR14_changeValue5'] = rates_frame['ATR14'].shift(5)
    rates_frame['ATR14_changeValue5'] = rates_frame['ATR14'] - rates_frame['ATR14_changeValue5']
    rates_frame['ATR14_changeValue10'] = rates_frame['ATR14'].shift(10)
    rates_frame['ATR14_changeValue10'] = rates_frame['ATR14'] - rates_frame['ATR14_changeValue10']

    # MACD = 快线 - 慢线
    # Signal = MACD的移动平均线
    # Hist = MACD - Signal
    rates_frame['MACD'], rates_frame['SIGNAL'], rates_frame['HIST'] = talib.MACD(rates_frame['close'], fastperiod=6,
                                                                                 slowperiod=13, signalperiod=5)
    rates_frame['MACD_changeValue1'] = rates_frame['MACD'].shift(1)
    rates_frame['MACD_changeValue1'] = rates_frame['MACD'] - rates_frame['MACD_changeValue1']
    rates_frame['MACD_changeValue2'] = rates_frame['MACD'].shift(2)
    rates_frame['MACD_changeValue2'] = rates_frame['MACD'] - rates_frame['MACD_changeValue2']
    rates_frame['MACD_changeValue3'] = rates_frame['MACD'].shift(3)
    rates_frame['MACD_changeValue3'] = rates_frame['MACD'] - rates_frame['MACD_changeValue3']
    rates_frame['MACD_changeValue5'] = rates_frame['MACD'].shift(5)
    rates_frame['MACD_changeValue5'] = rates_frame['MACD'] - rates_frame['MACD_changeValue5']
    rates_frame['MACD_changeValue10'] = rates_frame['MACD'].shift(10)
    rates_frame['MACD_changeValue10'] = rates_frame['MACD'] - rates_frame['MACD_changeValue10']

    rates_frame['SIGNAL_changeValue1'] = rates_frame['SIGNAL'].shift(1)
    rates_frame['SIGNAL_changeValue1'] = rates_frame['SIGNAL'] - rates_frame['SIGNAL_changeValue1']
    rates_frame['SIGNAL_changeValue2'] = rates_frame['SIGNAL'].shift(2)
    rates_frame['SIGNAL_changeValue2'] = rates_frame['SIGNAL'] - rates_frame['SIGNAL_changeValue2']
    rates_frame['SIGNAL_changeValue3'] = rates_frame['SIGNAL'].shift(3)
    rates_frame['SIGNAL_changeValue3'] = rates_frame['SIGNAL'] - rates_frame['SIGNAL_changeValue3']
    rates_frame['SIGNAL_changeValue5'] = rates_frame['SIGNAL'].shift(5)
    rates_frame['SIGNAL_changeValue5'] = rates_frame['SIGNAL'] - rates_frame['SIGNAL_changeValue5']
    rates_frame['SIGNAL_changeValue10'] = rates_frame['SIGNAL'].shift(10)
    rates_frame['SIGNAL_changeValue10'] = rates_frame['SIGNAL'] - rates_frame['SIGNAL_changeValue10']

    rates_frame['HIST_changeValue1'] = rates_frame['HIST'].shift(1)
    rates_frame['HIST_changeValue1'] = rates_frame['HIST'] - rates_frame['HIST_changeValue1']
    rates_frame['HIST_changeValue2'] = rates_frame['HIST'].shift(2)
    rates_frame['HIST_changeValue2'] = rates_frame['HIST'] - rates_frame['HIST_changeValue2']
    rates_frame['HIST_changeValue3'] = rates_frame['HIST'].shift(3)
    rates_frame['HIST_changeValue3'] = rates_frame['HIST'] - rates_frame['HIST_changeValue3']
    rates_frame['HIST_changeValue5'] = rates_frame['HIST'].shift(5)
    rates_frame['HIST_changeValue5'] = rates_frame['HIST'] - rates_frame['HIST_changeValue5']
    rates_frame['HIST_changeValue10'] = rates_frame['HIST'].shift(10)
    rates_frame['HIST_changeValue10'] = rates_frame['HIST'] - rates_frame['HIST_changeValue10']

    # 简单移动平均线 SMA
    rates_frame['SMA8'] = talib.SMA(rates_frame['close'], timeperiod=8)
    rates_frame['SMA30'] = talib.SMA(rates_frame['close'], timeperiod=30)

    rates_frame['closeSMA8_changeValue'] = rates_frame['close'] - rates_frame['SMA8']
    rates_frame['closeSMA30_changeValue'] = rates_frame['close'] - rates_frame['SMA30']

    rates_frame['highSMA8_changeValue'] = rates_frame['high'] - rates_frame['SMA8']
    rates_frame['highSMA30_changeValue'] = rates_frame['high'] - rates_frame['SMA30']

    rates_frame['lowSMA8_changeValue'] = rates_frame['low'] - rates_frame['SMA8']
    rates_frame['lowSMA30_changeValue'] = rates_frame['low'] - rates_frame['SMA30']

    # 计算 EMA（指数移动平均线）
    rates_frame['EMA8'] = talib.EMA(rates_frame['close'], timeperiod=8)
    rates_frame['EMA30'] = talib.EMA(rates_frame['close'], timeperiod=30)

    rates_frame['closeEMA8_changeValue'] = rates_frame['close'] - rates_frame['EMA8']
    rates_frame['closeEMA30_changeValue'] = rates_frame['close'] - rates_frame['EMA30']

    rates_frame['highEMA8_changeValue'] = rates_frame['high'] - rates_frame['EMA8']
    rates_frame['highEMA30_changeValue'] = rates_frame['high'] - rates_frame['EMA30']

    rates_frame['lowEMA8_changeValue'] = rates_frame['low'] - rates_frame['EMA8']
    rates_frame['lowEMA30_changeValue'] = rates_frame['low'] - rates_frame['EMA30']

    # RSI 用于衡量市场超买或超卖的程度
    rates_frame['RSI5'] = talib.RSI(rates_frame['close'], timeperiod=9)
    rates_frame['RSI14'] = talib.RSI(rates_frame['close'], timeperiod=14)

    rates_frame['RSI5_changeValue1'] = rates_frame['RSI5'].shift(1)
    rates_frame['RSI5_changeValue1'] = rates_frame['RSI5'] - rates_frame['RSI5_changeValue1']
    rates_frame['RSI5_changeValue2'] = rates_frame['RSI5'].shift(2)
    rates_frame['RSI5_changeValue2'] = rates_frame['RSI5'] - rates_frame['RSI5_changeValue2']
    rates_frame['RSI5_changeValue3'] = rates_frame['RSI5'].shift(3)
    rates_frame['RSI5_changeValue3'] = rates_frame['RSI5'] - rates_frame['RSI5_changeValue3']
    rates_frame['RSI5_changeValue5'] = rates_frame['RSI5'].shift(5)
    rates_frame['RSI5_changeValue5'] = rates_frame['RSI5'] - rates_frame['RSI5_changeValue5']
    rates_frame['RSI5_changeValue10'] = rates_frame['RSI5'].shift(10)
    rates_frame['RSI5_changeValue10'] = rates_frame['RSI5'] - rates_frame['RSI5_changeValue10']

    rates_frame['RSI14_changeValue1'] = rates_frame['RSI14'].shift(1)
    rates_frame['RSI14_changeValue1'] = rates_frame['RSI14'] - rates_frame['RSI14_changeValue1']
    rates_frame['RSI14_changeValue2'] = rates_frame['RSI14'].shift(2)
    rates_frame['RSI14_changeValue2'] = rates_frame['RSI14'] - rates_frame['RSI14_changeValue2']
    rates_frame['RSI14_changeValue3'] = rates_frame['RSI14'].shift(3)
    rates_frame['RSI14_changeValue3'] = rates_frame['RSI14'] - rates_frame['RSI14_changeValue3']
    rates_frame['RSI14_changeValue5'] = rates_frame['RSI14'].shift(5)
    rates_frame['RSI14_changeValue5'] = rates_frame['RSI14'] - rates_frame['RSI14_changeValue5']
    rates_frame['RSI14_changeValue10'] = rates_frame['RSI14'].shift(10)
    rates_frame['RSI14_changeValue10'] = rates_frame['RSI14'] - rates_frame['RSI14_changeValue10']

    # BOLL 参数设置布林带的标准差倍数为2
    rates_frame['UPPER_BAND'], rates_frame['MIDDLE_BAND'], rates_frame['LOWER_BAND'] = talib.BBANDS(
        rates_frame['close'], timeperiod=20, nbdevup=2.5, nbdevdn=2.5)

    rates_frame['closeUPPER_BAND_changeValue'] = rates_frame['close'] - rates_frame['UPPER_BAND']
    rates_frame['closeMIDDLE_BAND_changeValue'] = rates_frame['close'] - rates_frame['MIDDLE_BAND']
    rates_frame['closeLOWER_BAND_changeValue'] = rates_frame['close'] - rates_frame['LOWER_BAND']

    rates_frame['highUPPER_BAND_changeValue'] = rates_frame['high'] - rates_frame['UPPER_BAND']
    rates_frame['highMIDDLE_BAND_changeValue'] = rates_frame['high'] - rates_frame['MIDDLE_BAND']
    rates_frame['highLOWER_BAND_changeValue'] = rates_frame['high'] - rates_frame['LOWER_BAND']

    rates_frame['lowUPPER_BAND_changeValue'] = rates_frame['low'] - rates_frame['UPPER_BAND']
    rates_frame['lowMIDDLE_BAND_changeValue'] = rates_frame['low'] - rates_frame['MIDDLE_BAND']
    rates_frame['lowLOWER_BAND_changeValue'] = rates_frame['low'] - rates_frame['LOWER_BAND']

    # SAR 使用acceleration参数设置加速因子为0.02，maximum参数设置最大加速因子为0.2
    rates_frame['SAR'] = talib.SAR(rates_frame['high'], rates_frame['low'], acceleration=0.02, maximum=0.2)

    rates_frame['SAR_changeValue1'] = rates_frame['SAR'].shift(1)
    rates_frame['SAR_changeValue1'] = rates_frame['SAR'] - rates_frame['SAR_changeValue1']
    rates_frame['SAR_changeValue2'] = rates_frame['SAR'].shift(2)
    rates_frame['SAR_changeValue2'] = rates_frame['SAR'] - rates_frame['SAR_changeValue2']
    rates_frame['SAR_changeValue3'] = rates_frame['SAR'].shift(3)
    rates_frame['SAR_changeValue3'] = rates_frame['SAR'] - rates_frame['SAR_changeValue3']
    rates_frame['SAR_changeValue5'] = rates_frame['SAR'].shift(5)
    rates_frame['SAR_changeValue5'] = rates_frame['SAR'] - rates_frame['SAR_changeValue5']
    rates_frame['SAR_changeValue10'] = rates_frame['SAR'].shift(10)
    rates_frame['SAR_changeValue10'] = rates_frame['SAR'] - rates_frame['SAR_changeValue10']

    # ADX 用于衡量趋势的强度
    rates_frame['ADX'] = talib.ADX(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=10)

    rates_frame['ADX_changeValue1'] = rates_frame['ADX'].shift(1)
    rates_frame['ADX_changeValue1'] = rates_frame['ADX'] - rates_frame['ADX_changeValue1']
    rates_frame['ADX_changeValue2'] = rates_frame['ADX'].shift(2)
    rates_frame['ADX_changeValue2'] = rates_frame['ADX'] - rates_frame['ADX_changeValue2']
    rates_frame['ADX_changeValue3'] = rates_frame['ADX'].shift(3)
    rates_frame['ADX_changeValue3'] = rates_frame['ADX'] - rates_frame['ADX_changeValue3']
    rates_frame['ADX_changeValue5'] = rates_frame['ADX'].shift(5)
    rates_frame['ADX_changeValue5'] = rates_frame['ADX'] - rates_frame['ADX_changeValue5']
    rates_frame['ADX_changeValue10'] = rates_frame['ADX'].shift(10)
    rates_frame['ADX_changeValue10'] = rates_frame['ADX'] - rates_frame['ADX_changeValue10']

    # CCI 用于判断价格是否超买或超卖的指标
    rates_frame['CCI'] = talib.CCI(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=14)

    rates_frame['CCI_changeValue1'] = rates_frame['CCI'].shift(1)
    rates_frame['CCI_changeValue1'] = rates_frame['CCI'] - rates_frame['CCI_changeValue1']
    rates_frame['CCI_changeValue2'] = rates_frame['CCI'].shift(2)
    rates_frame['CCI_changeValue2'] = rates_frame['CCI'] - rates_frame['CCI_changeValue2']
    rates_frame['CCI_changeValue3'] = rates_frame['CCI'].shift(3)
    rates_frame['CCI_changeValue3'] = rates_frame['CCI'] - rates_frame['CCI_changeValue3']
    rates_frame['CCI_changeValue5'] = rates_frame['CCI'].shift(5)
    rates_frame['CCI_changeValue5'] = rates_frame['CCI'] - rates_frame['CCI_changeValue5']
    rates_frame['CCI_changeValue10'] = rates_frame['CCI'].shift(10)
    rates_frame['CCI_changeValue10'] = rates_frame['CCI'] - rates_frame['CCI_changeValue10']

    # ROC 用于显示价格变化的百分比 ((price/prevPrice)-1)*100
    rates_frame['closeROC2'] = talib.ROC(rates_frame['close'], timeperiod=2)
    rates_frame['closeROC3'] = talib.ROC(rates_frame['close'], timeperiod=3)
    rates_frame['closeROC4'] = talib.ROC(rates_frame['close'], timeperiod=4)
    rates_frame['closeROC5'] = talib.ROC(rates_frame['close'], timeperiod=5)
    rates_frame['closeROC10'] = talib.ROC(rates_frame['close'], timeperiod=10)
    rates_frame['closeROC20'] = talib.ROC(rates_frame['close'], timeperiod=20)
    rates_frame['closeROC30'] = talib.ROC(rates_frame['close'], timeperiod=30)
    # ROCR price/prevPrice
    rates_frame['closeROCR2'] = talib.ROCR(rates_frame['close'], timeperiod=2)
    rates_frame['closeROCR3'] = talib.ROCR(rates_frame['close'], timeperiod=3)
    rates_frame['closeROCR4'] = talib.ROCR(rates_frame['close'], timeperiod=4)
    rates_frame['closeROCR5'] = talib.ROCR(rates_frame['close'], timeperiod=5)
    rates_frame['closeROCR10'] = talib.ROCR(rates_frame['close'], timeperiod=10)
    rates_frame['closeROCR20'] = talib.ROCR(rates_frame['close'], timeperiod=20)
    rates_frame['closeROCR30'] = talib.ROCR(rates_frame['close'], timeperiod=30)
    # --
    rates_frame['highROC2'] = talib.ROC(rates_frame['high'], timeperiod=2)
    rates_frame['highROC3'] = talib.ROC(rates_frame['high'], timeperiod=3)
    rates_frame['highROC4'] = talib.ROC(rates_frame['high'], timeperiod=4)
    rates_frame['highROC5'] = talib.ROC(rates_frame['high'], timeperiod=5)
    rates_frame['highROC10'] = talib.ROC(rates_frame['high'], timeperiod=10)
    rates_frame['highROC20'] = talib.ROC(rates_frame['high'], timeperiod=20)
    rates_frame['highROC30'] = talib.ROC(rates_frame['high'], timeperiod=30)

    rates_frame['highROCR2'] = talib.ROCR(rates_frame['high'], timeperiod=2)
    rates_frame['highROCR3'] = talib.ROCR(rates_frame['high'], timeperiod=3)
    rates_frame['highROCR4'] = talib.ROCR(rates_frame['high'], timeperiod=4)
    rates_frame['highROCR5'] = talib.ROCR(rates_frame['high'], timeperiod=5)
    rates_frame['highROCR10'] = talib.ROCR(rates_frame['high'], timeperiod=10)
    rates_frame['highROCR20'] = talib.ROCR(rates_frame['high'], timeperiod=20)
    rates_frame['highROCR30'] = talib.ROCR(rates_frame['high'], timeperiod=30)
    # ---
    rates_frame['lowROC2'] = talib.ROC(rates_frame['low'], timeperiod=2)
    rates_frame['lowROC3'] = talib.ROC(rates_frame['low'], timeperiod=3)
    rates_frame['lowROC4'] = talib.ROC(rates_frame['low'], timeperiod=4)
    rates_frame['lowROC5'] = talib.ROC(rates_frame['low'], timeperiod=5)
    rates_frame['lowROC10'] = talib.ROC(rates_frame['low'], timeperiod=10)
    rates_frame['lowROC20'] = talib.ROC(rates_frame['low'], timeperiod=20)
    rates_frame['lowROC30'] = talib.ROC(rates_frame['low'], timeperiod=30)

    rates_frame['lowROCR2'] = talib.ROCR(rates_frame['low'], timeperiod=2)
    rates_frame['lowROCR3'] = talib.ROCR(rates_frame['low'], timeperiod=3)
    rates_frame['lowROCR4'] = talib.ROCR(rates_frame['low'], timeperiod=4)
    rates_frame['lowROCR5'] = talib.ROCR(rates_frame['low'], timeperiod=5)
    rates_frame['lowROCR10'] = talib.ROCR(rates_frame['low'], timeperiod=10)
    rates_frame['lowROCR20'] = talib.ROCR(rates_frame['low'], timeperiod=20)
    rates_frame['lowROCR30'] = talib.ROCR(rates_frame['low'], timeperiod=30)

    # STOCH  用于确定价格超买或超卖的指标 使用fastk_period参数设置快速K线周期为5，slowk_period参数设置慢速K线周期为3，slowd_period参数设置慢速D线周期为3
    rates_frame['SLOWK'], rates_frame['SLOWD'] = talib.STOCH(rates_frame['high'], rates_frame['low'],
                                                             rates_frame['close'], fastk_period=5, slowk_period=3,
                                                             slowd_period=3)

    rates_frame['SLOWK_SLOWD_Value'] = rates_frame['SLOWK'] - rates_frame['SLOWD']

    # STOCHF
    rates_frame['SLOWK_F'], rates_frame['SLOWD_F'] = talib.STOCHF(rates_frame['high'], rates_frame['low'],
                                                                  rates_frame['close'], fastk_period=5, fastd_period=3,
                                                                  fastd_matype=0)

    # STOCHRSI
    rates_frame['SLOWK_RSI'], rates_frame['SLOWD_RSI'] = talib.STOCHRSI(rates_frame['close'], timeperiod=14,
                                                                        fastk_period=5, fastd_period=3, fastd_matype=0)

    # AD
    rates_frame['AD'] = talib.AD(rates_frame['high'], rates_frame['low'], rates_frame['close'],
                                 rates_frame['tick_volume'])

    rates_frame['AD_changeValue1'] = rates_frame['AD'].shift(1)
    rates_frame['AD_changeValue1'] = rates_frame['AD'] - rates_frame['AD_changeValue1']
    rates_frame['AD_changeValue2'] = rates_frame['AD'].shift(2)
    rates_frame['AD_changeValue2'] = rates_frame['AD'] - rates_frame['AD_changeValue2']
    rates_frame['AD_changeValue3'] = rates_frame['AD'].shift(3)
    rates_frame['AD_changeValue3'] = rates_frame['AD'] - rates_frame['AD_changeValue3']
    rates_frame['AD_changeValue5'] = rates_frame['AD'].shift(5)
    rates_frame['AD_changeValue5'] = rates_frame['AD'] - rates_frame['AD_changeValue5']
    rates_frame['AD_changeValue10'] = rates_frame['AD'].shift(10)
    rates_frame['AD_changeValue10'] = rates_frame['AD'] - rates_frame['AD_changeValue10']

    # ADOSC
    rates_frame['ADOSC'] = talib.ADOSC(rates_frame['high'], rates_frame['low'], rates_frame['close'],
                                       rates_frame['tick_volume'], fastperiod=3, slowperiod=10)

    # ADX
    rates_frame['ADX'] = talib.ADX(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=13)

    rates_frame['ADX_changeValue1'] = rates_frame['ADX'].shift(1)
    rates_frame['ADX_changeValue1'] = rates_frame['ADX'] - rates_frame['ADX_changeValue1']
    rates_frame['ADX_changeValue2'] = rates_frame['ADX'].shift(2)
    rates_frame['ADX_changeValue2'] = rates_frame['ADX'] - rates_frame['ADX_changeValue2']
    rates_frame['ADX_changeValue3'] = rates_frame['ADX'].shift(3)
    rates_frame['ADX_changeValue3'] = rates_frame['ADX'] - rates_frame['ADX_changeValue3']
    rates_frame['ADX_changeValue5'] = rates_frame['ADX'].shift(5)
    rates_frame['ADX_changeValue5'] = rates_frame['ADX'] - rates_frame['ADX_changeValue5']
    rates_frame['ADX_changeValue10'] = rates_frame['ADX'].shift(10)
    rates_frame['ADX_changeValue10'] = rates_frame['ADX'] - rates_frame['ADX_changeValue10']

    # APO fastperiod=12, slowperiod=26
    rates_frame['APO_sma'] = talib.APO(rates_frame['close'], fastperiod=12, slowperiod=26, matype=0)
    rates_frame['APO_ema'] = talib.APO(rates_frame['close'], fastperiod=12, slowperiod=26, matype=1)
    rates_frame['APO_wma'] = talib.APO(rates_frame['close'], fastperiod=12, slowperiod=26, matype=2)
    rates_frame['APO_dema'] = talib.APO(rates_frame['close'], fastperiod=12, slowperiod=26, matype=3)
    rates_frame['APO_tema'] = talib.APO(rates_frame['close'], fastperiod=12, slowperiod=26, matype=4)

    # AROON 震荡指标 反映了一段时间内最高价和最低价出现的位置
    rates_frame['AROON5_aroondown'], rates_frame['AROON5_aroonup'] = talib.AROON(rates_frame['high'],
                                                                                 rates_frame['low'], timeperiod=5)
    rates_frame['AROON8_aroondown'], rates_frame['AROON5_aroonup'] = talib.AROON(rates_frame['high'],
                                                                                 rates_frame['low'], timeperiod=8)
    rates_frame['AROON14_aroondown'], rates_frame['AROON5_aroonup'] = talib.AROON(rates_frame['high'],
                                                                                  rates_frame['low'], timeperiod=14)
    rates_frame['AROON28_aroondown'], rates_frame['AROON5_aroonup'] = talib.AROON(rates_frame['high'],
                                                                                  rates_frame['low'], timeperiod=28)
    rates_frame['AROON42_aroondown'], rates_frame['AROON5_aroonup'] = talib.AROON(rates_frame['high'],
                                                                                  rates_frame['low'], timeperiod=42)

    # AROONOSC 计算Aroon-Up和Aroon-Down之间的差异来衡量市场趋势的强度
    rates_frame['AROONOSC5'] = talib.AROONOSC(rates_frame['high'], rates_frame['low'], timeperiod=5)
    rates_frame['AROONOSC8'] = talib.AROONOSC(rates_frame['high'], rates_frame['low'], timeperiod=8)
    rates_frame['AROONOSC14'] = talib.AROONOSC(rates_frame['high'], rates_frame['low'], timeperiod=14)
    rates_frame['AROONOSC28'] = talib.AROONOSC(rates_frame['high'], rates_frame['low'], timeperiod=28)
    rates_frame['AROONOSC42'] = talib.AROONOSC(rates_frame['high'], rates_frame['low'], timeperiod=42)

    # Balance of Power（能量平衡）
    rates_frame['BOP'] = talib.BOP(rates_frame['open'], rates_frame['high'], rates_frame['low'], rates_frame['close'])

    rates_frame['BOP_changeValue1'] = rates_frame['BOP'].shift(1)
    rates_frame['BOP_changeValue1'] = rates_frame['BOP'] - rates_frame['BOP_changeValue1']
    rates_frame['BOP_changeValue2'] = rates_frame['BOP'].shift(2)
    rates_frame['BOP_changeValue2'] = rates_frame['BOP'] - rates_frame['BOP_changeValue2']
    rates_frame['BOP_changeValue3'] = rates_frame['BOP'].shift(3)
    rates_frame['BOP_changeValue3'] = rates_frame['BOP'] - rates_frame['BOP_changeValue3']
    rates_frame['BOP_changeValue5'] = rates_frame['BOP'].shift(5)
    rates_frame['BOP_changeValue5'] = rates_frame['BOP'] - rates_frame['BOP_changeValue5']
    rates_frame['BOP_changeValue10'] = rates_frame['BOP'].shift(10)
    rates_frame['BOP_changeValue10'] = rates_frame['BOP'] - rates_frame['BOP_changeValue10']

    # CMO 钱德动量摆动指标 类似RSI指标
    rates_frame['CMO'] = talib.CMO(rates_frame['close'], timeperiod=14)

    rates_frame['CMO_changeValue1'] = rates_frame['CMO'].shift(1)
    rates_frame['CMO_changeValue1'] = rates_frame['CMO'] - rates_frame['CMO_changeValue1']
    rates_frame['CMO_changeValue2'] = rates_frame['CMO'].shift(2)
    rates_frame['CMO_changeValue2'] = rates_frame['CMO'] - rates_frame['CMO_changeValue2']
    rates_frame['CMO_changeValue3'] = rates_frame['CMO'].shift(3)
    rates_frame['CMO_changeValue3'] = rates_frame['CMO'] - rates_frame['CMO_changeValue3']
    rates_frame['CMO_changeValue5'] = rates_frame['CMO'].shift(5)
    rates_frame['CMO_changeValue5'] = rates_frame['CMO'] - rates_frame['CMO_changeValue5']
    rates_frame['CMO_changeValue10'] = rates_frame['CMO'].shift(10)
    rates_frame['CMO_changeValue10'] = rates_frame['CMO'] - rates_frame['CMO_changeValue10']

    # DX
    rates_frame['DX'] = talib.DX(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=14)

    rates_frame['DX_changeValue1'] = rates_frame['DX'].shift(1)
    rates_frame['DX_changeValue1'] = rates_frame['DX'] - rates_frame['DX_changeValue1']
    rates_frame['DX_changeValue2'] = rates_frame['DX'].shift(2)
    rates_frame['DX_changeValue2'] = rates_frame['DX'] - rates_frame['DX_changeValue2']
    rates_frame['DX_changeValue3'] = rates_frame['DX'].shift(3)
    rates_frame['DX_changeValue3'] = rates_frame['DX'] - rates_frame['DX_changeValue3']
    rates_frame['DX_changeValue5'] = rates_frame['DX'].shift(5)
    rates_frame['DX_changeValue5'] = rates_frame['DX'] - rates_frame['DX_changeValue5']
    rates_frame['DX_changeValue10'] = rates_frame['DX'].shift(10)
    rates_frame['DX_changeValue10'] = rates_frame['DX'] - rates_frame['DX_changeValue10']

    # MFI
    rates_frame['MFI'] = talib.MFI(rates_frame['high'], rates_frame['low'], rates_frame['close'],
                                   rates_frame['tick_volume'], timeperiod=14)

    # MINUS_DI
    rates_frame['MINUS_DI'] = talib.MINUS_DI(rates_frame['high'], rates_frame['low'], rates_frame['close'],
                                             timeperiod=14)

    # MINUS_DI
    rates_frame['MINUS_DM'] = talib.MINUS_DM(rates_frame['high'], rates_frame['low'], timeperiod=14)

    # MOM
    rates_frame['MOM'] = talib.MOM(rates_frame['close'], timeperiod=10)

    # PLUS_DI
    rates_frame['PLUS_DI'] = talib.PLUS_DI(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=14)

    # PLUS_DM
    rates_frame['PLUS_DM'] = talib.PLUS_DM(rates_frame['high'], rates_frame['low'], timeperiod=14)

    # TRIX
    rates_frame['TRIX'] = talib.TRIX(rates_frame['close'], timeperiod=14)

    rates_frame['TRIX_changeValue1'] = rates_frame['TRIX'].shift(1)
    rates_frame['TRIX_changeValue1'] = rates_frame['TRIX'] - rates_frame['TRIX_changeValue1']
    rates_frame['TRIX_changeValue2'] = rates_frame['TRIX'].shift(2)
    rates_frame['TRIX_changeValue2'] = rates_frame['TRIX'] - rates_frame['TRIX_changeValue2']
    rates_frame['TRIX_changeValue3'] = rates_frame['TRIX'].shift(3)
    rates_frame['TRIX_changeValue3'] = rates_frame['TRIX'] - rates_frame['TRIX_changeValue3']
    rates_frame['TRIX_changeValue5'] = rates_frame['TRIX'].shift(5)
    rates_frame['TRIX_changeValue5'] = rates_frame['TRIX'] - rates_frame['TRIX_changeValue5']
    rates_frame['TRIX_changeValue10'] = rates_frame['TRIX'].shift(10)
    rates_frame['TRIX_changeValue10'] = rates_frame['TRIX'] - rates_frame['TRIX_changeValue10']

    # ULTOSC
    rates_frame['ULTOSC'] = talib.ULTOSC(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod1=7,
                                         timeperiod2=14, timeperiod3=28)

    rates_frame['ULTOSC_changeValue1'] = rates_frame['ULTOSC'].shift(1)
    rates_frame['ULTOSC_changeValue1'] = rates_frame['ULTOSC'] - rates_frame['ULTOSC_changeValue1']
    rates_frame['ULTOSC_changeValue2'] = rates_frame['ULTOSC'].shift(2)
    rates_frame['ULTOSC_changeValue2'] = rates_frame['ULTOSC'] - rates_frame['ULTOSC_changeValue2']
    rates_frame['ULTOSC_changeValue3'] = rates_frame['ULTOSC'].shift(3)
    rates_frame['ULTOSC_changeValue3'] = rates_frame['ULTOSC'] - rates_frame['ULTOSC_changeValue3']
    rates_frame['ULTOSC_changeValue5'] = rates_frame['ULTOSC'].shift(5)
    rates_frame['ULTOSC_changeValue5'] = rates_frame['ULTOSC'] - rates_frame['ULTOSC_changeValue5']
    rates_frame['ULTOSC_changeValue10'] = rates_frame['ULTOSC'].shift(10)
    rates_frame['ULTOSC_changeValue10'] = rates_frame['ULTOSC'] - rates_frame['ULTOSC_changeValue10']

    # WILLR
    rates_frame['WILLR'] = talib.WILLR(rates_frame['high'], rates_frame['low'], rates_frame['close'], timeperiod=14)

    rates_frame['WILLR_changeValue1'] = rates_frame['WILLR'].shift(1)
    rates_frame['WILLR_changeValue1'] = rates_frame['WILLR'] - rates_frame['WILLR_changeValue1']
    rates_frame['WILLR_changeValue2'] = rates_frame['WILLR'].shift(2)
    rates_frame['WILLR_changeValue2'] = rates_frame['WILLR'] - rates_frame['WILLR_changeValue2']
    rates_frame['WILLR_changeValue3'] = rates_frame['WILLR'].shift(3)
    rates_frame['WILLR_changeValue3'] = rates_frame['WILLR'] - rates_frame['WILLR_changeValue3']
    rates_frame['WILLR_changeValue5'] = rates_frame['WILLR'].shift(5)
    rates_frame['WILLR_changeValue5'] = rates_frame['WILLR'] - rates_frame['WILLR_changeValue5']
    rates_frame['WILLR_changeValue10'] = rates_frame['WILLR'].shift(10)
    rates_frame['WILLR_changeValue10'] = rates_frame['WILLR'] - rates_frame['WILLR_changeValue10']

    """
    周期指标
    """
    # HT_DCPERIOD 计算特定时间段内的高低价差或价格动量的变化
    rates_frame['HT_DCPERIOD'] = talib.HT_DCPERIOD(rates_frame['close'])

    rates_frame['HT_DCPERIOD_SMA8_changeValue'] = rates_frame['HT_DCPERIOD'] - rates_frame['SMA8']
    rates_frame['HT_DCPERIOD_SMA30_changeValue'] = rates_frame['HT_DCPERIOD'] - rates_frame['SMA30']

    # HT_DCPHASE 掌握主周期的相位角度
    rates_frame['HT_DCPHASE'] = talib.HT_DCPHASE(rates_frame['close'])

    rates_frame['HT_DCPHASE_changeValue1'] = rates_frame['HT_DCPHASE'].shift(1)
    rates_frame['HT_DCPHASE_changeValue1'] = rates_frame['HT_DCPHASE'] - rates_frame['HT_DCPHASE_changeValue1']
    rates_frame['HT_DCPHASE_changeValue2'] = rates_frame['HT_DCPHASE'].shift(2)
    rates_frame['HT_DCPHASE_changeValue2'] = rates_frame['HT_DCPHASE'] - rates_frame['HT_DCPHASE_changeValue2']
    rates_frame['HT_DCPHASE_changeValue3'] = rates_frame['HT_DCPHASE'].shift(3)
    rates_frame['HT_DCPHASE_changeValue3'] = rates_frame['HT_DCPHASE'] - rates_frame['HT_DCPHASE_changeValue3']
    rates_frame['HT_DCPHASE_changeValue5'] = rates_frame['HT_DCPHASE'].shift(5)
    rates_frame['HT_DCPHASE_changeValue5'] = rates_frame['HT_DCPHASE'] - rates_frame['HT_DCPHASE_changeValue5']
    rates_frame['HT_DCPHASE_changeValue10'] = rates_frame['HT_DCPHASE'].shift(10)
    rates_frame['HT_DCPHASE_changeValue10'] = rates_frame['HT_DCPHASE'] - rates_frame['HT_DCPHASE_changeValue10']

    # HT_PHASOR 当实部和虚部的移动平均线交叉时，产生买入或卖出信号
    rates_frame['inhpase'], rates_frame['quadrature'] = talib.HT_PHASOR(rates_frame['close'])
    rates_frame['HT_DCPHASE'] = rates_frame['inhpase'] - rates_frame['quadrature']

    # HT_SINE
    rates_frame['sine'], rates_frame['leadsine'] = talib.HT_SINE(rates_frame['close'])
    rates_frame['HT_SINE'] = rates_frame['sine'] - rates_frame['leadsine']

    # HT_TRENDMODE
    rates_frame['HT_TRENDMODE'] = talib.HT_TRENDMODE(rates_frame['close'])

    """
    统计函数
    """
    # CORREL 皮尔逊相关系数 度量两个变量X和Y之间的相关（线性相关）
    rates_frame["CORREL"] = talib.CORREL(rates_frame['high'], rates_frame['low'], timeperiod=30)

    # LINEARREG 确定两种或两种以上变量间相互依赖的定量关系的一种统计分析方法
    rates_frame["LINEARREG"] = talib.LINEARREG(rates_frame['close'], timeperiod=14)

    # LINEARREG_ANGLE 来确定价格的角度变化
    rates_frame["LINEARREG_ANGLE"] = talib.LINEARREG_ANGLE(rates_frame['close'], timeperiod=14)

    # LINEARREG_INTERCEPT 线性回归截距
    rates_frame["LINEARREG_INTERCEPT"] = talib.LINEARREG_INTERCEPT(rates_frame['close'], timeperiod=14)

    # LINEARREG_SLOPE 线性回归斜率指标
    rates_frame["LINEARREG_SLOPE"] = talib.LINEARREG_SLOPE(rates_frame['close'], timeperiod=14)

    # STDDEV 标准偏差 种量度数据分布的分散程度之标准，用以衡量数据值偏离算术平均值的程度
    rates_frame["STDDEV"] = talib.STDDEV(rates_frame['close'], timeperiod=5, nbdev=1)

    # TSF 时间序列预测 历史引伸预测法
    rates_frame["TSF"] = talib.TSF(rates_frame['close'], timeperiod=14)

    # VAR 方差
    rates_frame["VAR"] = talib.VAR(rates_frame['close'], timeperiod=5, nbdev=1)

    """
    模式识别
    """
    # -100表示出现了较强的2Crows形态，0表示没有出现2Crows形态，100表示出现了较强的反向2Crows形态
    # CDL2CROWS 两只乌鸦 第一天长阳，第二天高开收阴，第三天再次高开继续收阴，收盘比前一日收盘价低
    rates_frame["CDL2CROWS"] = talib.CDL2CROWS(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                               rates_frame['close'])

    # CDL3BLACKCROWS 三只乌鸦  连续三根阴线，每日收盘价都下跌且接近最低价，每日开盘价都在上根K线实体内
    rates_frame["CDL3BLACKCROWS"] = talib.CDL3BLACKCROWS(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDL3INSIDE 三内部上涨和下跌 母子信号+长K线，以三内部上涨为例，K线为阴阳阳，第三天收盘价高于第一天开盘价，第二天K线在第一天K线内部
    rates_frame["CDL3INSIDE"] = talib.CDL3INSIDE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                 rates_frame['close'])

    # CDL3LINESTRIKE 三线打击 前三根阳线，每日收盘价都比前一日高，开盘价在前一日实体内，第四日市场高开，收盘价低于第一日开盘价
    rates_frame["CDL3LINESTRIKE"] = talib.CDL3LINESTRIKE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDL3OUTSIDE 三外部上涨和下跌 K线为阴阳阳，但第一日与第二日的K线形态相反，以三外部上涨为例，第一日K线在第二日K线内部
    rates_frame["CDL3OUTSIDE"] = talib.CDL3OUTSIDE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDL3STARSINSOUTH 南方三星 三日K线皆阴，第一日有长下影线，第二日与第一日类似，K线整体小于第一日，第三日无下影线实体信号，成交价格都在第一日振幅之内
    rates_frame["CDL3STARSINSOUTH"] = talib.CDL3STARSINSOUTH(rates_frame['open'], rates_frame['high'],
                                                             rates_frame['low'], rates_frame['close'])

    # CDL3WHITESOLDIERS 三个白兵 三日K线皆阳，每日收盘价变高且接近最高价，开盘价在前一日实体上半部
    rates_frame["CDL3WHITESOLDIERS"] = talib.CDL3WHITESOLDIERS(rates_frame['open'], rates_frame['high'],
                                                               rates_frame['low'], rates_frame['close'])

    # CDLABANDONEDBABY 弃婴 第二日价格跳空且收十字星（开盘价与收盘价接近，最高价最低价相差不大）
    rates_frame["CDLABANDONEDBABY"] = talib.CDLABANDONEDBABY(rates_frame['open'], rates_frame['high'],
                                                             rates_frame['low'], rates_frame['close'])

    # CDLADVANCEBLOCK 大敌当前 三日都收阳，每日收盘价都比前一日高，开盘价都在前一日实体以内，实体变短，上影线变长
    rates_frame["CDLADVANCEBLOCK"] = talib.CDLADVANCEBLOCK(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                           rates_frame['close'])

    # CDLBELTHOLD 捉腰带线 下跌趋势中，第一日阴线，第二日开盘价为最低价，阳线，收盘价接近最高价
    rates_frame["CDLBELTHOLD"] = talib.CDLBELTHOLD(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDLBREAKAWAY  脱离 下跌趋势中，第一日长阴线，第二日跳空阴线，延续趋势开始震荡，第五日长阳线，收盘价在第一天收盘价与第二天开盘价之间
    rates_frame["CDLBREAKAWAY"] = talib.CDLBREAKAWAY(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                     rates_frame['close'])

    # CDLCLOSINGMARUBOZU  收盘缺影线 最低价低于开盘价，收盘价等于最高价
    rates_frame["CDLCLOSINGMARUBOZU"] = talib.CDLCLOSINGMARUBOZU(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLCONCEALBABYSWALL 藏婴吞没 跌趋势中，前两日阴线无影线，第二日开盘、收盘价皆低于第二日，第三日倒锤头，第四日开盘价高于前一日最高价，收盘价低于前一日最低价
    rates_frame["CDLCONCEALBABYSWALL"] = talib.CDLCONCEALBABYSWALL(rates_frame['open'], rates_frame['high'],
                                                                   rates_frame['low'], rates_frame['close'])

    # CDLCOUNTERATTACK 反击线 二日K线模式，与分离线类似
    rates_frame["CDLCOUNTERATTACK"] = talib.CDLCOUNTERATTACK(rates_frame['open'], rates_frame['high'],
                                                             rates_frame['low'], rates_frame['close'])

    # CDLDARKCLOUDCOVER 乌云压顶 第一日长阳，第二日开盘价高于前一日最高价，收盘价处于前一日实体中部以下
    rates_frame["CDLDARKCLOUDCOVER"] = talib.CDLDARKCLOUDCOVER(rates_frame['open'], rates_frame['high'],
                                                               rates_frame['low'], rates_frame['close'])

    # CDLDOJI  十字 开盘价与收盘价基本相同
    rates_frame["CDLDOJI"] = talib.CDLDOJI(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                           rates_frame['close'])

    # CDLDOJISTAR  十字星 开盘价与收盘价基本相同，上下影线不会很长
    rates_frame["CDLDOJISTAR"] = talib.CDLDOJISTAR(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDLDRAGONFLYDOJI 蜻蜓十字/T形十字 开盘后价格一路走低，之后收复，收盘价与开盘价相同
    rates_frame["CDLDRAGONFLYDOJI"] = talib.CDLDRAGONFLYDOJI(rates_frame['open'], rates_frame['high'],
                                                             rates_frame['low'], rates_frame['close'])

    # CDLENGULFING 吞噬模式 分多头吞噬和空头吞噬，以多头吞噬为例，第一日为阴线，第二日阳线，第一日的开盘价和收盘价在第二日开盘价收盘价之内，但不能完全相同
    rates_frame["CDLENGULFING"] = talib.CDLENGULFING(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                     rates_frame['close'])

    # CDLEVENINGDOJISTAR  十字暮星 基本模式为暮星，第二日收盘价和开盘价相同
    rates_frame["CDLEVENINGDOJISTAR"] = talib.CDLEVENINGDOJISTAR(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLEVENINGSTAR 暮星 与晨星相反，上升趋势中,第一日阳线，第二日价格振幅较小，第三日阴线
    rates_frame["CDLEVENINGSTAR"] = talib.CDLEVENINGSTAR(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDLGAPSIDESIDEWHITE 向上/下跳空并列阳线 上升趋势向上跳空，下跌趋势向下跳空,第一日与第二日有相同开盘价，实体长度差不多，则趋势持续
    rates_frame["CDLGAPSIDESIDEWHITE"] = talib.CDLGAPSIDESIDEWHITE(rates_frame['open'], rates_frame['high'],
                                                                   rates_frame['low'], rates_frame['close'])

    # CDLGRAVESTONEDOJI 墓碑十字/倒T十字 开盘价与收盘价相同，上影线长，无下影线
    rates_frame["CDLGRAVESTONEDOJI"] = talib.CDLGRAVESTONEDOJI(rates_frame['open'], rates_frame['high'],
                                                               rates_frame['low'], rates_frame['close'])

    # CDLHAMMER  锤头 实体较短，无上影线，下影线大于实体长度两倍，处于下跌趋势底部
    rates_frame["CDLHAMMER"] = talib.CDLHAMMER(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                               rates_frame['close'])

    # CDLHANGINGMAN  上吊线  形状与锤子类似，处于上升趋势的顶部
    rates_frame["CDLHANGINGMAN"] = talib.CDLHANGINGMAN(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                       rates_frame['close'])

    # CDLHARAMI 母子线 分多头母子与空头母子，两者相反，以多头母子为例，在下跌趋势中，第一日K线长阴，第二日开盘价收盘价在第一日价格振幅之内，为阳线，预示趋势反转
    rates_frame["CDLHARAMI"] = talib.CDLHARAMI(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                               rates_frame['close'])

    # CDLHARAMICROSS 十字孕线 与母子县类似，若第二日K线是十字线，便称为十字孕线
    rates_frame["CDLHARAMICROSS"] = talib.CDLHARAMICROSS(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDLHIGHWAVE  风高浪大线  三日K线模式，具有极长的上/下影线与短的实体，预示着趋势反转
    rates_frame["CDLHIGHWAVE"] = talib.CDLHIGHWAVE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDLHIKKAKE 陷阱 三日K线模式，与母子类似，第二日价格在前一日实体范围内,第三日收盘价高于前两日，反转失败，趋势继续
    rates_frame["CDLHIKKAKE"] = talib.CDLHIKKAKE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                 rates_frame['close'])

    # CDLHIKKAKEMOD  修正陷阱  三日K线模式，与陷阱类似，上升趋势中，第三日跳空高开；下跌趋势中，第三日跳空低开，反转失败，趋势继续
    rates_frame["CDLHIKKAKEMOD"] = talib.CDLHIKKAKEMOD(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                       rates_frame['close'])

    # CDLHOMINGPIGEON 家鸽 二日K线模式，与母子线类似，不同的的是二日K线颜色相同，第二日最高价、最低价都在第一日实体之内，预示着趋势反转
    rates_frame["CDLHOMINGPIGEON"] = talib.CDLHOMINGPIGEON(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                           rates_frame['close'])

    # CDLIDENTICAL3CROWS 三胞胎乌鸦 三日K线模式，上涨趋势中，三日都为阴线，长度大致相等，每日开盘价等于前一日收盘价，收盘价接近当日最低价，预示价格下跌
    rates_frame["CDLIDENTICAL3CROWS"] = talib.CDLIDENTICAL3CROWS(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLINNECK 颈内线 二日K线模式，下跌趋势中，第一日长阴线，第二日开盘价较低，收盘价略高于第一日收盘价，阳线，实体较短，预示着下跌继续
    rates_frame["CDLINNECK"] = talib.CDLINNECK(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                               rates_frame['close'])

    # CDLINVERTEDHAMMER 倒锤头 一日K线模式，上影线较长，长度为实体2倍以上，无下影线，在下跌趋势底部，预示着趋势反转
    rates_frame["CDLINVERTEDHAMMER"] = talib.CDLINVERTEDHAMMER(rates_frame['open'], rates_frame['high'],
                                                               rates_frame['low'], rates_frame['close'])

    # CDLKICKING 反冲形态 二日K线模式，与分离线类似，两日K线为秃线，颜色相反，存在跳空缺口
    rates_frame["CDLKICKING"] = talib.CDLKICKING(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                 rates_frame['close'])

    # CDLKICKINGBYLENGTH  由较长缺影线决定的反冲形态 二日K线模式，与反冲形态类似，较长缺影线决定价格的涨跌
    rates_frame["CDLKICKINGBYLENGTH"] = talib.CDLKICKINGBYLENGTH(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLLADDERBOTTOM  梯底   五日K线模式，下跌趋势中，前三日阴线，开盘价与收盘价皆低于前一日开盘、收盘价，第四日倒锤头，第五日开盘价高于前一日开盘价，阳线，收盘价高于前几日价格振幅，预示着底部反转
    rates_frame["CDLLADDERBOTTOM"] = talib.CDLLADDERBOTTOM(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                           rates_frame['close'])

    # CDLLONGLEGGEDDOJI 长脚十字 一日K线模式，开盘价与收盘价相同居当日价格中部，上下影线长，表达市场不确定性
    rates_frame["CDLLONGLEGGEDDOJI"] = talib.CDLLONGLEGGEDDOJI(rates_frame['open'], rates_frame['high'],
                                                               rates_frame['low'], rates_frame['close'])

    # CDLLONGLINE 长蜡烛 一日K线模式，K线实体长，无上下影线
    rates_frame["CDLLONGLINE"] = talib.CDLLONGLINE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDLMARUBOZU  光头光脚/缺影线  一日K线模式，上下两头都没有影线的实体，阴线预示着熊市持续或者牛市反转，阳线相反
    rates_frame["CDLMARUBOZU"] = talib.CDLMARUBOZU(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDLMATCHINGLOW 相同低价 二日K线模式，下跌趋势中，第一日长阴线，第二日阴线，收盘价与前一日相同，预示底部确认，该价格为支撑位
    rates_frame["CDLMATCHINGLOW"] = talib.CDLMATCHINGLOW(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDLMATHOLD 铺垫  五日K线模式，上涨趋势中，第一日阳线，第二日跳空高开影线，第三、四日短实体影线，第五日阳线，收盘价高于前四日，预示趋势持续
    rates_frame["CDLMATHOLD"] = talib.CDLMATHOLD(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                 rates_frame['close'])

    # CDLMORNINGDOJISTAR  十字晨星 三日K线模式，基本模式为晨星，第二日K线为十字星
    rates_frame["CDLMORNINGDOJISTAR"] = talib.CDLMORNINGDOJISTAR(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLMORNINGSTAR  晨星  三日K线模式，下跌趋势，第一日阴线，第二日价格振幅较小，第三天阳线
    rates_frame["CDLMORNINGSTAR"] = talib.CDLMORNINGSTAR(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDLONNECK 颈上线 二日K线模式，下跌趋势中，第一日长阴线，第二日开盘价较低，收盘价与前一日最低价相同，阳线，实体较短
    rates_frame["CDLONNECK"] = talib.CDLONNECK(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                               rates_frame['close'])

    # CDLPIERCING 刺透形态 两日K线模式，下跌趋势中，第一日阴线，第二日收盘价低于前一日最低价，收盘价处在第一日实体上部
    rates_frame["CDLPIERCING"] = talib.CDLPIERCING(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                   rates_frame['close'])

    # CDLRICKSHAWMAN  黄包车夫  一日K线模式，与长腿十字线类似，若实体正好处于价格振幅中点
    rates_frame["CDLRICKSHAWMAN"] = talib.CDLRICKSHAWMAN(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDLRISEFALL3METHODS  上升/下降三法  五日K线模式，以上升三法为例，上涨趋势中，第一日长阳线，中间三日价格在第一日范围内小幅震荡，第五日长阳线，收盘价高于第一日收盘价
    rates_frame["CDLRISEFALL3METHODS"] = talib.CDLRISEFALL3METHODS(rates_frame['open'], rates_frame['high'],
                                                                   rates_frame['low'], rates_frame['close'])

    # CDLSEPARATINGLINES  分离线  二日K线模式，上涨趋势中，第一日阴线，第二日阳线，第二日开盘价与第一日相同且为最低价，预示着趋势继续
    rates_frame["CDLSEPARATINGLINES"] = talib.CDLSEPARATINGLINES(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLSHOOTINGSTAR  射击之星 一日K线模式，上影线至少为实体长度两倍，没有下影线，预示着股价下跌
    rates_frame["CDLSHOOTINGSTAR"] = talib.CDLSHOOTINGSTAR(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                           rates_frame['close'])

    # CDLSHORTLINE 短蜡烛 一日K线模式，实体短，无上下影线
    rates_frame["CDLSHORTLINE"] = talib.CDLSHORTLINE(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                     rates_frame['close'])

    # CDLSPINNINGTOP  纺锤 一日K线，实体小
    rates_frame["CDLSPINNINGTOP"] = talib.CDLSPINNINGTOP(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                         rates_frame['close'])

    # CDLSTALLEDPATTERN 停顿形态 三日K线模式，上涨趋势中，第二日长阳线，第三日开盘于前一日收盘价附近，短阳线，预示着上涨结束
    rates_frame["CDLSTALLEDPATTERN"] = talib.CDLSTALLEDPATTERN(rates_frame['open'], rates_frame['high'],
                                                               rates_frame['low'], rates_frame['close'])

    # CDLSTICKSANDWICH 条形三明治 三日K线模式，第一日长阴线，第二日阳线，开盘价高于前一日收盘价，第三日开盘价高于前两日最高价，收盘价于第一日收盘价相同
    rates_frame["CDLSTICKSANDWICH"] = talib.CDLSTICKSANDWICH(rates_frame['open'], rates_frame['high'],
                                                             rates_frame['low'], rates_frame['close'])

    # CDLTAKURI 探水竿 一日K线模式，大致与蜻蜓十字相同，下影线长度长
    rates_frame["CDLTAKURI"] = talib.CDLTAKURI(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                               rates_frame['close'])

    # CDLTASUKIGAP 跳空并列阴阳线 三日K线模式，分上涨和下跌，以上升为例，前两日阳线，第二日跳空，第三日阴线，收盘价于缺口中，上升趋势持续
    rates_frame["CDLTASUKIGAP"] = talib.CDLTASUKIGAP(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                     rates_frame['close'])

    # CDLTHRUSTING 插入 二日K线模式，与颈上线类似，下跌趋势中，第一日长阴线，第二日开盘价跳空，收盘价略低于前一日实体中部，与颈上线相比实体较长，预示着趋势持续
    rates_frame["CDLTHRUSTING"] = talib.CDLTHRUSTING(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                     rates_frame['close'])

    # CDLTRISTAR 三星 三日K线模式，由三个十字组成，第二日十字必须高于或者低于第一日和第三日，预示着反转
    rates_frame["CDLTRISTAR"] = talib.CDLTRISTAR(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                 rates_frame['close'])

    # CDLUNIQUE3RIVER 奇特三河床 三日K线模式，下跌趋势中，第一日长阴线，第二日为锤头，最低价创新低，第三日开盘价低于第二日收盘价，收阳线，收盘价不高于第二日收盘价，预示着反转，第二日下影线越长可能性越大
    rates_frame["CDLUNIQUE3RIVER"] = talib.CDLUNIQUE3RIVER(rates_frame['open'], rates_frame['high'], rates_frame['low'],
                                                           rates_frame['close'])

    # CDLUPSIDEGAP2CROWS 向上跳空的两只乌鸦 三日K线模式，第一日阳线，第二日跳空以高于第一日最高价开盘，收阴线，第三日开盘价高于第二日，收阴线，与第一日比仍有缺口
    rates_frame["CDLUPSIDEGAP2CROWS"] = talib.CDLUPSIDEGAP2CROWS(rates_frame['open'], rates_frame['high'],
                                                                 rates_frame['low'], rates_frame['close'])

    # CDLXSIDEGAP3METHODS 上升/下降跳空三法 五日K线模式，以上升跳空三法为例，上涨趋势中，第一日长阳线，第二日短阳线，第三日跳空阳线，第四日阴线，开盘价与收盘价于前两日实体内，第五日长阳线，收盘价高于第一日收盘价，预示股价上升
    rates_frame["CDLXSIDEGAP3METHODS"] = talib.CDLXSIDEGAP3METHODS(rates_frame['open'], rates_frame['high'],
                                                                   rates_frame['low'], rates_frame['close'])

    # 剔除因为计算而造成的NULL
    rates_frame = rates_frame.dropna(axis=0)
    # 重置索引
    rates_frame = rates_frame.reset_index(drop=True)

    return rates_frame

# """
# 价格转换
# """
# # AVGPRICE 平均价格函数
# rates_frame['AVGPRICE'] = talib.stream_AVGPRICE(rates_frame['open'], rates_frame['high'], rates_frame['low'], rates_frame['close'])
#
# # MEDPRICE 中位数价格
# rates_frame['MEDPRICE'] = talib.stream_MEDPRICE(rates_frame['high'], rates_frame['low'])
#
# # TYPPRICE 代表性价格
# rates_frame['TYPPRICE'] = talib.stream_TYPPRICE(rates_frame['high'], rates_frame['low'], rates_frame['close'])
#
# # WCLPRICE 代表性价格
# rates_frame['WCLPRICE'] = talib.stream_WCLPRICE(rates_frame['high'], rates_frame['low'], rates_frame['close'])
