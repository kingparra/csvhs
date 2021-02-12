import Lib
import System.Environment
import System.Process (createProcess,proc)

main = do
  arg <- getArgs
  csvFile <- readFile (head arg)
  writeFile "output.html" (renderHtml $ parseCsv csvFile)
  createProcess (proc "firefox" ["output.html"])
