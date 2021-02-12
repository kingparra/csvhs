import Test.Hspec
import Lib

main = hspec $ do
  describe "renderHtml" $ do
    it "render two dimensional list into a html table" $ do
      renderHtml [[1..3],[4..6],[27,28,97]] `shouldBe` "<table>\
                                                         \<tbody>\
                                                           \<tr><td>1</td><td>2</td><td>3</td></tr>\
                                                           \<tr><td>4</td><td>5</td><td>6</td></tr>\
                                                           \<tr><td>27</td><td>28</td><td>97</td></tr>\
                                                         \</tbody>\
                                                       \</table>"
