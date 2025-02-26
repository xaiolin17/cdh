//#resource "smallModel.onnx" as uchar ExtModel[]// 作为资源的模型

#include <GetAllData\cycleUseData.mqh>
#include <GetAllData\useDataG.mqh>

long handle;         // 模型句柄
int handle_bin;

const long   ExtInputShape[] = {1,4825};    // 模型输出形状
const long   ExtOutputShape [] = {2}; // 模型输入形状
//时间变化判断
datetime time_change = TimeCurrent();

string index_dorp_M5[];
string index_dorp_M15[];
string index_dorp_H1[];
string index_dorp_D1[];
//shift
int kdata_shift_num = 1;
//count
int copy_count_num =  20;
//历史最大最小值
double high_history_arr[];
double low_history_arr[];

double history_min_0 = 0;
double history_max_0 = 0;

double high_history_M15_arr[];
double low_history_M15_arr[];
double history_M15_min_0 = 0;
double history_M15_max_0 = 0;

double high_history_M30_arr[];
double low_history_M30_arr[];
double history_M30_min_0 = 0;
double history_M30_max_0 = 0;

double high_history_H1_arr[];
double low_history_H1_arr[];
double history_H1_min_0 = 0;
double history_H1_max_0 = 0;

double high_history_D1_arr[];
double low_history_D1_arr[];
double history_D1_min_0 = 0;
double history_D1_max_0 = 0;
/*
string drop_list[] = {"time", "volume",
                      "fractals_up_arrow", "fractals_down_arrow", "open", "high", "low", "close",
                      "sma5", "sma10", "ema5", "ema10", "smma5", "smma10", "lwma5", "lwma10",
                      "boll_upper_band", "boll_middle_band", "boll_lower_band", "jaws", "teeth", "lips",
                      "ama", "dema", "envelopes_upper_value", "envelopes_lower_value", "frAMA", "gator_ups",
                      "gator_downs",
                      "tenkan_sen", "kijun_sen", "senkou_span_A", "senkou_span_B", "chinkou_span", "osMA", "tema",
                      "vidya"
                     };

struct OutputStruct
  {
   long              array1[2];
   float             array2[2];
  };
  */
//+------------------------------------------------------------------+
//| EA交易初始化函数                                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   for(int i=2; i<121; i++)
     {
      double high_temporary = iHigh(Symbol(), PERIOD_CURRENT, i);
      double low_temporary = iLow(Symbol(), PERIOD_CURRENT, i);
      ArrayResize(high_history_arr, ArraySize(high_history_arr) + 1);
      high_history_arr[ArraySize(high_history_arr) - 1] = high_temporary;
      ArrayResize(low_history_arr, ArraySize(low_history_arr) + 1);
      low_history_arr[ArraySize(low_history_arr) - 1] = low_temporary;

      high_temporary = iHigh(Symbol(), PERIOD_M15, i);
      low_temporary = iLow(Symbol(), PERIOD_M15, i);
      ArrayResize(high_history_M15_arr, ArraySize(high_history_M15_arr) + 1);
      high_history_M15_arr[ArraySize(high_history_M15_arr) - 1] = high_temporary;
      ArrayResize(low_history_M15_arr, ArraySize(low_history_M15_arr) + 1);
      low_history_M15_arr[ArraySize(low_history_M15_arr) - 1] = low_temporary;

      high_temporary = iHigh(Symbol(), PERIOD_M30, i);
      low_temporary = iLow(Symbol(), PERIOD_M30, i);
      ArrayResize(high_history_M30_arr, ArraySize(high_history_M30_arr) + 1);
      high_history_M30_arr[ArraySize(high_history_M30_arr) - 1] = high_temporary;
      ArrayResize(low_history_M30_arr, ArraySize(low_history_M30_arr) + 1);
      low_history_M30_arr[ArraySize(low_history_M30_arr) - 1] = low_temporary;

      high_temporary = iHigh(Symbol(), PERIOD_H1, i);
      low_temporary = iLow(Symbol(), PERIOD_H1, i);
      ArrayResize(high_history_H1_arr, ArraySize(high_history_H1_arr) + 1);
      high_history_H1_arr[ArraySize(high_history_H1_arr) - 1] = high_temporary;
      ArrayResize(low_history_H1_arr, ArraySize(low_history_H1_arr) + 1);
      low_history_H1_arr[ArraySize(low_history_H1_arr) - 1] = low_temporary;

      high_temporary = iHigh(Symbol(), PERIOD_D1, i);
      low_temporary = iLow(Symbol(), PERIOD_D1, i);
      ArrayResize(high_history_D1_arr, ArraySize(high_history_D1_arr) + 1);
      high_history_D1_arr[ArraySize(high_history_D1_arr) - 1] = high_temporary;
      ArrayResize(low_history_D1_arr, ArraySize(low_history_D1_arr) + 1);
      low_history_D1_arr[ArraySize(low_history_D1_arr) - 1] = low_temporary;
     };
   /*
      string filename = "breast_cancer.onnx";
   //--- 创建模型
      handle=OnnxCreate(filename,ONNX_DEBUG_LOGS);
      */
   /*
   //--- 创建模型
      handle=OnnxCreateFromBuffer(ExtModel,ONNX_DEBUG_LOGS);

      Print(handle);
      Print("Onnx Input OnnxGetInputCount:   ", OnnxGetInputCount(handle));
      Print("Onnx Output OnnxGetOutputCount:  ", OnnxGetOutputCount(handle));

   //--- 指定输入数据形状
      if(!OnnxSetInputShape(handle,0,ExtInputShape))
        {
         Print("OnnxSetInputShape failed, error ",GetLastError());

         return(-1);
        }
   //--- 指定输出数据形状
      if(!OnnxSetOutputShape(handle,0,ExtOutputShape))
        {
         Print("OnnxSetOutputShape failed, error ",GetLastError());

         return(-1);
        }
   */
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| EA交易去初始化函数                                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- 关闭ONNX会话
//OnnxRelease(handle);
  }

