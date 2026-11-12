cask "patchy" do
  version "1.0.2"
  sha256 "2c53413f8539a9ed8f9ada9d108146f5521dfc93d6aa3102b529e532b16d8dd5"

  url "https://github.com/lakiAlex/patchy/releases/download/v#{version}/Patchy_#{version}_universal.dmg"
  name "Patchy"
  desc "Security dashboard for WordPress, PHP, npm, Composer and Ubuntu"
  homepage "https://github.com/lakiAlex/patchy"

  auto_updates true
  depends_on :macos

  app "Patchy.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Patchy.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.patchy",
    "~/Library/Caches/com.laki.patchy",
    "~/Library/Preferences/com.laki.patchy.plist",
    "~/Library/Saved Application State/com.laki.patchy.savedState",
    "~/Library/WebKit/com.laki.patchy",
  ]
end
