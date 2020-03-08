using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsAppUtilsSEC
{
    internal class MiscCode1
    {

        private Object CellValue(Object cellvalue )
        {
            return null; 

//        function CellValue($cellvalue)
//        {
//	$result = "###"
        
//    try
//            {
//                if ($cellvalue - eq $null) 
//	   {
//	   	   $result = "NNN"

//       }

//       else
//                {
//			$result = $cellvalue

//            }
//            }
//            catch
//            {
//	   $result = "???"
        
//    }
//            return $result
//        }



    }

    private Object YearEarningTrend(Object quoteSummaryObject, Object period )
        { 
            //            function YearEarningTrend($quoteSummaryObject,$period)
            //            {
            //  $result = $null
            //              foreach ($trendObject in $quoteSummaryObject.earningsTrend.trend) {
            //                if ($trendObject.period.ToString() - eq $period.ToString()) { 
            //       $result = $trendObject
            //                    }
            //            }
            //            return $result
            //}

            return null;
        }

        private Object s3(Object ticker, Object webMethod, Object webMethod1, Object webMethod2)
        {
            return null;
        }

        private Object s4(Object ticker, Object webMethod, Object webMethod1, Object webMethod2)
        {
            return null;
        }

        private Object s5(Object ticker, Object webMethod, Object webMethod1, Object webMethod2)
        {
            return null;
        }

        private Object s6(Object ticker, Object webMethod, Object webMethod1, Object webMethod2)
        {
            return null;
        }

        private Object YahooQuoteWebData(Object ticker, Object webMethod)
        {
            //          function YahooQuoteWebData($ticker,$webMethod)
            //          { 
            //$urlService = "https://finance.yahoo.com/quote/" + $ticker + "/" + $webMethod # "analysis" "key-statistics"   
            //Write-Host $urlService
            //$Response = Invoke - WebRequest - Uri $urlService
            //$tmpPageHtmlContent = $Response.Content
            //$startPositionJson = $tmpPageHtmlContent.IndexOf("root.App.main = {") + "root.App.main = {".Length - 1
            //$endPositionJson = $tmpPageHtmlContent.LastIndexOf("}};") + 3
            //$tmpJsonObject = $tmpPageHtmlContent.Substring($startPositionJson, $endPositionJson - $startPositionJson - 1).Replace("BONDS", "_BONDS")
            //$objYahooData = $tmpJsonObject | ConvertFrom - JSON
            //return $objYahooData.context.dispatcher.stores
            //}
            return null;
        }


        string kUrl = "https://www.sec.gov/cgi-bin/browse-edgar?action=getcompany&ticker={0}"; 

//        getCIK = function(ticker)
//        {
//            stopifnot(is.character(ticker))
//  uri = "https://www.sec.gov/cgi-bin/browse-edgar"
//  response = getForm(uri, CIK = ticker, action = "getcompany")
//  html = htmlParse(response)
//  CIKNode = getNodeSet(html, "//acronym[@title=\"Central Index Key\"][text() = \"CIK\"]")
//  CIKNodeText = sapply(CIKNode, function(x) xmlValue(getSibling(getSibling(x))))
//  CIK = sub(" .*", "", CIKNodeText)
//  CIK = sub("^0*", "", CIK)
//  CIK
//}


    }
}


#region "83 Fields" 

//A $txt01 = "RegularMarketPrice" 
//A $txt02 = "regularMarketVolume"
//A $txt03 = "RegularMarketChangePercent" 
//A $txt04 = "marketCap"  
//A $txt05 = "forwardPE"  
//A $txt06 = "trailingPE" 
//A $txt07 = "fiftyDayAverage"  
//A $txt08 = "averageDailyVolume10Day"  
//A $txt09 = "twoHundredDayAverage"  
//A $txt10 = "dividendYield"  
//A $txt11 = "beta"  
//A $txt12 = "priceToSalesTrailing12Months"  
//A $txt13 = "returnOnEquity"  
//A $txt14 = "debtToEquity" 
//A $txt15 = "profitMargins"  
//A $txt16 = "grossMargins"  
//A $txt17 = "ebitdaMargins" 
//A $txt18 = "operatingMargins" 

