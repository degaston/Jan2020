# list of tickers goes here - use these 15 vars 

$sublist01="AAPL,MSFT,AMZN,GOOGL,FB,BABA,V,MA"
#$sublist01="AAPL,MSFT"
$sublist02="BRK-A,JNJ,WMT,PG" 
$sublist03="XOM,RDS-A,KO,HD,TSLA,CRM" 
$sublist04="NFLX,NVDA,ADBE,NKE,PYPL,PEP" 
$sublist05="ABT,SAP,DIS,TSM,MRK,MDT" 
$sublist06="T,TM,HSBC,CHL,MCD,BA" 
$sublist07="CVX,CMCSA,PFE,VZ,BMY" 
$sublist08="INTC,NVS,UNH" 
$sublist09="ORCL,CSCO" 
$sublist10="JPM,BAC,WFC,C" 
$sublist11="" 
$sublist12="" 
$sublist13="" 
$sublist14="" 
$sublist15="" 

$group1 = $sublist01 + "," + $sublist02 + "," + $sublist03 + "," + $sublist04 + "," + $sublist05  
$group2 = $sublist06 + "," + $sublist07 + "," + $sublist08 + "," + $sublist09 + "," + $sublist10 
#$group3 = $sublist11 + "," + $sublist12 + "," + $sublist13 + "," + $sublist14 + "," + $sublist15 
$tickerlist = $group1 + "," + $group2 #+ "," + $group3 




function YahooQuoteWebData($ticker,$webMethod) { 
  $urlService = "https://finance.yahoo.com/quote/" + $ticker + "/" + $webMethod # "analysis" "key-statistics"   
  Write-Host $urlService 
  $Response = Invoke-WebRequest -Uri $urlService 
  $tmpPageHtmlContent = $Response.Content
  $startPositionJson = $tmpPageHtmlContent.IndexOf("root.App.main = {")+"root.App.main = {".Length - 1 
  $endPositionJson = $tmpPageHtmlContent.LastIndexOf("}};") + 3   
  $tmpJsonObject = $tmpPageHtmlContent.Substring($startPositionJson, $endPositionJson - $startPositionJson - 1).Replace("BONDS","_BONDS") 
  $objYahooData = $tmpJsonObject | ConvertFrom-JSON 
  return $objYahooData.context.dispatcher.stores  
  } 

function YearEarningTrend($quoteSummaryObject,$period) 
{
  $result = $null 
  foreach ($trendObject in $quoteSummaryObject.earningsTrend.trend) { 
    if ($trendObject.period.ToString() -eq $period.ToString()) { 
       $result = $trendObject    
       }
    }
  return $result 
}

function HeaderRowPart02 {

$txt01 = "RegularMarketPrice" 
$txt02 = "regularMarketVolume"
$txt03 = "RegularMarketChangePercent" 
$txt04 = "marketCap"  
$txt05 = "forwardPE"  
$txt06 = "trailingPE" 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = "fiftyDayAverage"  
$txt08 = "averageDailyVolume10Day"  
$txt09 = "twoHundredDayAverage"  
$txt10 = "dividendYield"  
$txt11 = "beta"  
$txt12 = "priceToSalesTrailing12Months"  
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = "returnOnEquity"  
$txt14 = "debtToEquity" 
$txt15 = "profitMargins"  
$txt16 = "grossMargins"  
$txt17 = "ebitdaMargins" 
$txt18 = "operatingMargins" 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3  

}

 
function QuoteRowPart02($qs) {

$txt01 = $qs.price.regularMarketPrice.raw 
$txt02 = $qs.price.regularMarketVolume.raw 
$txt03 = $qs.price.regularMarketChangePercent.raw 
$txt04 = $qs.summaryDetail.marketCap.raw 
$txt05 = $qs.summaryDetail.forwardPE.raw 
$txt06 = $qs.summaryDetail.trailingPE.raw 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = $qs.summaryDetail.fiftyDayAverage.raw 
$txt08 = $qs.summaryDetail.averageDailyVolume10Day.raw 
$txt09 = $qs.summaryDetail.twoHundredDayAverage.raw 
$txt10 = $qs.summaryDetail.dividendYield.raw 
$txt11 = $qs.summaryDetail.beta.raw 
$txt12 = $qs.summaryDetail.priceToSalesTrailing12Months.raw  
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = $qs.financialData.returnOnEquity.raw 
$txt14 = $qs.financialData.debtToEquity.raw 
$txt15 = $qs.financialData.profitMargins.raw 
$txt16 = $qs.financialData.grossMargins.raw 
$txt17 = $qs.financialData.ebitdaMargins.raw 
$txt18 = $qs.financialData.operatingMargins.raw 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3   

}

