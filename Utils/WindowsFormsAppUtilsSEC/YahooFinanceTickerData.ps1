# list of tickers goes here - use these 15 vars 

$sublist01="AAPL,MSFT,AMZN,GOOGL,FB,BABA,V,MA" 
$sublist02="BRK-A,JNJ,WMT,PG,JPM,BAC,WFC,C,ANTM,MS,D" 
$sublist03="XOM,RDS-A,KO,HD,TSLA,CRM,CI,USB,GS,PNC,SPGI" 
$sublist04="NFLX,NVDA,ADBE,NKE,PYPL,PEP,AXP,CAT,CB" 
$sublist05="ABT,SAP,DIS,TSM,MRK,MDT,LMT,DHR,CVS,BDX,SYK,DUK" 
$sublist06="T,TM,HSBC,CHL,MCD,BA,CCL,ACN,UNP,UPS,MU,CSX,SCHW,NSC" 
$sublist07="CVX,CMCSA,PFE,VZ,BMY,PM,MO,HON,LLY,BLK,CCI,AGN,ECL" 
$sublist08="INTC,NVS,UNH,ORCL,CSCO,AMT,GE,IBM,CME,TJX,NOC,TGT,BSX,AEP,EQIX" 
$sublist09="SPLK,SNPS,TTWO,TCOM,ULTA,UAL,VRSN,INTU,CL,NOW,COP,RTN" 
$sublist10="VRSK,VRTX,WBA,WDAY,WDC,WLTW,XEL,XLNX,AMD,MMC,AON,DE,ICE" 
$sublist11="ADP,BKNG,TMUS,FISV,MDLZ,QCOM,LULU,MAR,MXIM,MELI,MCHP,MU,MNST" 
$sublist12="SBUX,TXN,CHTR,AVGO,COST,CDW,CERN,CHKP,CTAS,NTAP,NTES,NXPI,SWKS" 
$sublist13="ATVI,AAL,ALGN,AMGN,ADI,ANSS,ILMN,INCY,ISRG,JD,KHC,KLAC,LRCX,LBTYA" 
$sublist14="AMAT,ASML,ADSK,BIDU,BIIB,BMRN,CDNS,FAST,FOX,GILD,IDXX,ROST,SGEN,SIRI" 
$sublist15="CTXS,CTSH,CPRT,CSGP,CSX,DLTR,EBAY,EA,EXC,EXPE,ORLY,PCAR,PAYX,REGN" 

$group1 = $sublist01 + "," + $sublist02 + "," + $sublist03 + "," + $sublist04 + "," + $sublist05  
$group2 = $sublist06 + "," + $sublist07 + "," + $sublist08 + "," + $sublist09 + "," + $sublist10 
$group3 = $sublist11 + "," + $sublist12 + "," + $sublist13 + "," + $sublist14 + "," + $sublist15 
$tickerlist = $group1 + "," + $group2 + "," + $group3 




$qq1 = "AAPL,XEL,BKNG,ASML,PYPL,KLAC,WBA,TCOM,CSCO,PAYX,CSX,DLTR,SBUX,CSGP,REGN,EXPE,INTC,WDAY,MU,ALGN" 
$qq2 = "MSFT,KHC,INTU,XLNX,COST,PCAR,ATVI,ULTA,PEP,LULU,BIIB,WDC,QCOM,IDXX,CTSH,NTAP,CHTR,CERN,ADI,CTXS" 
$qq3 = "AMZN,MELI,ADP,ALXN,AMGN,MCHP,ADSK,MXIM,CMCSA,CTAS,AMD,UAL,GILD,ANSS,NXPI,FOXA,NFLX,WLTW,LRCX,CHKP" 
$qq4 = "GOOGL,EA,ISRG,FAST,AVGO,NTES,ILMN,INCY,ADBE,EBAY,AMAT,SWKS,MDLZ,VRSN,JD,AAL,VRSK,EXC,CDW,TMUS" 
$qq5 = "FB,SIRI,VRTX,CDNS,TXN,SPLK,ROST,BMRN,NVDA,ORLY,MAR,SGEN,FISV,SNPS,MNST,TTWO,TSLA,CPRT,BIDU,LBTYK" 

$tickerlist = $qq1 + "," +  $qq2 + "," +  $qq3 + "," +  $qq4 + "," +  $qq5 


