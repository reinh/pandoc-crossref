import           Control.Monad.State
import           Text.Pandoc
import           Text.Pandoc.JSON
import           Text.Pandoc.Walk

import           Text.Pandoc.Crossref
import           Text.Pandoc.Crossref.Util.CodeBlockCaptions
import           Text.Pandoc.Crossref.Util.ModifyMeta
import           Text.Pandoc.Crossref.Util.Options
import           Text.Pandoc.Crossref.Util.Settings

main :: IO ()
main = toJSONFilter process
