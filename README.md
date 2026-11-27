# Antimeme AI Homebrew Tap

Official Homebrew tap for **Blackbird** and **`mp-outpost`** ([multiplayer.tech](https://multiplayer.tech)).

## Install

```sh
brew tap antimeme-ai/tap
brew install blackbird
brew install mp-outpost
```

Or directly in one command:

```sh
brew install antimeme-ai/tap/blackbird
brew install antimeme-ai/tap/mp-outpost
```

## Quick Start

```sh
blackbird login
```

Inside a Blackbird session, invite friends or jump straight into a shared room:

```text
/invite @friend
/join
```

## Formulae

| Formula | Version | Platforms | Upstream Repository |
| --- | --- | --- | --- |
| `blackbird` | `0.8.1` | macOS (`arm64`), Linux (`x86_64`) | [antimeme-ai/blackbird](https://github.com/antimeme-ai/blackbird) |
| `mp-outpost` | `0.7.0` | macOS (`arm64`), Linux (`x86_64`, `arm64`) | [antimeme-ai/outpost](https://github.com/antimeme-ai/outpost) |

### Relocatable Bundle Layout (`blackbird`)

`Formula/blackbird.rb` installs the complete release tree (`bin/`, Linux `lib/`, `scripts/`, `share/blackbird/{programs,assets,profiles}`, `MANIFEST`) under `libexec` and exposes a managed wrapper at `bin/blackbird` that sets `BLACKBIRD_SPRITE_ASSET` and executes `libexec/scripts/blackbird`. This preserves Linux `$ORIGIN/../lib` RPATH resolution and keeps helper binaries out of `HOMEBREW_PREFIX/bin`.

## Releasing Updates

Trigger `.github/workflows/bump-formula.yml` via `workflow_dispatch` (or `workflow_call` from release CI) with `formula` (`mp-outpost` or `blackbird`) and `version` (`vX.Y.Z`). The workflow fetches the release's `release-manifest.json`, verifies SHA-256 digests, updates `Formula/<formula>.rb`, checks `ruby -c`, and opens a PR.

## Local Verification

```sh
ruby -c Formula/*.rb
brew style Formula/mp-outpost.rb Formula/blackbird.rb
```

## License

MIT — see [LICENSE](LICENSE).