function HeaderRowPart03 {

$txt01 = "revenueGrowth" 
$txt02 = "returnOnAssets"
$txt03 = "totalCash" 
$txt04 = "totalDebt" 
$txt05 = "totalRevenue" 
$txt06 = "totalCashPerShare" 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = "revenuePerShare" 
$txt08 = "operatingCashFlow"  
$txt09 = "ebitda" 
$txt10 = "freeCashflow"
$txt11 = "targetMedianPrice" 
$txt12 = "numberOfAnalystOpinions" 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = "targetHighPrice"  
$txt14 = "targetLowPrice" 
$txt15 = "earningsGrowth" 
$txt16 = "currentPrice"
$txt17 = "peRatio"
$txt18 = "pegRatio" 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 


return $subpart1 + "," + $subpart2 + "," + $subpart3   

} 

 
function QuoteRowPart03($qs) {

$txt01 = $qs.financialData.revenueGrowth.raw 
$txt02 = $qs.financialData.returnOnAssets.raw
$txt03 = $qs.financialData.totalCash.raw 
$txt04 = $qs.financialData.totalDebt.raw 
$txt05 = $qs.financialData.totalRevenue.raw 
$txt06 = $qs.financialData.totalCashPerShare.raw 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = $qs.financialData.revenuePerShare.raw 
$txt08 = $qs.financialData.operatingCashFlow.raw  
$txt09 = $qs.financialData.ebitda.raw 
$txt10 = $qs.financialData.freeCashflow.raw
$txt11 = $qs.financialData.targetMedianPrice.raw 
$txt12 = $qs.financialData.numberOfAnalystOpinions.raw 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = $qs.financialData.targetHighPrice.raw  
$txt14 = $qs.financialData.targetLowPrice.raw 
$txt15 = $qs.financialData.earningsGrowth.raw 
$txt16 = $qs.financialData.currentPrice.raw
$txt17 = $qs.indexTrend.peRatio.raw 
$txt18 = $qs.indexTrend.pegRatio.raw 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3   

}


function HeaderRowPart04 {

$txt01 = "currentYear.endDate" 
$txt02 = "currentYear.growth"
$txt03 = "currentYear.revenueEstimate.avg"  
$txt04 = "currentYear.revenueEstimate.low"
$txt05 = "currentYear.revenueEstimate.high"  
$txt06 = "currentYear.revenueEstimate.yearAgoRevenue"  
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = "currentYear.revenueEstimate.numberOfAnalysts"
$txt08 = "currentYear.earningsEstimate.avg"   
$txt09 = "currentYear.earningsEstimate.low"  
$txt10 = "currentYear.earningsEstimate.high"
$txt11 = "currentYear.earningsEstimate.yearAgoEps"  
$txt12 = "currentYear.earningsEstimate.numberOfAnalysts" 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = "nextYear.endDate"  
$txt14 = "nextYear.growth" 
$txt15 = "nextYear.revenueEstimate.avg" 
$txt16 = "nextYear.revenueEstimate.low"
$txt17 = "nextYear.revenueEstimate.high" 
$txt18 = "nextYear.revenueEstimate.numberOfAnalysts" 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3  

}


 
function QuoteRowPart04($currentYear,$nextYear) {

$txt01 = $currentYear.endDate 
$txt02 = $currentYear.growth.raw
$txt03 = $currentYear.revenueEstimate.avg.raw  
$txt04 = $currentYear.revenueEstimate.low.raw
$txt05 = $currentYear.revenueEstimate.high.raw  
$txt06 = $currentYear.revenueEstimate.yearAgoRevenue.raw  
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = $currentYear.revenueEstimate.numberOfAnalysts.raw
$txt08 = $currentYear.earningsEstimate.avg.raw   
$txt09 = $currentYear.earningsEstimate.low.raw  
$txt10 = $currentYear.earningsEstimate.high.raw
$txt11 = $currentYear.earningsEstimate.yearAgoEps.raw  
$txt12 = $currentYear.earningsEstimate.numberOfAnalysts.raw 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = $nextYear.endDate  
$txt14 = $nextYear.growth.raw 
$txt15 = $nextYear.revenueEstimate.avg.raw 
$txt16 = $nextYear.revenueEstimate.low.raw
$txt17 = $nextYear.revenueEstimate.high.raw 
$txt18 = $nextYear.revenueEstimate.numberOfAnalysts.raw 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3  

}


