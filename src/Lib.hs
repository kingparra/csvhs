module Lib where
import Data.List.Split (splitOn)
import Debug.Trace

parseCsv :: String -> [[String]]
--          "Whole csv" -> [["1","2","3"],["4","5","6"]]
parseCsv csv =
  map (splitOn ",") (lines csv)

renderHtml :: [[String]] -> String
renderHtml ll =
  let
    td       =  concatMap (\e -> "<td>" ++ e ++ "</td>")
    tr b     =  "<tr>" ++ b ++ "</tr>"
    tbody tb =  "<tbody>" ++ tb ++ "</tbody>"
    th h     =  "<th>" ++ h ++ "</th>"
    thead th =  "<thead>" ++ th ++ "</thead>"
    table t  =  "<table>" ++ t ++ "</table>"
  in
    table $ thead $ traceId $ concat $ map tr ( (map (th) (head ll)) ++ (map (td) (tail ll)))
