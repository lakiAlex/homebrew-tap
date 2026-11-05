# lakiAlex/homebrew-tap

Homebrew casks for my macOS apps.

```sh
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

The apps are not signed with an Apple Developer certificate or notarized. The casks remove the quarantine flag after install, so macOS opens them without the "cannot be verified" message.

Lookout runs on Apple Silicon and Intel Macs. Dispatch, Cells and Patchy are built for Apple Silicon. All need macOS 11 or later.

## Updating a cask

Change `version` and `sha256` in the cask. The checksum of a release download:

```sh
curl -sL <dmg url> | shasum -a 256
```
