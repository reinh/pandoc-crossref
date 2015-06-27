module Text.Pandoc.Crossref (process, processWith, module X) where

import           Control.Monad.State
import           Data.Monoid                                 ((<>))
import           Text.Pandoc
import           Text.Pandoc.JSON
import           Text.Pandoc.Walk

-- For reexport
import           Text.Pandoc.Crossref.Accessors              as X
import           Text.Pandoc.Crossref.Blocks                 as X
import           Text.Pandoc.Crossref.List                   as X
import           Text.Pandoc.Crossref.Refs                   as X
import           Text.Pandoc.Crossref.Types                  as X

import           Text.Pandoc.Crossref.Util.CodeBlockCaptions
import           Text.Pandoc.Crossref.Util.ModifyMeta
import           Text.Pandoc.Crossref.Util.Options
import           Text.Pandoc.Crossref.Util.Settings

processWith :: Meta -> Maybe Format -> Pandoc -> Pandoc
processWith dtv fmt (Pandoc meta bs) = Pandoc meta' $ evalState doWalk def
  where
    doWalk =
      bottomUpM (codeBlockCaptions opts) bs
      >>= walkM (replaceBlocks opts)
      >>= bottomUpM (replaceRefs opts)
      >>= bottomUpM (listOf opts)
    opts = getOptions (dtv <> meta) fmt
    meta' = modifyMeta opts dtv

process :: Maybe Format -> Pandoc -> IO Pandoc
process fmt pandoc@(Pandoc meta bs) = do
  dtv <- getSettings meta
  return (processWith dtv fmt pandoc)
