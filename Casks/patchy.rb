cask "patchy" do
  version "1.0.3"
  sha256 "73f6f335243f96d588e44920617656cec560a7fc1ad93bc877419819a61d71b1"

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
