# 🥂 Brunch

Brunch is a cheerful and colourful light and dark theme for
[Neovim](https://neovim.io) using only 8-bit ANSI colours. It aims to offer a
nicer theme for users with terminals without support for true colours.

## 🎨 Palettes

<!-- markdownlint-disable MD033 -->
<details>
<summary>🧁 Sunday</summary>
  <p>TODO</p>
</details>
<details>
<summary>☕️ Saturday</summary>
  <p>TODO</p>
</details>
<!-- markdownlint-enable MD033 -->

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
> `colorscheme brunch`.

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
}
```

## 📝 Licence

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file
for more information.
