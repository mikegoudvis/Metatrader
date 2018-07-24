//+------------------------------------------------------------------+
//|                                                  MarketWatch.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <stdlib.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class MarketWatch
  {
public:
   static bool       DoesSymbolExist(string symbol,bool useMarketWatchOnly);
   static bool       IsSymbolWatched(string symbolName);
   static bool       AddSymbolToMarketWatch(string symbolName);
   static bool       RemoveSymbolFromMarketWatch(string symbolName);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
static bool MarketWatch::DoesSymbolExist(string symbol,bool useMarketWatchOnly=false)
  {
   bool out=false;
   int ct=SymbolsTotal(useMarketWatchOnly);
   for(int i=0; i<ct; i++)
     {
      if(symbol==SymbolName(i,useMarketWatchOnly))
        {
         out=true;
        }
     }
   return out;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool MarketWatch::IsSymbolWatched(string symbolName)
  {
   return DoesSymbolExist(symbolName,true);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool MarketWatch::AddSymbolToMarketWatch(string symbolName)
  {
   bool result=false;
   if(IsSymbolWatched(symbolName))
     {
      result=true;
     }
   else if(DoesSymbolExist(symbolName))
     {
      result=SymbolSelect(symbolName,true);
     }
   return result;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool MarketWatch::RemoveSymbolFromMarketWatch(string symbolName)
  {
   bool result=false;
   if(!IsSymbolWatched(symbolName))
     {
      result=true;
     }
   else
     {
      result=SymbolSelect(symbolName,false);
     }
   return result;
  }
//+------------------------------------------------------------------+