function HeaderRowPart05 {

$txt01 = "nextYear.earningsEstimate.avg" 
$txt02 = "nextYear.earningsEstimate.low"
$txt03 = "nextYear.earningsEstimate.high"  
$txt04 = "nextYear.earningsEstimate.numberOfAnalysts"
$txt05 = "heldPercentInstitutions"  
$txt06 = "heldPercentInsiders"  
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = "sharesOutstanding"
$txt08 = "sharesShort"   
$txt09 = "sharesPercentSharesOut" 
$txt10 = "floatShares"
$txt11 = "shortRatio"  
$txt12 = "dateShortInterest"  
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 
  
$txt13 = "sharesShortPreviousMonthDate"  
$txt14 = "sharesShortPriorMonth" 
$txt15 = "enterpriseValue" 
$txt16 = "earningsQuarterlyGrowth" 
$txt17 = "bookValue"
$txt18 = "shortPercentOfFloat" 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3  

 
}


 
function QuoteRowPart05($nextYear,$stats) {



$txt01 = $nextYear.earningsEstimate.avg.raw 
$txt02 = $nextYear.earningsEstimate.low.raw
$txt03 = $nextYear.earningsEstimate.high.raw  
$txt04 = $nextYear.earningsEstimate.numberOfAnalysts.raw
$txt05 = $stats.heldPercentInstitutions.raw  
$txt06 = $stats.heldPercentInsiders.raw  
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = $stats.sharesOutstanding.raw
$txt08 = $stats.sharesShort.raw   
$txt09 = $stats.sharesPercentSharesOut.raw 
$txt10 = $stats.floatShares.raw
$txt11 = $stats.shortRatio.raw  
$txt12 = $stats.dateShortInterest.fmt  
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 
  
$txt13 = $stats.sharesShortPreviousMonthDate.fmt  
$txt14 = $stats.sharesShortPriorMonth.raw 
$txt15 = $stats.enterpriseValue.raw 
$txt16 = $stats.earningsQuarterlyGrowth.raw 
$txt17 = $stats.bookValue.raw
$txt18 = $stats.shortPercentOfFloat.raw 
$subpart3 = $txt13.ToString() + "," + $txt14.ToString() + "," + $txt15.ToString() + "," + $txt16.ToString() + "," + $txt17.ToString() + "," + $txt18.ToString() 

return $subpart1 + "," + $subpart2 + "," + $subpart3  

}




function HeaderRowPart06 {

$txt01 = "priceToBook" 
$txt02 = "enterpriseToEbitda"
$txt03 = "lastFiscalYearEnd"  
$txt04 = "netIncomeToCommon"
$txt05 = "trailingEps"   
$txt06 = "mostRecentQuarter" 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = "nextFiscalYearEnd" 
$txt08 = "earningsDate"   
$txt09 = "exDividendDate" 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString()   

return $subpart1 + "," + $subpart2  
 
}

