cask "lookout" do
  version "1.5.1"
  sha256 "152347cff03db6b1eceefd5a313f4f907e0f8bf49aef4394c543d0bfdc6fa6ec"

  url "https://github.com/lakiAlex/lookout/releases/download/v#{version}/Lookout_#{version}_universal.dmg"
  name "Lookout"
  desc "Terminal for Claude Code, with files, search, git and an element picker"
  homepage "https://github.com/lakiAlex/lookout"

  auto_updates true
  depends_on :macos

  app "Lookout.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Lookout.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.lookout",
    "~/Library/Caches/com.laki.lookout",
    "~/Library/Preferences/com.laki.lookout.plist",
    "~/Library/Saved Application State/com.laki.lookout.savedState",
    "~/Library/WebKit/com.laki.lookout",
  ]
end
