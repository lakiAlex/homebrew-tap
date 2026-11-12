cask "cells" do
  version "1.1.2"
  sha256 "bef819f075fcdb4e34a6d7c0ca52d41c9a0bbf2a8170d8ae0ac3252582acbea2"

  url "https://github.com/lakiAlex/cells/releases/download/v#{version}/Cells_universal.app.tar.gz"
  name "Cells"
  desc "Spreadsheet editor for CSV, Excel and Google Sheets"
  homepage "https://github.com/lakiAlex/cells"

  auto_updates true
  depends_on :macos

  app "Cells.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Cells.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.cells",
    "~/Library/Caches/com.laki.cells",
    "~/Library/Preferences/com.laki.cells.plist",
    "~/Library/Saved Application State/com.laki.cells.savedState",
    "~/Library/WebKit/com.laki.cells",
  ]
end
