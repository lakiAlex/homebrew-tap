cask "lookout" do
  version "1.4.0"
  sha256 "893411c63239d43861acad61cec67e3cb701541de70da52c4d4971a7f6cd8b34"

  url "https://github.com/lakiAlex/lookout/releases/download/v#{version}/Lookout_#{version}_universal.dmg"
  name "Lookout"
  desc "Terminal for Claude Code, with files, search, git and an element picker"
  homepage "https://github.com/lakiAlex/lookout"

  depends_on macos: ">= :big_sur"

  app "Lookout.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Lookout.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.lookout",
    "~/Library/Caches/com.laki.lookout",
    "~/Library/Preferences/com.laki.lookout.plist",
    "~/Library/Saved Application State/com.laki.lookout.savedState",
    "~/Library/WebKit/com.laki.lookout",
  ]
end
