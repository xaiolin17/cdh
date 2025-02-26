#resource "breast_cancer.onnx" as uchar ExtModel[];// 作为资源的模型 
#include <GetAllData\Dict.mqh>
#include <GetAllData\StructAll.mqh>
#include <GetAllData\CurrentAssignmentStruct.mqh>
#include <GetAllData\AssignmentCycle.mqh>


long handle;         // 模型句柄
ulong predictions=0;
//时间变化判断
datetime time_change = TimeCurrent();


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

// 声明K线数据数组
KCandle KData_struct_arr[];

CycleData Cycle15M_struct_arr[];
CycleData Cycle30M_struct_arr[];
CycleData Cycle1H_struct_arr[];
CycleData Cycle1D_struct_arr[];

const long ExtInputShape[] = {1, 7};    // 模型输入形状
const long ExtOutputShape[] = {1, 1};   // 模型输出形状
//+------------------------------------------------------------------+
//| EA交易初始化函数                                                   |
//+------------------------------------------------------------------+
int OnInit()
  {

   for(int i=2;i<121;i++)
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


//--- 创建模型
   handle=OnnxCreateFromBuffer(ExtModel,ONNX_DEBUG_LOGS);
   Print("Onnx Input Shape",OnnxGetInputCount(handle));

   Print("Onnx Output Shape",OnnxGetOutputCount(handle));

//--- 基本检查
   if(_Symbol != "XAUUSD")
     {
      Print("Symbol must be XAUUSD, testing aborted");
      return (-1);
     }
   /*
     if (_Period != PERIOD_H1)
     {
        Print("Timeframe must be H1, testing aborted");
        return (-1);
     }
   */

//--- 指定输入数据形状
   if(!OnnxSetInputShape(handle, 0, ExtInputShape))
     {
      Print("OnnxSetInputShape failed, error ", GetLastError());
      OnnxRelease(handle);
      return (-1);
     }

//--- 指定输出数据形状
   if(!OnnxSetOutputShape(handle, 0, ExtOutputShape))
     {
      Print("OnnxSetOutputShape failed, error ", GetLastError());
      OnnxRelease(handle);
      return (-1);
     }

   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| EA交易去初始化函数                                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- 关闭ONNX会话
   OnnxRelease(handle);
  }

//+------------------------------------------------------------------+
//| EA报价函数                                                        |
//+------------------------------------------------------------------+
void OnTick()
  {

   static datetime open_time=0;

//--- 判定时间变动 M5
   datetime time_change_tick = iTime(NULL,PERIOD_M5,0);
   if(time_change == time_change_tick)
     {
      return;
     }
   time_change = time_change_tick;

//---输入数据
   matrixf x_normf;
//--- 在这里获取模型的输出数据，即价格预测
   vectorf y_norm(1);

   KeyValueDict dict;
//--- 主时间段
   CurrentDepositData(PERIOD_CURRENT, kdata_shift_num, copy_count_num, history_min_0, history_max_0, high_history_arr, low_history_arr, KData_struct_arr, dict);

//--- 运行模型
   if(!OnnxRun(handle,ONNX_DEBUG_LOGS | ONNX_NO_CONVERSION,x_normf,y_norm))
     {
      Print("OnnxRun failed, error ",GetLastError());
     }


//--- 如果outputData大于某个阈值，则执行相关操作
   if(y_norm)
     {
      //--- 执行相关操作

     }

   /*
   //--- 获取最后两个已完成柱形图的收盘价
      double close[];
      int recieved=CopyClose(_Symbol,_Period,1,2,close);
      if(recieved!=2)
        {
         PrintFormat("CopyClose(2 bars) failed, error %d",GetLastError());
         return;
        }

   //--- 计算新柱形图上的收盘价，以验证下一个柱形图上的价格
      matrix rates;
   //--- 获取10个柱形图
      if(!rates.CopyRates("EURUSD",PERIOD_H1,COPY_RATES_OHLC,1,10))
         return;
   //--- 输入一组OHLC向量
      matrix x_norm=rates.Transpose();
      vector m=x_norm.Mean(0);
      vector s=x_norm.Std(0);
      matrix mm(10,4);
      matrix ms(10,4);
   //--- 填充归一化矩阵
      for(int i=0; i<10; i++)
        {
         mm.Row(m,i);
         ms.Row(s,i);
        }
   //--- 标准化输入数据
      x_norm-=mm;
      x_norm/=ms;
   //--- 将标准化输入数据转换为浮点类型
      matrixf x_normf;
      x_normf.Assign(x_norm);
   //--- 在这里获取模型的输出数据，即价格预测
      vectorf y_norm(1);

   //--- 运行模型
      if(!OnnxRun(handle,ONNX_DEBUG_LOGS | ONNX_NO_CONVERSION,x_normf,y_norm))
        {
         Print("OnnxRun failed, error ",GetLastError());
        }

   //--- 进行反向转换，以获得预测价格
      predict=y_norm[0]*s[3]+m[3];
   */
  }
//+------------------------------------------------------------------+
