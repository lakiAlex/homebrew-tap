cask "patchy" do
  version "1.0.5"
  sha256 "d117491124b162db39959757f9099a7d0519b4db0cd295c499c31d9d3ad6f2d4"

  url "https://github.com/lakiAlex/patchy/releases/download/v#{version}/Patchy_universal.app.tar.gz"
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
