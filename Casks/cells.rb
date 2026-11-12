cask "cells" do
  version "1.1.2"
  sha256 "17bfcb71ff464482b5ddac1be55a9b49fc94c5e48b024d5048572f711b476a87"

  url "https://github.com/lakiAlex/cells/releases/download/v#{version}/Cells_#{version}_universal.dmg"
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
