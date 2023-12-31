# 🥂 Brunch

Brunch is a cheerful 🎉 and colourful 🌈 light and dark theme for
[Neovim](https://neovim.io) using only 8-bit ANSI colours. It aims to offer a
nicer theme for users with terminals without support for true colours.

<!-- markdownlint-disable MD033 -->
<p align="center">
  <img width="1300" alt="Preview of the Brunch colour scheme" src="https://github.com/anttikivi/brunch.nvim/assets/29656376/3e19cfaa-f928-4de1-a263-dc615ee8af9a">
</p>
<!-- markdownlint-enable MD033 -->

## 🎨 Palettes

<!-- markdownlint-disable MD013 MD033 -->
<details>
<summary>🧁 Sunday</summary>
  <img width="1046" alt="Preview of the Sunday variant the Brunch colour scheme" src="https://github.com/anttikivi/brunch.nvim/assets/29656376/6f16f11a-d996-4878-a848-5b7125008187">
</details>
<details>
<summary>☕️ Saturday</summary>
  <img width="1046" alt="Preview of the Saturday variant the Brunch colour scheme" src="https://github.com/anttikivi/brunch.nvim/assets/29656376/63f7b27d-6768-4b34-8899-30ae1d2f4f8a">
</details>
<!-- markdownlint-enable MD013 MD033 -->

## ⭐️ Motivation

There are a lot of great themes for Neovim, but most of them require true
colours. You may sometimes want to or have to use a terminal that doesn&rsquo;t
support those. More specifically, I haven&rsquo;t found a theme that I like with
the macOS `Terminal.app`.

Brunch is a [Catppuccin](https://github.com/catppuccin)-inspired theme that aims
to be a good-looking and usable theme for users with terminals that don&rsquo;t
have support for true colours.

## ✨ Features

- Supports most [Neovim](https://neovim.io) features.
- Usable as-is with terminals that support only 8-bit ANSI colours.
- Enhances terminal colours.
- Includes a light and dark theme.
- Integrates with many major plugins.

<!--
## ⚡️ Requirements

- [Neovim](https://neovim.io) >= 0.7.2
-->

## 📦 Installation

Use your preferred plugin manager to install Brunch.

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ "anttikivi/brunch.nvim", priority = 1000 }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "anttikivi/brunch.nvim" }
```

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'anttikivi/brunch.nvim'
```

## 🚀 Usage

**Vimscript**

```vim
colorscheme brunch
```

**Lua**

```lua
vim.cmd.colorscheme 'brunch'
```

## ⚙️ Configuration

> ❗️ **Note:** Make sure to call `setup` before setting the colour scheme with
> `colorscheme brunch` if you want to change the default options and settings.

You don&rsquo;t need to call `setup` if you don&rsquo;t want to change the
default options and settings.

```lua
require('brunch').setup {
  -- Sets the theme variant to use according to vim.o.background. The possible
  -- values for the variants are 'sunday' and 'saturday'.
  variants = {
    dark = 'saturday',
    light = 'sunday',
  },
  -- Configure the colors used when opening a `:terminal` in Neovim.
  terminal_colors = false,
  -- Style to be applied to various highlight groups.
  styles = {
    booleans = {},
    comments = { 'italic' },
    conditional = { 'italic' },
    functions = {},
    keywords = {},
    loops = {},
    numbers = {},
    operators = {},
    properties = {},
    strings = {},
    types = {},
    variables = {},
  },
}
```

## 📝 Licence

This project is licensed under the Apache-2.0 licence. See the
[LICENSE](LICENSE) file for more information.
