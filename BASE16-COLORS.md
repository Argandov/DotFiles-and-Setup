# Colors + Fonts 

Environment configuration with:

* **Base16 Gorgoroth** ANSI palette in shell (Warp, iTerm2, etc.)
* **Neovim (NVChad)** using the Base16 Gorgoroth colorscheme
* **Yazi** TUI file manager following terminal palette
* **Indent-Blankline.nvim** disabled to avoid autocolor errors

## 1. Shell & Terminal ANSI Palette (Base16 Gorgoroth)

1. **Install base16-manager** (if not already):

   ```bash
   brew tap chrokh/tap
   brew install base16-manager
   ```

2. **Install the shell template**:

   ```bash
   base16-manager install chriskempson/base16-shell
   ```

3. **Install the Black-Metal template** (In this case for Gorgoroth):

[https://github.com/metalelf0/base16-black-metal-scheme](https://github.com/metalelf0/base16-black-metal-scheme)

   ```bash
   base16-manager install metalelf0/base16-black-metal-scheme
   ```

4. **Sourcing shell-init in `~/.zshrc` or `~/.bashrc`**:

!! This is for setting up the whole shell, NOT the terminal emulator.

The previous step places the themes under $HOME/.base16-manager/, so we only need to source them.

In `~/.zshrc`:

   ```bash
    source ~/.base16-manager/chriskempson/base16-shell/scripts/base16-black-metal-gorgoroth.sh
   ```
---

## 3. Neovim (NVChad) Configuration

I never had this to work, so I sticked with `monochrome` nvchad theme for now. (NOT colorscheme)

2. **Disable Indent-Blankline**

If indent-blankline is causing you problems, disable it in `~/.config/nvim/lua/custom/plugins.lua`

   In `~/.config/nvim/lua/custom/plugins.lua`, add:

   ```lua
   return {
     {
       "lukas-reineke/indent-blankline.nvim",
       enabled = false,
     },
   }
   ```

## 4. Yazi Configuration

Having the underlying terminal set up with base16 colors, we set yazi to just use the terminal palette.

1. Edit `~/.config/yazi/theme.toml`:

   ```toml
   [flavor]
   dark = "ansi"
   ```
