//+------------------------------------------------------------------+
//|                                                 ExtremeBreak.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <Common\Comparators.mqh>
#include <Signals\AbstractSignal.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class ExtremeBreak : public AbstractSignal
  {
private:
   Comparators       compare;
public:
   double            Low;
   double            High;
   double            Open;
                     ExtremeBreak(int period,string symbol,ENUM_TIMEFRAMES timeframe,int shift);
   bool              Validate(ValidationResult *v);
   int               Analyze();
   int               Analyze(int shift);
  };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ExtremeBreak::ExtremeBreak(int period,string symbol,ENUM_TIMEFRAMES timeframe,int shift=2)
  {
   this.Period=period;
   this.Symbol=symbol;
   this.Timeframe=timeframe;
   this.Shift=shift;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ExtremeBreak::Analyze()
  {
   this.Analyze(this.Shift);
   return this.Signal;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ExtremeBreak::Validate(ValidationResult *v)
  {
   v.Result=true;

   if(!compare.IsNotBelow(this.Period,1))
     {
      v.Result=false;
      v.AddMessage("Period must be 1 or greater.");
     }

   if(!compare.IsNotBelow(this.Shift,0))
     {
      v.Result=false;
      v.AddMessage("Shift must be 0 or greater.");
     }

   return v.Result;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ExtremeBreak::Analyze(int shift)
  {
   this.Signal=0;
   this.Low  = iLow(this.Symbol, this.Timeframe, iLowest(this.Symbol,this.Timeframe,MODE_LOW,this.Period,shift));
   this.High = iHigh(this.Symbol, this.Timeframe, iHighest(this.Symbol,this.Timeframe,MODE_HIGH,this.Period,shift));
   this.Open = iOpen(this.Symbol, this.Timeframe, 0);
   if(this.Open<this.Low)
     {
      this.Signal=-1;
     }
   if(this.Open>this.High)
     {
      this.Signal=1;
     }
   return this.Signal;
  }
//+------------------------------------------------------------------+
