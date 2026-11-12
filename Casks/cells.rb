cask "cells" do
  version "1.1.3"
  sha256 "542e981251f183aa080806fb03a00b0ec1c01917853a470d2ec74a749342c024"

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