$sps1 = "SBAC,KMB,WAT,V,VIAC,MAR,AMD,ADP,TDG,ROK,CMG,HCA,ADSK,COST,ZTS,ORLY,EQIX,ILMN,MA,AAPL" 
$sps2 = "LYV,CLX,BA,EQR,APA,ALLE,NVDA,LLY,IDXX,HSY,AZO,ECL,NOW,IT,JKHY,ULTA,MKTX,MSFT,CPRT,EXR" 
$sps3 = "AIV,DRE,MCO,HES,BKR,EL,INTU,MAA,ROL,NKE,HLT,KO,CCI,CTAS,CRM,PLD,AMZN,PAYX,SBUX,AON" 
$sps4 = "NLOK,LW,DLR,ESS,PEAK,FTNT,YUM,ROST,NFLX,ALGN,VRSK,PSA,PAYC,ISRG,SPGI,TXN,ANSS,PEP,MTD,CTXS" 
$sps5 = "UDR,MSI,HD,FAST,AMT,CDNS,MCD,PM,TFC,MNST,ADBE,PYPL,MSCI,ITW,RMD,LOW,VRSN,EW,CL,TJX" 

$tickerlist = $sps1 + "," +  $sps2 + "," +  $sps3 + "," +  $sps4 + "," +  $sps5 




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

