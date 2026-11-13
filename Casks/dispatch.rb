cask "dispatch" do
  version "1.2.5"
  sha256 "a2bbd7a4bab2f916e5771b671c2163c0d5c12021bedd82c3cfb7b37d24916707"

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
