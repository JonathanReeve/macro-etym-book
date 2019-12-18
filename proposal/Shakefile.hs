-- Shakefile

import Development.Shake
import Text.Regex

opts = shakeOptions { shakeFiles    = ".shake/" }

replace str = subRegex (mkRegex "cite:") str "@"

main :: IO ()
main = shakeArgs opts $ do
    want ["reeve-macroetymology-proposal.pdf"]

    "reeve-macroetymology-proposal.pdf" %> \f -> do
        cmd "pandoc" ["proposal.org", "-f", "org+smart",
                      "-V", "geometry:margin=4cm", "-o", f]
