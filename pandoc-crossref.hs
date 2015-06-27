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
main = toJSONFilter go

go :: Maybe Format -> Pandoc -> IO Pandoc
go fmt (Pandoc meta bs) = do
  dtv <- getSettings meta
  let
    doWalk =
      bottomUpM (codeBlockCaptions opts) bs
      >>= walkM (replaceBlocks opts)
      >>= bottomUpM (replaceRefs opts)
      >>= bottomUpM (listOf opts)
    opts = getOptions dtv fmt
    meta' = modifyMeta opts dtv
  return $ Pandoc meta' $ evalState doWalk def
