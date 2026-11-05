# lakiAlex/homebrew-tap

Homebrew casks for my macOS apps.

```sh
brew trust --tap lakialex/tap
brew install --cask lakialex/tap/lookout
brew install --cask lakialex/tap/dispatch
brew install --cask lakialex/tap/cells
brew install --cask lakialex/tap/patchy
```

| Cask | App |
| --- | --- |
| `lookout` | [Lookout](https://github.com/lakiAlex/lookout), a terminal for Claude Code with files, search, git and an element picker |
| `dispatch` | [Dispatch](https://github.com/lakiAlex/dispatch), an SFTP and FTP client |
| `cells` | [Cells](https://github.com/lakiAlex/cells), a spreadsheet editor for CSV, Excel and Google Sheets |
| `patchy` | [Patchy](https://github.com/lakiAlex/patchy), a security dashboard for WordPress, PHP, npm and Ubuntu |

The first line is needed once: Homebrew only loads casks from other taps after they are trusted.

The apps are not signed with an Apple Developer certificate or notarized. The casks remove the quarantine flag after install, so macOS opens them without the "cannot be verified" message.

All four run on Apple Silicon and Intel Macs. They update themselves from an Update button in their title bar, so the casks have `auto_updates true` and `brew upgrade` leaves them alone unless you pass `--greedy`.

## Updating a cask

After a release, change `version` and `sha256` in the cask so new installs get the latest version. The checksum of a release download:

```sh
curl -sL <dmg url> | shasum -a 256
```