function CellValue($cellvalue) {
	$result = "###" 
	try {
	   if ($cellvalue -eq $null) 
	   {
	   	   $result = "NNN"
	   }
	   else 
	   {
			$result = $cellvalue
			}
	}
	catch {
	   $result = "???" 
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
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

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

$txt01 = CellValue -cellvalue $qs.price.regularMarketPrice.raw 
$txt02 = CellValue -cellvalue $qs.price.regularMarketVolume.raw 
$txt03 = CellValue -cellvalue $qs.price.regularMarketChangePercent.raw 
$txt04 = CellValue -cellvalue $qs.summaryDetail.marketCap.raw 
$txt05 = CellValue -cellvalue $qs.summaryDetail.forwardPE.raw 
$txt06 = CellValue -cellvalue $qs.summaryDetail.trailingPE.raw 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

$txt07 = CellValue -cellvalue $qs.summaryDetail.fiftyDayAverage.raw 
$txt08 = CellValue -cellvalue $qs.summaryDetail.averageDailyVolume10Day.raw 
$txt09 = CellValue -cellvalue $qs.summaryDetail.twoHundredDayAverage.raw 
$txt10 = CellValue -cellvalue $qs.summaryDetail.dividendYield.raw 
$txt11 = CellValue -cellvalue $qs.summaryDetail.beta.raw 
$txt12 = CellValue -cellvalue $qs.summaryDetail.priceToSalesTrailing12Months.raw  
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = CellValue -cellvalue $qs.financialData.returnOnEquity.raw 
$txt14 = CellValue -cellvalue $qs.financialData.debtToEquity.raw 
$txt15 = CellValue -cellvalue $qs.financialData.profitMargins.raw 
$txt16 = CellValue -cellvalue $qs.financialData.grossMargins.raw 
$txt17 = CellValue -cellvalue $qs.financialData.ebitdaMargins.raw 
$txt18 = CellValue -cellvalue $qs.financialData.operatingMargins.raw 
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
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

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

$txt01 = CellValue -cellvalue $qs.financialData.revenueGrowth.raw 
$txt02 = CellValue -cellvalue $qs.financialData.returnOnAssets.raw
$txt03 = CellValue -cellvalue $qs.financialData.totalCash.raw 
$txt04 = CellValue -cellvalue $qs.financialData.totalDebt.raw 
$txt05 = CellValue -cellvalue $qs.financialData.totalRevenue.raw 
$txt06 = CellValue -cellvalue $qs.financialData.totalCashPerShare.raw 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

$txt07 = CellValue -cellvalue $qs.financialData.revenuePerShare.raw 
$txt08 = CellValue -cellvalue $qs.financialData.operatingCashFlow.raw  
$txt09 = CellValue -cellvalue $qs.financialData.ebitda.raw 
$txt10 = CellValue -cellvalue $qs.financialData.freeCashflow.raw
$txt11 = CellValue -cellvalue $qs.financialData.targetMedianPrice.raw 
$txt12 = CellValue -cellvalue $qs.financialData.numberOfAnalystOpinions.raw 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = CellValue -cellvalue $qs.financialData.targetHighPrice.raw  
$txt14 = CellValue -cellvalue $qs.financialData.targetLowPrice.raw 
$txt15 = CellValue -cellvalue $qs.financialData.earningsGrowth.raw 
$txt16 = CellValue -cellvalue $qs.financialData.currentPrice.raw
$txt17 = CellValue -cellvalue $qs.indexTrend.peRatio.raw 
$txt18 = CellValue -cellvalue $qs.indexTrend.pegRatio.raw 
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
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

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

$txt01 = CellValue -cellvalue $currentYear.endDate 
$txt02 = CellValue -cellvalue $currentYear.growth.raw
$txt03 = CellValue -cellvalue $currentYear.revenueEstimate.avg.raw  
$txt04 = CellValue -cellvalue $currentYear.revenueEstimate.low.raw
$txt05 = CellValue -cellvalue $currentYear.revenueEstimate.high.raw  
$txt06 = CellValue -cellvalue $currentYear.revenueEstimate.yearAgoRevenue.raw  
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

$txt07 = CellValue -cellvalue $currentYear.revenueEstimate.numberOfAnalysts.raw
$txt08 = CellValue -cellvalue $currentYear.earningsEstimate.avg.raw   
$txt09 = CellValue -cellvalue $currentYear.earningsEstimate.low.raw  
$txt10 = CellValue -cellvalue $currentYear.earningsEstimate.high.raw
$txt11 = CellValue -cellvalue $currentYear.earningsEstimate.yearAgoEps.raw  
$txt12 = CellValue -cellvalue $currentYear.earningsEstimate.numberOfAnalysts.raw 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 

$txt13 = CellValue -cellvalue $nextYear.endDate  
$txt14 = CellValue -cellvalue $nextYear.growth.raw 
$txt15 = CellValue -cellvalue $nextYear.revenueEstimate.avg.raw 
$txt16 = CellValue -cellvalue $nextYear.revenueEstimate.low.raw
$txt17 = CellValue -cellvalue $nextYear.revenueEstimate.high.raw 
$txt18 = CellValue -cellvalue $nextYear.revenueEstimate.numberOfAnalysts.raw 
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
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

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



$txt01 = CellValue -cellvalue $nextYear.earningsEstimate.avg.raw 
$txt02 = CellValue -cellvalue $nextYear.earningsEstimate.low.raw
$txt03 = CellValue -cellvalue $nextYear.earningsEstimate.high.raw  
$txt04 = CellValue -cellvalue $nextYear.earningsEstimate.numberOfAnalysts.raw
$txt05 = CellValue -cellvalue $stats.heldPercentInstitutions.raw  
$txt06 = CellValue -cellvalue $stats.heldPercentInsiders.raw  
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

$txt07 = CellValue -cellvalue $stats.sharesOutstanding.raw
$txt08 = CellValue -cellvalue $stats.sharesShort.raw   
$txt09 = CellValue -cellvalue $stats.sharesPercentSharesOut.raw 
$txt10 = CellValue -cellvalue $stats.floatShares.raw
$txt11 = CellValue -cellvalue $stats.shortRatio.raw  
$txt12 = CellValue -cellvalue $stats.dateShortInterest.fmt  
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString() + "," + $txt11.ToString() + "," + $txt12.ToString() 
  
$txt13 = CellValue -cellvalue $stats.sharesShortPreviousMonthDate.fmt  
$txt14 = CellValue -cellvalue $stats.sharesShortPriorMonth.raw 
$txt15 = CellValue -cellvalue $stats.enterpriseValue.raw 
$txt16 = CellValue -cellvalue $stats.earningsQuarterlyGrowth.raw 
$txt17 = CellValue -cellvalue $stats.bookValue.raw
$txt18 = CellValue -cellvalue $stats.shortPercentOfFloat.raw 
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
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

$txt07 = "nextFiscalYearEnd" 
$txt08 = "earningsDate"   
$txt09 = "exDividendDate" 
$txt10 = "ShortName" 
$subpart2 = $txt07.ToString() + "," + $txt08.ToString() + "," + $txt09.ToString() + "," + $txt10.ToString()     

return $subpart1 + "," + $subpart2  
 
}

function QuoteRowPart06($qs,$stats,$calendar) {

$txt01 = CellValue -cellvalue $stats.priceToBook.raw 
$txt02 = CellValue -cellvalue $stats.enterpriseToEbitda.raw
$txt03 = CellValue -cellvalue $stats.lastFiscalYearEnd.fmt  
$txt04 = CellValue -cellvalue $stats.netIncomeToCommon.raw
$txt05 = CellValue -cellvalue $stats.trailingEps.raw   
$txt06 = CellValue -cellvalue $stats.mostRecentQuarter.fmt 
$subpart1 = $txt01.ToString() + "," + $txt02.ToString() + "," + $txt03.ToString() + "," + $txt04.ToString() + "," + $txt05.ToString() + "," + $txt06.ToString()  

$txt07 = CellValue -cellvalue $stats.nextFiscalYearEnd.fmt 
$txt08 = CellValue -cellvalue $calendar.earnings.earningsDate[0].fmt  
$txt09 = CellValue -cellvalue $calendar.exDividendDate.fmt 
$txt10 = "???" 
try {
	$txt10 = $qs.price.shortName.Replace(","," ") 
}
catch {

}
$subpart2 = $txt07 + "," + $txt08 + "," + $txt09 + "," + $txt10   

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
   $qs = $null 
   $stats = $null 
   $calendar = $null 
   $nextYear = $null 
   $currentYear = $null 

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
   $txt06 = QuoteRowPart06 -qs $qs -stats $stats -calendar $calendar 
   Write-Host "QuoteRowProcessing OBJECTS properties set for output"
   

   return $ticker.ToString() + "," + $txt02 + "," + $txt03  + "," + $txt04 + "," + $txt05 + "," + $txt06    
}
 
function TickerRow($ticker) { 
    Write-Host "TickerRow '$ticker'"
   $objAnalysis = $null 
   $objStatistics = $null 

	$objAnalysis = YahooQuoteWebData -ticker $ticker -webMethod "analysis"   
	$objStatistics = YahooQuoteWebData -ticker $ticker -webMethod "key-statistics" 
	$tickerRow = QuoteRowProcessing -ticker $ticker -objAnalysis $objAnalysis -objStatistics $objStatistics 
	return $tickerRow
}

function ProcessTickersList($tickerlist,$outputFolder) { 
   $dateTimeForName = Get-Date -format "yyyy-MM-dd_HH-mm-ss"; 
   $outFilePath = $outputFolder + "\ProcessTickersList_" + $dateTimeForName + ".csv"
   $outputLines = HeaderRowProcessing 
   Set-Content -Path $outFilePath -Value $outputLines
   $arrayTickers = $tickerlist.Split(",") 
   foreach ($ticker in $arrayTickers) {
     Write-Host "[$($ticker.Trim())]"  
	 if ($ticker.Trim().Length -gt 0) { 
	     $stockRow = TickerRow($ticker.Trim())
		 Write-Host($stockRow)
		 Add-Content -Path $outFilePath -Value $("`n" + $stockRow) 
	     $outputLines += "`n" + $stockRow
	   }
     }
	 return $outputLines 
}

    #ProcessTickersList -tickerlist $tickerlist -outputFolder "C:\temp"
    ProcessTickersList -tickerlist $sublist03 -outputFolder "C:\temp"

	#$sublist01


	function Runbook20200213a()
	{
		$url = https://finance.yahoo.com/portfolio/p_3/view/view_4"
		$urlService = $url 
		$Response = Invoke-WebRequest -Uri $urlService 
		$tmpPageHtmlContent = $Response.Content
		$startPositionJson = $tmpPageHtmlContent.IndexOf("root.App.main = {")+"root.App.main = {".Length - 1 
		$endPositionJson = $tmpPageHtmlContent.LastIndexOf("}};") + 3   
		$tmpJsonObject = $tmpPageHtmlContent.Substring($startPositionJson, $endPositionJson - $startPositionJson - 1).Replace("BONDS","_BONDS") 
		$objYahooData = $tmpJsonObject | ConvertFrom-JSON 
		$stores = $objYahooData.context.dispatcher.stores  
 

	}
	