//+------------------------------------------------------------------+
//| EA报价函数                                                        |
//+------------------------------------------------------------------+
void OnTick()
  {
   
   //--- 判定时间变动 M5
      datetime time_change_tick = iTime(NULL,PERIOD_H1,0);
      if(time_change == time_change_tick)
        {
         return;
        }
      time_change = time_change_tick;
   
   double data_M5_list[];
   double data_M15_list[];
   double data_M30_list[];
   double data_H1_list[];
   double data_D1_list[];

//--- 主时间段
   useDATA(PERIOD_CURRENT, kdata_shift_num, copy_count_num, history_min_0, history_max_0, high_history_arr, low_history_arr, data_M5_list);
//Print("data_M5_list ", ArraySize(data_M5_list));

//多周期数据
   cycUseDATA(PERIOD_M15,kdata_shift_num,copy_count_num,history_M15_min_0,history_M15_max_0,high_history_M15_arr,low_history_M15_arr, data_M15_list);
//Print("data_M15_list ", ArraySize(data_M15_list));

//cycUseDATA(PERIOD_M30,kdata_shift_num,copy_count_num,history_M30_min_0,history_M30_max_0,high_history_M30_arr,low_history_M30_arr, data_M30_list);
   cycUseDATA(PERIOD_H1,kdata_shift_num,copy_count_num,history_H1_min_0,history_H1_max_0,high_history_H1_arr,low_history_H1_arr, data_H1_list);
//Print("data_H1_list ", ArraySize(data_H1_list));

   cycUseDATA(PERIOD_D1,kdata_shift_num,copy_count_num,history_D1_min_0,history_D1_max_0,high_history_D1_arr,low_history_D1_arr, data_D1_list);
//Print("data_D1_list ", ArraySize(data_D1_list));


// 创建合并后的数组
   double mergedArray[4825];
   int index_num = 0;

// 将array1的元素复制到mergedArray
   for(int i = 0; i < ArraySize(data_M5_list); i++)
     {
      mergedArray[index_num++] = data_M5_list[i];
     }

// 将array2的元素复制到mergedArray
   for(int i = 0; i < ArraySize(data_M15_list); i++)
     {
      mergedArray[index_num++] = data_M15_list[i];
     }

//
   for(int i = 0; i < ArraySize(data_H1_list); i++)
     {
      mergedArray[index_num++] = data_H1_list[i];
     }

//
   for(int i = 0; i < ArraySize(data_D1_list); i++)
     {
      mergedArray[index_num++] = data_D1_list[i];
     }
     
   handle_bin = FileOpen("DataBin.bin",FILE_READ|FILE_WRITE|FILE_BIN);
   FileWriteArray(handle_bin,mergedArray,0,4825);
//--- 关闭文件
   FileClose(handle_bin);

   Print("FileWriteArray ArraySize(mergedArray)", ArraySize(mergedArray));


//Print("index_num", index_num);
//ArrayPrint(mergedArray);
   /*
   //---输入数据
   //vector  x_norm(4825);
      matrix x_norm;
      vector vector_norm(4825);
   //--- 在这里获取模型的输出数据，即价格预测
      vector y_norm1(2);
      vector y_norm3(2);
      bool aaa;
      //float y_norm2[2];
   //   vector y_norm2();
      OutputStruct  y_norm2[2];

      for(int i = 0; i < 4825; i++)
        {
         vector_norm[i] = mergedArray[i];
        }

      Print("vector_norm ", vector_norm);
      x_norm.Row(vector_norm, 0);
      Print("x_norm ", x_norm);

   //--- 运行模型
      if(!OnnxRun(handle, ONNX_DEBUG_LOGS, x_norm, y_norm1, y_norm2))
        {
         Print("OnnxRun failed, error ", GetLastError());
        }

   //--- 如果outputData大于某个阈值，则执行相关操作
      if(1)
        {
         //--- 执行相关操作
         Print("y_norm  ");
        // Print(y_norm1);
       //  Print(y_norm2);
        }
        */
   ArrayFree(data_M5_list);
   ArrayFree(data_M15_list);
   ArrayFree(data_H1_list);
   ArrayFree(data_D1_list);

  }
//+------------------------------------------------------------------+
