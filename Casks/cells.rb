cask "cells" do
  version "1.1.0"
  sha256 "398160423d535528d67e0664e9cb5ff1655850cddeade91904bc58daae55baa1"

  url "https://github.com/lakiAlex/cells/releases/download/v#{version}/Cells_#{version}_aarch64.dmg"
  name "Cells"
  desc "Spreadsheet editor for CSV, Excel and Google Sheets"
  homepage "https://github.com/lakiAlex/cells"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Cells.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Cells.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.cells",
    "~/Library/Caches/com.laki.cells",
    "~/Library/Preferences/com.laki.cells.plist",
    "~/Library/Saved Application State/com.laki.cells.savedState",
    "~/Library/WebKit/com.laki.cells",
  ]
end
