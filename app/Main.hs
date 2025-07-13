module Main (main) where
import Text.Printf()
import Options.Applicative
    ( (<**>),
      fullDesc,
      header,
      help,
      info,
      long,
      metavar,
      progDesc,
      short,
      strOption,
      switch,
      execParser,
      helper,
      Parser,
      ParserInfo )

data Argument = Argument
  { source      :: String
  , verbose      :: Bool}

argumentParser :: Parser Argument
argumentParser = Argument
      <$> strOption (
            long "source"
         <> short 's'
         <> metavar "TARGET"
         <> help "source file")
      <*> switch (
            long "verbose"
         <> short 'v'
         <> help "whether to be verbose")

opts :: ParserInfo Argument
opts = info (argumentParser <**> helper)
  (  fullDesc
  <> progDesc "haskellで作るcbcコンパイラ"
  <> header "a cbc compiler implemented in haskell" )

main :: IO ()
main = do
  arg <- execParser opts
  content <- readFile (source arg)
  putStrLn "ファイル内容:"
  putStrLn content
