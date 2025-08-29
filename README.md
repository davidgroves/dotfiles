# dotfiles

A collection of dotfiles used by myself. Mostly for my own reference/use, but handy if anyone else wants to use something I use.

Some of the things in the .bashrc require bash4. If you are running a Mac, you likely have bash3 unless you have installed it from something like homebrew. You can either remove the lines bash complains about, or install bash4. 

If you require local company specific or machine specific configuration, bash sources `

## Utilities.

A checklist of tools I'd like to install on a workstation system, with Debian 12 and OSX (homebrew) install instructions.

- [Cheat](https://github.com/cheat/cheat). A set of cheatsheets for common unix commands.
- [fd](https://github.com/sharkdp/fd). A find alternative.
- [Grip](https://github.com/joeyespo/grip). A standalone Markdown viewer with github markdown support. 
- [Delta](https://github.com/dandavison/delta). An improved pager for git, that makes looking at `git diff` and `git grep` output easier.
- [Dust](https://github.com/bootandy/dust). du but like treespace.
- [fzf](https://github.com/junegunn/fzf). A fuzzy finder.
- [jq](https://github.com/jqlang/jq). A json formatter.
- [hyperfine](https://github.com/sharkdp/hyperfine). A CLI benchmarking tool.
- [bat](https://github.com/sharkdp/bat). A cat alternative with syntax highlighting. Note Debian calls the binary `batcat`.
- [ripgrep-all](https://github.com/phiresky/ripgrep-all). A grep replacement that can search a lot of different file types, including PDF, doc, docx and even subtitles in movie file formats.
- [uv](https://github.com/astral-sh/uv). Astral. A tool to make working with Python packages fast and sane.

```
########## DEBIAN 12/13 INSTALL GUIDE ########## 

sudo apt install snapd fd-find delta-git fzf jq hyperfine bat pipx ripgrep pandoc poppler-utils ffmpeg
sudo snap install cheat dust
pipx install grip ux

######### #OSX / Homebrew Install ########## 

brew install cheat
brew install ffind
brew install dust
brew install grip
brew install fzf
brew install jq
brew install hyperfine
brew install bat
brew install tree
brew install uv
```

