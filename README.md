# Zig + Grok Build Codespace template

A GitHub template for Zig development in [Codespaces](https://github.com/features/codespaces), with the [Grok Build](https://github.com/xai-org/grok-build) CLI (`grok`) preinstalled.

Pinned toolchain: **Zig 0.16.0** (override with `ZIG_VERSION` in `.devcontainer/devcontainer.json`).

## Use this template

1. On GitHub, open [this repository](https://github.com/stayler92/zig-grok-codespace-template).
2. Click **Use this template** → **Create a new repository** (or **Open in a codespace**).
3. In the new repo: **Code** → **Codespaces** → **Create codespace on main**.

The first start runs `.devcontainer/post-create.sh`, which installs:

- Zig 0.16.0 for `x86_64` or `aarch64` Linux
- matching ZLS when a release exists (otherwise the Zig VS Code extension fetches it)
- Grok Build via `https://x.ai/cli/install.sh`
- GitHub CLI

## Authenticate Grok Build

Codespaces is a remote Linux box, so browser OAuth is awkward. Use one of these:

### Option A — Codespaces secret (recommended)

1. Create an API key at [console.x.ai](https://console.x.ai).
2. In GitHub: **Settings** → **Secrets and variables** → **Codespaces** → **New secret**.
3. Name it `XAI_API_KEY` and paste the key.
4. Rebuild / recreate the codespace so the secret is injected.

Then:

```bash
grok
```

### Option B — device login

```bash
grok login --device-auth
```

Follow the printed URL and code on a machine that has a browser.

## Everyday commands

```bash
zig version
zig build
zig build run
zig build test
zig fmt src

grok                  # interactive TUI in the project root
grok -p "Explain this Zig project"
```

VS Code / Codespaces already has the official `ziglang.vscode-zig` extension. Format-on-save is on for `.zig` files.

## Layout

```
.devcontainer/
  devcontainer.json    # Codespaces / Dev Containers definition
  post-create.sh       # install Zig, ZLS, grok
  post-start.sh        # auth reminder each start
src/main.zig           # starter program + test
build.zig              # Zig 0.16 build graph
build.zig.zon          # package manifest
```

Change `ZIG_VERSION` in `devcontainer.json` and rebuild the container to switch compilers. Keep `minimum_zig_version` in `build.zig.zon` in sync.

## Make this repo a GitHub template

If you forked or copied this and the green **Use this template** button is missing:

**Settings** → **General** → **Template repository**.

## Local Dev Containers

This same `.devcontainer` works in VS Code Dev Containers or compatible tools. You still need Docker and the Dev Containers extension.

## License

MIT. Zig is MIT. Grok Build is Apache-2.0 and is installed at codespace create time, not vendored here.