function QuoteRowPart06($stats,$calendar) {

$txt01 = $stats.priceToBook.raw 
$txt02 = $stats.enterpriseToEbitda.raw
$txt03 = $stats.lastFiscalYearEnd.fmt  
$txt04 = $stats.netIncomeToCommon.raw
$txt05 = $stats.trailingEps.raw   
$txt06 = $stats.mostRecentQuarter.fmt 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06  

$txt07 = $stats.nextFiscalYearEnd.fmt 
$txt08 = $calendar.earnings.earningsDate[0].fmt  
$txt09 = $calendar.exDividendDate.fmt 
$subpart2 = $txt07 + "," + $txt08 + "," + $txt09   

return $subpart1 + "," + $subpart2  

}




function HeaderRowProcessing {

   $txt02 = HeaderRowPart02 
   $txt03 = HeaderRowPart03  
   $txt04 = HeaderRowPart04  
   $txt05 = HeaderRowPart05 
   $txt06 = HeaderRowPart06   

   Write-Host ( $txt02 + "," + $txt03 + "," + $txt04 + "," + $txt05 + "," + $txt06 )
   return "Ticker," + $txt02 + "," + $txt03 + "," + $txt04 + "," + $txt05 + "," + $txt06 
}

function QuoteRowProcessing($ticker, $objAnalysis, $objStatistics) {

   Write-Host "QuoteRowProcessing ' $ticker' "
   $qs = $objAnalysis.QuoteSummaryStore  
   $stats = $objStatistics.QuoteSummaryStore.defaultKeyStatistics   
   $calendar = $objStatistics.QuoteSummaryStore.calendarEvents 
   $nextYear = YearEarningTrend -quoteSummaryObject $qs -period "+1y" 
   $currentYear = YearEarningTrend -quoteSummaryObject $qs -period "0y" 
   Write-Host "QuoteRowProcessing OBJECTS prepared"

   $txt02 = QuoteRowPart02 -qs $qs 
   $txt03 = QuoteRowPart03 -qs $qs 
   $txt04 = QuoteRowPart04 -currentYear $currentYear -nextYear $nextYear
   $txt05 = QuoteRowPart05 -stats $stats -nextYear $nextYear 
   $txt06 = QuoteRowPart06 -stats $stats -calendar $calendar 
   Write-Host "QuoteRowProcessing OBJECTS properties set for output"
   

   return $ticker.ToString() + "," + $txt02 + "," + $txt03  + "," + $txt04 + "," + $txt05 + "," + $txt06    
}
 
function TickerRow($ticker) { 
    Write-Host "TickerRow '$ticker'"
	$objAnalysis = YahooQuoteWebData -ticker $ticker -webMethod "analysis"   
	$objStatistics = YahooQuoteWebData -ticker $ticker -webMethod "key-statistics" 
	$tickerRow = QuoteRowProcessing -ticker $ticker -objAnalysis $objAnalysis -objStatistics $objStatistics 
	return $tickerRow
}

function ProcessTickersList($tickerlist,$outputFolder) { 
   $dateTimeForName = Get-Date -format "yyyy-MM-dd_HH-mm-ss"; 
   $outFilePath = $outputFolder + "\ProcessTickersList_" + $dateTimeForName + ".csv"
   $outputLines = HeaderRowProcessing 
   $arrayTickers = $tickerlist.Split(",") 
   foreach ($ticker in $arrayTickers) {
     Write-Host "[$($ticker.Trim())]"  
	 if ($ticker.Trim().Length -gt 0) { 
	     $stockRow = TickerRow($ticker.Trim())
		 Write-Host($stockRow)
	     $outputLines += "`n" + $stockRow
	   }
     } 
    Set-Content -Path $outFilePath -Value $outputLines   
}

    ProcessTickersList -tickerlist $tickerlist -outputFolder "C:\temp"



	



