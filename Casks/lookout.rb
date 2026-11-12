cask "lookout" do
  version "1.6.4"
  sha256 "1ba2cf3c79d0a20aca4090648913a640b89e0bf2d473305eea2ae84cff3f0b13"

  url "https://github.com/lakiAlex/lookout/releases/download/v#{version}/Lookout_universal.app.tar.gz"
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
