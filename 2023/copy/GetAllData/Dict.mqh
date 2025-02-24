//+------------------------------------------------------------------+
//|                                                         Dict.mqh |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class KeyValueDict
  {
public:

   struct KeyValue
     {
      string         key;
      double         value;
     };

   KeyValue          dict_arr[];


   // 添加元素到字典
   void              AddToDict(string key, double value)
     {
      KeyValue kv;
      kv.key = key;
      kv.value = value;
      ArrayResize(dict_arr, ArraySize(dict_arr) + 1);
      dict_arr[ArraySize(dict_arr) - 1] = kv;
     }

   // 根据键获取字典中的值
   double            GetValueFromDict(string key)
     {
      for(int i = 0; i < ArraySize(dict_arr); i++)
        {
         if(dict_arr[i].key == key)
            return dict_arr[i].value;
        }
      return -1; // 没有找到对应的键
     }

   // 删除指定键的元素
   void              RemoveFromDict(string key)
     {
      for(int i = 0; i < ArraySize(dict_arr); i++)
        {
         if(dict_arr[i].key == key)
           {
            // 将该元素移除
            for(int j = i; j < ArraySize(dict_arr) - 1; j++)
              {
               dict_arr[j] = dict_arr[j + 1];
              }
            ArrayResize(dict_arr, ArraySize(dict_arr) - 1);
           }
        }
     }

   // 将另一个字典合并到当前字典中
   void              MergeWithDict(const KeyValueDict &otherDict)
     {
      for(int i = 0; i < ArraySize(otherDict.dict_arr); i++)
        {
         KeyValue kv = otherDict.dict_arr[i];
         AddToDict(kv.key, kv.value);
        }
     }

  };

/*
//--字典删除元素
void dropKey(KeyValueDict &dict_curr, string &drop_list[], string &index_dorp[])
  {

   for(int i = 0; i < ArraySize(dict_curr.dict_arr); i++)
     {
      // Print("dict_curr.dict_arr   ",ArraySize(dict_curr.dict_arr));

      for(int j = 0; j < ArraySize(drop_list); j++)
        {
         // Print("drop_list   ", ArraySize(drop_list));
         if( StringCompare(dict_curr.dict_arr[i].key, drop_list[j]) == 0)
           {
            // 要剔除的key
            ArrayResize(index_dorp, ArraySize(index_dorp) + 1);
            index_dorp[ArraySize(index_dorp) - 1] = drop_list[j];
            break;
           }
        }
     }
   Print("index_dorp", ArraySize(index_dorp));
   for(int i = 0; i < ArraySize(index_dorp); i++)
     {
      dict_curr.RemoveFromDict(index_dorp[i]);
     }

  }
*/

// 示例用法
/*
void OnStart()
{
    KeyValueDict dict1;
    KeyValueDict dict2;

    dict1.AddToDict("key1", 10);
    dict1.AddToDict("key2", 20);

    dict2.AddToDict("key3", 30);
    dict2.AddToDict("key4", 40);

    dict1.MergeWithDict(dict2);

    int value = dict1.GetValueFromDict("key4");
    Print("Value: ", value); // 输出：Value: 40
}
*/

//+------------------------------------------------------------------+
