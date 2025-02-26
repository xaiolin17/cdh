//+------------------------------------------------------------------+
//|                                                  DataSaveAll.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <KData\StructAll.mqh>
//+------------------------------------------------------------------+
//|                  保存为二进制文件                                |
//+------------------------------------------------------------------+
bool saveFile(KCandle &KData[])
  {
// 创建或打开文件
   ArrayPrint(KData);
   ResetLastError();
   int file_handle = FileOpen("Kdata_bin", FILE_WRITE|FILE_BIN);
   if(file_handle != INVALID_HANDLE)
     {
      // 写入数据到文件
      //
      printf("写入KData数据");
      uint counter=0;
      int len = ArraySize(KData);
      for(int i = 0; i <len ; i++)
        {

         counter+=FileWriteStruct(file_handle,KData[i],756);

        }
      printf("已写入长度：%d",counter);
      // 关闭文件
      FileClose(file_handle);

      printf("文件保存成功");
     }
   else
     {
      printf("无法打开或创建文件");
     }

   return true;
  }

//+------------------------------------------------------------------+
//|      返回订单类型字符串名称      getHistoryDealsData()           |
//+------------------------------------------------------------------+
string GetOrderType(long type)
  {
   string str_type="unknown operation";
   switch(type)
     {
      case(ORDER_TYPE_BUY):
         return("buy");
      case(ORDER_TYPE_SELL):
         return("sell");
      case(ORDER_TYPE_BUY_LIMIT):
         return("buy limit");
      case(ORDER_TYPE_SELL_LIMIT):
         return("sell limit");
      case(ORDER_TYPE_BUY_STOP):
         return("buy stop");
      case(ORDER_TYPE_SELL_STOP):
         return("sell stop");
      case(ORDER_TYPE_BUY_STOP_LIMIT):
         return("buy stop limit");
      case(ORDER_TYPE_SELL_STOP_LIMIT):
         return("sell stop limit");
     }
   return(str_type);
  }

//+------------------------------------------------------------------+
//|                    获取历史交易明细                              |
//+------------------------------------------------------------------+
bool getHistoryDealsData()
  {
//--- 要求全部历史记录
   HistorySelect(0,TimeCurrent());
//--- 返回订单属性值变量
   ulong    ticket;
   double   open_price;
   double   sl_price;
   double   tp_price;
   double   initial_volume;
   datetime time_setup;
   datetime time_done;
   string   symbol;
   string   type;
   long     positionID;
//--- 当前挂单数量
   uint     total=HistoryOrdersTotal();
//--- 循环检测通过订单
   int file_handle = FileOpen("HistoryDealsDataTable.csv", FILE_WRITE|FILE_CSV);
   FileWrite(file_handle, "时间", "交易品种", "类型", "订单规定价格", "订单交易量", "斩仓值", "盈利值", "订单ID", "执行或取消时间");
   for(uint i=0; i<total; i++)
     {
      //--- 通过其列表中的位置返回订单报价
      if((ticket=HistoryOrderGetTicket(i))>0)
        {
         //--- 返回订单属性
         //下单时间
         time_setup= (datetime)HistoryOrderGetInteger(ticket,ORDER_TIME_SETUP);
         //交易品种
         symbol=           HistoryOrderGetString(ticket,ORDER_SYMBOL);
         //类型
         type=GetOrderType(HistoryOrderGetInteger(ticket,ORDER_TYPE));
         // 订单规定价格
         open_price=       HistoryOrderGetDouble(ticket,ORDER_PRICE_OPEN);
         //订单交易量
         initial_volume=   HistoryOrderGetDouble(ticket,ORDER_VOLUME_INITIAL);
         // 斩仓值
         sl_price=       HistoryOrderGetDouble(ticket,ORDER_SL);
         // 盈利值
         tp_price=       HistoryOrderGetDouble(ticket,ORDER_TP);
         //订单ID
         positionID =      HistoryOrderGetInteger(ticket,ORDER_POSITION_ID);
         //执行或取消时间
         time_done= (datetime)HistoryOrderGetInteger(ticket,ORDER_TIME_DONE);

         FileWrite(file_handle,time_setup,symbol,type,open_price,initial_volume,sl_price,tp_price,positionID,time_done);
        }
     }
// 关闭文件
   FileClose(file_handle);

   return true;
  }
//+------------------------------------------------------------------+
