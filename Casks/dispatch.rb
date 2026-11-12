cask "dispatch" do
  version "1.2.4"
  sha256 "a3efa03a8322638ace699594c6b9677e5f823e6d3ca6e63f0e1a7bd5777177fa"

  url "https://github.com/lakiAlex/dispatch/releases/download/v#{version}/Dispatch.SFTP_universal.app.tar.gz"
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
