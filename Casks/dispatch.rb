cask "dispatch" do
  version "1.2.0"
  sha256 "34b097fc8c1dc79c2dfd48098fbe3da8d9bf41c7c9459dd2222e3400ad4ec532"

  url "https://github.com/lakiAlex/dispatch/releases/download/#{version}/Dispatch-SFTP_#{version}_aarch64.dmg"
  name "Dispatch SFTP"
  desc "SFTP and FTP client with FileZilla and Cyberduck import"
  homepage "https://github.com/lakiAlex/dispatch"

  depends_on arch: :arm64
  depends_on :macos

  app "Dispatch SFTP.app"

  # Not notarized: remove the quarantine flag so macOS opens it without a warning.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Dispatch SFTP.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.laki.dispatch",
    "~/Library/Caches/com.laki.dispatch",
    "~/Library/Preferences/com.laki.dispatch.plist",
    "~/Library/Saved Application State/com.laki.dispatch.savedState",
    "~/Library/WebKit/com.laki.dispatch",
  ]
end
