//+------------------------------------------------------------------+
//|                                                            .mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| 标准库包含                                                       |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>

//+------------------------------------------------------------------+
//| 全局变量                                                         |
//+------------------------------------------------------------------+

// 定义结构体保存K线数据信息
struct KCandle
  {
   datetime          time;    // 时间
   double            open;      // 开盘价
   double            high;      // 最高价
   double            low;       // 最低价
   double            close;     // 收盘价
   long              volume;      // 成交量
  };
// 声明K线数据数组
KCandle KData[];

//+------------------------------------------------------------------+
//|    初始化                                                        |
//+------------------------------------------------------------------+
int OnInit()
  {
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| 结束操作                                                         |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
// 创建或打开文件
   ArrayPrint(KData);
   ResetLastError();
   int file_handle = FileOpen("0906_FileWriteStruct.csv", FILE_READ|FILE_WRITE|FILE_CSV);
   if(file_handle != INVALID_HANDLE)
     {
      // 写入数据到文件
      //
      printf("准备写入数据");
      //--- 准备字节数量的计数器
      uint counter=0;

      for(int i = 0; i < ArraySize(KData); i++)
        {
         counter+=FileWriteStruct(file_handle,KData[i]);
         printf("已写入长度：%d",counter);
        }
      // 关闭文件
      FileClose(file_handle);

      printf("文件保存成功");
     }
   else
     {
      printf("无法打开或创建文件");
     }
  }


//+------------------------------------------------------------------+
//| 主函数                                                           |
//+------------------------------------------------------------------+
void OnTick()
  {


// 获取当前K线数据
   KCandle currentCandle;
   currentCandle.time = TimeCurrent();
   currentCandle.open = iOpen(Symbol(), PERIOD_D1, 0);
   currentCandle.high = iHigh(Symbol(), PERIOD_D1, 0);
   currentCandle.low = iLow(Symbol(), PERIOD_D1, 0);
   currentCandle.close = iClose(Symbol(), PERIOD_D1, 0);
   currentCandle.volume = iVolume(Symbol(), PERIOD_D1, 0);
// 保存K线数据
// 动态数组
   ArrayResize(KData, ArraySize(KData) + 1);
   KData[ArraySize(KData) - 1] = currentCandle;
   printf("数据KData");
//printf("数据长度%d--ERROR:%d",counter,GetLastError());

  }


//+------------------------------------------------------------------+
