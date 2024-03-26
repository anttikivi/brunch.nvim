# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0](https://github.com/anttikivi/brunch.nvim/compare/v0.1.0...v0.2.0) (2024-01-10)


### Features

* change the floating window colour for the Saturday variant ([fa97272](https://github.com/anttikivi/brunch.nvim/commit/fa972726b5071bf05bfa90fdc2b5aeaec1ac2ef4))
* revert the varying colour for the floating window ([1009792](https://github.com/anttikivi/brunch.nvim/commit/1009792bfa26f0f989848b632525e1f00230dc25))


### Bug Fixes

* fix the varying colours ([1089296](https://github.com/anttikivi/brunch.nvim/commit/1089296c094f5e55856221ef5362be033619bf70))

## [Unreleased]

### Changed

- Floating window background colour for the Saturday variant is lighter.

### Fixed

- Varying the colours for highlights that have different keys for Sunday and
  Saturday variants.

## [0.1.0] - 2023-12-10

### Added

- Light colour scheme variant called `sunday`.
- Dark colour scheme variant called `saturday`.
- Improved highlight queries for `css`, `javascript` and `typescript`.
- Highlights for [Neovim&rsquo;s](https://neovim.io) default highlighting
  groups.
- Highlights for [Neovim&rsquo;s](https://neovim.io) native LSP highlighting
  groups.
- Highlights for
  [`tree-sitter`&rsquo;s](https://github.com/nvim-treesitter/nvim-treesitter)
  highlighting groups.
- Highlights for
  [`vim-illuminate`&rsquo;s](https://github.com/RRethy/vim-illuminate)
  highlighting groups.
- Highlights for
  [`gitsigns.nvim`&rsquo;s](https://github.com/lewis6991/gitsigns.nvim)
  highlighting groups.
- [`lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim) support.

[unreleased]: https://github.com/anttikivi/brunch.nvim/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/anttikivi/brunch.nvim/releases/tag/v0.1.0
