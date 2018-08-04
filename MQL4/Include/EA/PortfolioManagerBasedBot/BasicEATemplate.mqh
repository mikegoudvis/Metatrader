//+------------------------------------------------------------------+
//|                                              BasicEATemplate.mqh |
//|                                 Copyright © 2017, Matthew Kastor |
//|                                 https://github.com/matthewkastor |
//+------------------------------------------------------------------+
#property copyright "Matthew Kastor"
#property link      "https://github.com/matthewkastor"
#property strict

#include <EA\PortfolioManagerBasedBot\BasePortfolioManagerBotConfig.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void GetBasicConfigs(BasePortfolioManagerBotConfig &config)
  {
   config.watchedSymbols=WatchedSymbols;
   config.lots=Lots;
   config.profitTarget=ProfitTarget;
   config.maxLoss=MaxLoss;
   config.slippage=Slippage;
   config.startDay=Start_Day;
   config.endDay=End_Day;
   config.startTime=Start_Time;
   config.endTime=End_Time;
   config.scheduleIsDaily=ScheduleIsDaily;
   config.tradeAtBarOpenOnly=TradeAtBarOpenOnly;
   config.pinExits=PinExits;
   config.switchDirectionBySignal=SwitchDirectionBySignal;

   config.backtestConfig.InitialScore=InitialScore;
   config.backtestConfig.GainsStdDevLimitMin=GainsStdDevLimitMin;
   config.backtestConfig.GainsStdDevLimitMax=GainsStdDevLimitMax;
   config.backtestConfig.GainsStdDevLimitWeight=GainsStdDevLimitWeight;
   config.backtestConfig.LossesStdDevLimitMin=LossesStdDevLimitMin;
   config.backtestConfig.LossesStdDevLimitMax=LossesStdDevLimitMax;
   config.backtestConfig.LossesStdDevLimitWeight=LossesStdDevLimitWeight;
   config.backtestConfig.NetProfitRangeMin=NetProfitRangeMin;
   config.backtestConfig.NetProfitRangeMax=NetProfitRangeMax;
   config.backtestConfig.NetProfitRangeWeight=NetProfitRangeWeight;
   config.backtestConfig.ExpectancyRangeMin=ExpectancyRangeMin;
   config.backtestConfig.ExpectancyRangeMax=ExpectancyRangeMax;
   config.backtestConfig.ExpectancyRangeWeight=ExpectancyRangeWeight;
   config.backtestConfig.TradesPerDayRangeMin=TradesPerDayRangeMin;
   config.backtestConfig.TradesPerDayRangeMax=TradesPerDayRangeMax;
   config.backtestConfig.TradesPerDayRangeWeight=TradesPerDayRangeWeight;
   config.backtestConfig.LargestLossPerTotalGainLimit=LargestLossPerTotalGainLimit;
   config.backtestConfig.LargestLossPerTotalGainWeight=LargestLossPerTotalGainWeight;
   config.backtestConfig.MedianLossPerMedianGainPercentLimit=MedianLossPerMedianGainPercentLimit;
   config.backtestConfig.MedianLossPerMedianGainPercentWeight=MedianLossPerMedianGainPercentWeight;

  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deinit()
  {
   delete bot;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTick()
  {
   bot.Execute();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double OnTester()
  {
   return bot.CustomTestResult();
  }
//+------------------------------------------------------------------+