//B $txt01 = "revenueGrowth" 
//B $txt02 = "returnOnAssets"
//B $txt03 = "totalCash" 
//B $txt04 = "totalDebt" 
//B $txt05 = "totalRevenue" 
//B $txt06 = "totalCashPerShare" 
//B $txt07 = "revenuePerShare" 
//B $txt08 = "operatingCashFlow"  
//B $txt09 = "ebitda" 
//B $txt10 = "freeCashflow"
//B $txt11 = "targetMedianPrice" 
//B $txt12 = "numberOfAnalystOpinions" 
//B $txt13 = "targetHighPrice"  
//B $txt14 = "targetLowPrice" 
//B $txt15 = "earningsGrowth" 
//B $txt16 = "currentPrice"
//B $txt17 = "peRatio"
//B $txt18 = "pegRatio" 

//C $txt01 = "currentYear.endDate" 
//C $txt02 = "currentYear.growth"
//C $txt03 = "currentYear.revenueEstimate.avg"  
//C $txt04 = "currentYear.revenueEstimate.low"
//C $txt05 = "currentYear.revenueEstimate.high"  
//C $txt06 = "currentYear.revenueEstimate.yearAgoRevenue"  
//C $txt07 = "currentYear.revenueEstimate.numberOfAnalysts"
//C $txt08 = "currentYear.earningsEstimate.avg"   
//C $txt09 = "currentYear.earningsEstimate.low"  
//C $txt10 = "currentYear.earningsEstimate.high"
//C $txt11 = "currentYear.earningsEstimate.yearAgoEps"  
//C $txt12 = "currentYear.earningsEstimate.numberOfAnalysts" 
//C $txt13 = "nextYear.endDate"  
//C $txt14 = "nextYear.growth" 
//C $txt15 = "nextYear.revenueEstimate.avg" 
//C $txt16 = "nextYear.revenueEstimate.low"
//C $txt17 = "nextYear.revenueEstimate.high" 
//C $txt18 = "nextYear.revenueEstimate.numberOfAnalysts" 

//D $txt01 = "nextYear.earningsEstimate.avg" 
//D $txt02 = "nextYear.earningsEstimate.low"
//D $txt03 = "nextYear.earningsEstimate.high"  
//D $txt04 = "nextYear.earningsEstimate.numberOfAnalysts"
//D $txt05 = "heldPercentInstitutions"  
//D $txt06 = "heldPercentInsiders"  
//D $txt07 = "sharesOutstanding"
//D $txt08 = "sharesShort"   
//D $txt09 = "sharesPercentSharesOut" 
//D $txt10 = "floatShares"
//D $txt11 = "shortRatio"  
//D $txt12 = "dateShortInterest"  
//D $txt13 = "sharesShortPreviousMonthDate"  
//D $txt14 = "sharesShortPriorMonth" 
//D $txt15 = "enterpriseValue" 
//D $txt16 = "earningsQuarterlyGrowth" 
//D $txt17 = "bookValue"
//D $txt18 = "shortPercentOfFloat" 

//E $txt01 = "priceToBook" 
//E $txt02 = "enterpriseToEbitda"
//E $txt03 = "lastFiscalYearEnd"  
//E $txt04 = "netIncomeToCommon"
//E $txt05 = "trailingEps"   
//E $txt06 = "mostRecentQuarter" 
//E $txt07 = "nextFiscalYearEnd" 
//E $txt08 = "earningsDate"   
//E $txt09 = "exDividendDate" 
//E $txt10 = "ShortName"  
//E $txt11 = "averageDailyVolume3Month" 


#endregion