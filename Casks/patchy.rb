cask "patchy" do
  version "1.0.0"
  sha256 "277955fce3cf8f660aba2756d2bf89d913875e65735021d1731ce957034a17d6"

  url "https://github.com/lakiAlex/patchy/releases/download/v#{version}/Patchy_#{version}_aarch64.dmg"
  name "Patchy"
  desc "Security dashboard for WordPress, PHP, npm, Composer and Ubuntu"
  homepage "https://github.com/lakiAlex/patchy"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Patchy.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Patchy.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.patchy",
    "~/Library/Caches/com.laki.patchy",
    "~/Library/Preferences/com.laki.patchy.plist",
    "~/Library/Saved Application State/com.laki.patchy.savedState",
    "~/Library/WebKit/com.laki.patchy",
  ]
end
