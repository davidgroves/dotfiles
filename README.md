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


```
######## Debian 12 install 

sudo snap install cheat
sudo apt install fd-find
sudo apt install pipx
pipx install grip
sudo apt install delta-git
sudo snap install dust
sudo apt install fzf
sudo apt install jq
sudo apt install hyperfine
sudo apt install bat

# Ripgrep
sudo apt install ripgrep pandoc poppler-utils ffmpeg

# Ripgrep-all must have the binary installed manually.
```

```
######### OSX / Homebrew Install

brew install cheat
brew install ffind
brew install pipx
brew install dust
brew install grip
brew install fzf
brew install jq
brew install hyperfine
brew install bat
brew install tree
```

