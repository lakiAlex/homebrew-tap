cask "dispatch" do
  version "1.2.1"
  sha256 "e5155eaeda461d16f3c81edf78000384fd41f5093de221ecc4fd2c3ff9b629e5"

  url "https://github.com/lakiAlex/dispatch/releases/download/v#{version}/Dispatch.SFTP_#{version}_universal.dmg"
  name "Dispatch SFTP"
  desc "SFTP and FTP client with FileZilla and Cyberduck import"
  homepage "https://github.com/lakiAlex/dispatch"

  auto_updates true
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
