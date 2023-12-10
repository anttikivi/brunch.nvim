# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 1.0.0 (2023-12-10)


### ⚠ BREAKING CHANGES

* use Apache-2.0 licence
* remove MIT License
* remove the variant-specific startups
* greatly simplify the main module
* rename the colours

### Features

* add an utility for varying colours ([a2aefcc](https://github.com/anttikivi/brunch.nvim/commit/a2aefcc1280f804b9fda59599d21a0edea044ca0))
* add basic syntax highlighting ([84b92fc](https://github.com/anttikivi/brunch.nvim/commit/84b92fcd7ab1663b2e301495cee21224870906c3))
* add command line error message style ([de63ade](https://github.com/anttikivi/brunch.nvim/commit/de63ade51f3dd6b47493140817a0b7c649703a98))
* add cursor line and cursor column styles ([bac66ed](https://github.com/anttikivi/brunch.nvim/commit/bac66ed7747dedeb81ba46b0f0054758b3221a7d))
* add cursor styles ([c2b4eca](https://github.com/anttikivi/brunch.nvim/commit/c2b4eca6ce3f20f11d5c519b41184a65d2017b60))
* add diff styles ([e32e659](https://github.com/anttikivi/brunch.nvim/commit/e32e6592fdc548da86e7831bbf33610311b9249a))
* add end-of-buffer style ([39efa13](https://github.com/anttikivi/brunch.nvim/commit/39efa138ed60c8f3797624994fab2b845e823431))
* add first highlight groups and start creating the first palette ([80499d8](https://github.com/anttikivi/brunch.nvim/commit/80499d85854c3f688e4a6148996fee881fdaaddc))
* add float styles ([35f83b2](https://github.com/anttikivi/brunch.nvim/commit/35f83b2d6639bf1538780eb4156334f54e77bb5c))
* add fold styles ([ed4feef](https://github.com/anttikivi/brunch.nvim/commit/ed4feef282e819ecb2f1c4d699b6bef7306c0d24))
* add glyphs, rainbows and couple other highlights ([6c4be7c](https://github.com/anttikivi/brunch.nvim/commit/6c4be7ccada00a9f6b368d59cdf5385ad18ae1f5))
* add illumination highlights ([efd0560](https://github.com/anttikivi/brunch.nvim/commit/efd0560ed159df55e67f521bfd235674aef6cfc6))
* add line number styles ([07cbf06](https://github.com/anttikivi/brunch.nvim/commit/07cbf061bddc7a19256d493cfd964077cae5b892))
* add loading functionality and placeholders for compilation logic ([a60b46b](https://github.com/anttikivi/brunch.nvim/commit/a60b46b62effad696f7f2163348d885721b26d4b))
* add LSP styles ([96637e9](https://github.com/anttikivi/brunch.nvim/commit/96637e9691d1047523dfe9077133095750891020))
* add Lualine support ([e88acb2](https://github.com/anttikivi/brunch.nvim/commit/e88acb22084b58583f048ecd188cf4fb93176279))
* add message styles ([f7573a0](https://github.com/anttikivi/brunch.nvim/commit/f7573a0d78cdc2320ffb91134bb77b7acc77f1f8))
* add more configuration options ([ca7a57a](https://github.com/anttikivi/brunch.nvim/commit/ca7a57a735bdf36eb2ff60db096218cfd87f0e63))
* add normal mode styles ([3b56707](https://github.com/anttikivi/brunch.nvim/commit/3b567078235acc16193245ca5468112a4e89ecb0))
* add pop-up menu styles ([00eebe8](https://github.com/anttikivi/brunch.nvim/commit/00eebe8414c6f7510d7a4c1f659f36ceadd14166))
* add search styles and correct the order of some colours in some highlights ([f1d826c](https://github.com/anttikivi/brunch.nvim/commit/f1d826c2bd578283d59338763b9fa8762b946bd7))
* add sign columns styles ([840b3df](https://github.com/anttikivi/brunch.nvim/commit/840b3df45490a9b5a4140c97e2deacd9f28f6734))
* add special key highlight ([7955e0d](https://github.com/anttikivi/brunch.nvim/commit/7955e0de1e1f14e1ba68161a2afe54d9c64bd053))
* add spelling styles ([aadfe5b](https://github.com/anttikivi/brunch.nvim/commit/aadfe5bb4c59f2cff1640472339ecd012b80af12))
* add status line and tab line styles ([b5bc4f7](https://github.com/anttikivi/brunch.nvim/commit/b5bc4f7603600fd60bcf64a30ea6ef377f2b42ce))
* add style for concealed text ([d7feaad](https://github.com/anttikivi/brunch.nvim/commit/d7feaadc6912c15aff2d842771a9677e3697ce73))
* add style for directories ([8c36595](https://github.com/anttikivi/brunch.nvim/commit/8c3659579734d00ff36b8c3c12dc8e2cf5ba466d))
* add style for the matching parentheses ([85371f4](https://github.com/anttikivi/brunch.nvim/commit/85371f44e3ed5589b2fd6e8fff32d58ad2a06840))
* add style for the vertical column separating windows ([a53f47c](https://github.com/anttikivi/brunch.nvim/commit/a53f47cdba5a6b4fe2a31459c98e7e72557abb51))
* add styles for comments and the colour column ([16a8361](https://github.com/anttikivi/brunch.nvim/commit/16a8361d8024e8d446f2aa82043ba29f8e4ae939))
* add substitution highlight styles ([9b2d8d0](https://github.com/anttikivi/brunch.nvim/commit/9b2d8d0445a866b38206955ae3f8e583a246e5b6))
* add support for semantic LSP tokens ([6389bc4](https://github.com/anttikivi/brunch.nvim/commit/6389bc4d840f6cdf67bb9571a63560705dc7596a))
* add the basic startup logic ([d218115](https://github.com/anttikivi/brunch.nvim/commit/d218115fad5f1f70660d8df2e72b532f67be953b))
* add the colour palette to the scheme and rename `Config` to `Options` ([19daad3](https://github.com/anttikivi/brunch.nvim/commit/19daad37e5584c8cc869d561ce73820f93e7e601))
* add the improved highlights ([b02baf4](https://github.com/anttikivi/brunch.nvim/commit/b02baf45af9505280ca657d2fe845fd9c1038517))
* add the initial colours ([55dfb55](https://github.com/anttikivi/brunch.nvim/commit/55dfb550a069cdb15d3a3246da2c44a32e6a1c8f))
* add the integrations ([1a2c47c](https://github.com/anttikivi/brunch.nvim/commit/1a2c47c1c256fad721b147f9b934b682bb25e8ae))
* add the terminal highlight groups ([3948d42](https://github.com/anttikivi/brunch.nvim/commit/3948d42d79ba65d013dc2c8d4fe95636e47fdb9c))
* add the theme compilation logic ([1f98446](https://github.com/anttikivi/brunch.nvim/commit/1f98446ff8cbe25ad8540b56979067772dfd1bbe))
* add the Vim colour schemes ([2f24817](https://github.com/anttikivi/brunch.nvim/commit/2f248175927cb8b73f1758131643239956447bce))
* add title style ([78aed59](https://github.com/anttikivi/brunch.nvim/commit/78aed59c89d3dc480638a89bbf35988e20c0b840))
* add tree-sitter highlights ([5e22813](https://github.com/anttikivi/brunch.nvim/commit/5e22813be6630ad80a916fcbf52f63b7821e73f7))
* add visual mode styles ([ff25ae3](https://github.com/anttikivi/brunch.nvim/commit/ff25ae3b4e79154547ddb602e25fa222bec251b1))
* add warning message style ([3cacb59](https://github.com/anttikivi/brunch.nvim/commit/3cacb592129981ccca016bdcfacbe3c5db85e9d5))
* add whitespace, wild menu and window bar styles ([ef15eef](https://github.com/anttikivi/brunch.nvim/commit/ef15eef7c2e143c0cfce710b8527ece655b108fa))
* change the autocompletion pop-up menu so that it's readable ([f098016](https://github.com/anttikivi/brunch.nvim/commit/f0980168ee2759a9ff0cd3e3eddf2061e6a1a998))
* change the cursor style ([7fccaf8](https://github.com/anttikivi/brunch.nvim/commit/7fccaf85e2614130d9dc782f12c780cf85a5f36c))
* change the light blueberry colour ([d2ede35](https://github.com/anttikivi/brunch.nvim/commit/d2ede350013ddb593a6f252bec56231d400d036a))
* change the light colour scheme ([6fd821b](https://github.com/anttikivi/brunch.nvim/commit/6fd821bcd791335582433d1f6d7ec76510b49eee))
* change the light palette overlay colours ([d61542f](https://github.com/anttikivi/brunch.nvim/commit/d61542fe503227575abb3bf7423f21ed2bef8e16))
* change the virtual LSP texts to have more readable colours ([733222b](https://github.com/anttikivi/brunch.nvim/commit/733222b269409597cb5b18e321935780f56bd5d7))
* fine-tune some colours ([f7ad66f](https://github.com/anttikivi/brunch.nvim/commit/f7ad66fef8c15ced96d427b32c81844e79320fa1))
* fine-tune some colours ([8d1a331](https://github.com/anttikivi/brunch.nvim/commit/8d1a3319c7f2ad6e099aceafd62ed42a6e37b847))
* greatly simplify the main module ([12ee438](https://github.com/anttikivi/brunch.nvim/commit/12ee438edfdd7ceb857db8a500267fabc99b90a9))
* rename the colours ([1b7f928](https://github.com/anttikivi/brunch.nvim/commit/1b7f928b336125a34f6d5b9df7e4df5cecec9af2))
* set the syntax highlights ([a77427a](https://github.com/anttikivi/brunch.nvim/commit/a77427a4aa5c1e320d0000dc3fa9a2484a3d5a22))
* tune the light kale colour ([90f0830](https://github.com/anttikivi/brunch.nvim/commit/90f0830123147ec875f53772ece8261b2ef67ad6))
* tune the pop-menu and float styles ([8499ed9](https://github.com/anttikivi/brunch.nvim/commit/8499ed957c43cefe2fb9adedb5a80fefda2fb369))


### Bug Fixes

* change the colours numbers ([c0081a3](https://github.com/anttikivi/brunch.nvim/commit/c0081a30397f5b4b6a1419f2e1c770a071005916))
* fix a wrong accessor ([057db75](https://github.com/anttikivi/brunch.nvim/commit/057db759b67fb08ee547afeeb9ae632ef527dc0d))
* fix loading the colour scheme ([7e27874](https://github.com/anttikivi/brunch.nvim/commit/7e27874d56c3e4d5f94eb5e25dce7224c19bf028))
* fix the Git path for the cache ([36065ce](https://github.com/anttikivi/brunch.nvim/commit/36065ce0c17dd7f834a796ff541632d21efcf4a5))
* fix the integration loading ([b466b2e](https://github.com/anttikivi/brunch.nvim/commit/b466b2e8db8b29de61f62aaf5f551894b99bb71a))
* fix the Saturday avocado colour ([bf67829](https://github.com/anttikivi/brunch.nvim/commit/bf678292e83dbf1f5ab3c5352b1dfae729a5b517))
* fix the Saturday rosewater colour ([71abdf7](https://github.com/anttikivi/brunch.nvim/commit/71abdf7abbfe5a83c5d053a7ec083ce2133d87ba))
* make the unnecessary diagnostic texts more readable ([718859f](https://github.com/anttikivi/brunch.nvim/commit/718859f662b60c8eb2f734f07597f750714cdfc5))
* replace the unsupported colour functions ([a79c8d6](https://github.com/anttikivi/brunch.nvim/commit/a79c8d61880a3a72c3938b0e73080a30b792ce86))
* use the currect variables for setting the colours with ANSI colour codes ([ab8d855](https://github.com/anttikivi/brunch.nvim/commit/ab8d8557ea02daa1c836cded33d886369554ee0e))


### Documentation

* remove MIT License ([316515d](https://github.com/anttikivi/brunch.nvim/commit/316515d02b4aa35f6dc37e286e84f625974ee18a))
* use Apache-2.0 licence ([db47e3c](https://github.com/anttikivi/brunch.nvim/commit/db47e3cabfef06fbc9aa360bc8a68b6dfeb04397))


### Code Refactoring

* remove the variant-specific startups ([52cc33e](https://github.com/anttikivi/brunch.nvim/commit/52cc33e1929957d380ebc448eb4933e7e5ef9a67))

## [Unreleased]

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
