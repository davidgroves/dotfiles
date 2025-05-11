# What is this.

These are the install steps I use for a new [Framework 13](https://frame.work/gb/en/laptop13).
Relevant hardware, my model has the 120hz high resolution screen.

You will need to be able to attach a Wired Ethernet Connection and a USB Keyboard during the install.
I used a [Bekin USB-C Hub with Ethernet](https://www.belkin.com/uk/p/usb-c-4-in--core-hub/AVC005btBK.html), but using 
the builtin USB-A and Ethernet modules should work fine too.

## Hardware

Use fn + esc to turn off fn lock. F keys work as normal, you need Fn to use volume controls etc ...
This persists across reboots.

Use fn + space to turn on the keyboard backlight if required.

## Installing Debian - (Stable)

- Use a USB keyboard, as the keyboard doesn't work with Debian Stable.
- Use a Wired Network Connection, as the Wifi doesn't work with Debian Stable.
- Install [Debian 12 Stable](https://www.debian.org/download) from USB Key.
  - Make sure the root filesystem is installed using BTRFS, to support snapshots.

## Upgrading to Unstable

- Change `/etc/apt/sources.list` from `bookworm` to `sid`
- Run `apt-get update` and then `apt-get dist-upgrade`
- Run `apt modernize`
- Run `apt autoremove`
- Install the `firmware-mediatek package`, to get wifi access.
- Add your user to the sudo group with `vi /etc/group`

## Add Experimental

Add this to /etc/apt/sources.list.d/experimental.sources

```
Types: deb deb-src
URIs: http://deb.debian.org/debian/
Suites: experimental
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```
```

## Reboot

- Reboot so your wifi and keyboard work.

## Fix GRUB so you can read boot messages.

- Edit `/etc/default/grub` and uncomment `GRUB_GFXMODE`
- Run `sudo update-grub`

## Fix Console so it is readable.

- Run `sudo dpkg-reconfigure console-setup`.
- Select `UTF-8`, `Latin 1`, `DejaVu` and `24x43`.

## Setup GNOME Settings

In `Settings`.

- In Trackpad, reverse trackpad scroll direction.
- In Wi-Fi, setup wifi network.
- In Displays, set Scale to 175% and Refresh Rate to 120hz.
- In Power, set Show Battery Percentage.
- In Multitasking, disable Hot Corners and Active Screen Edges.
- In Multitasking, set Fixed Workspaces, and 8 Workspaces, and Workspaces on All Displays.
- In Apperance, Set Dark Mode.
- In Keyboard, Set Compose Key -> Right Alt, and Screenshot -> Interactive to Shift + Super + S.
- In System, Set Time Format to 24 hours and Clock to display Seconds.

## Installing software I use.

- Install the following packages.

```
apt install build-essential neovim git tmux curl gimp vlc imagemagick neomutt rustc cargo fd-find fzf jq hyperfine bat ripgrep pandoc poppler-utils snapd gpg wireshark tshark virt-manager fonts-firacode lsd obs-studio bind9-tools awscli opentofu golang postgresql-client mariadb-client gh flatpak gnome-shell-extension-manager pipx knotdns-utils locate python-is-python3 dia graphviz texlive texlive-luatex wp2latex texlive-full lua libfuse2 texmaker audacity handbrake snapper gnome-software-plugin-flatpak binutils-dev clang  libbpf-dev libbpf-tools libelf-dev llvm pkg-config zlib1g-dev lldpd tcpdump ncal
```

- Add flathub to software sources with `flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`

- Use [Microsoft's Instructions](https://code.visualstudio.com/docs/setup/linux) to get vscode.
  - Use `dpkg -i ~/Downloads/code...` to install.
  - Accept adding the apt repo.

- Use `curl -LsSf https://astral.sh/uv/install.sh | sh` to install uv.

- Use the `Software` to install `Gnome Console`.

- Use `snap` to install software.

`sudo snap install bitwarden ferdium cheat slack discord rawtherapee mattermost-desktop teams-for-linux pinta localsend spotify 
`sudo snap install opentofu --classic`

- Install [Google Chrome](https://www.google.com/chrome/) using :-

```
sudo -i
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor > /usr/share/keyrings/google-chrome.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt update
apt install google-chrome-unstable
```

- Install [Docker](https://www.docker.com/) using [The Docker Install Instructions](https://docs.docker.com/engine/install/debian/#install-using-the-repository)
- Install [Ansible Vault Keyring](https://github.com/davidgroves/ansible_vault_keyring) with `uv tool install ansible-vault-keyring`

- Install [Vagrant](https://developer.hashicorp.com/vagrant) with the [Hashicorp Install Instructions](https://developer.hashicorp.com/vagrant/install)
  - You may need to change the Debian codename in `/etc/apt/sources.list.d/hashicorp.list`, as it won't have sid. Go to current stable release codename.

- Install [ulauncher](https://ulauncher.io/) by getting a [release](https://github.com/Ulauncher/Ulauncher/releases/), .deb file and doing `sudo apt install ~/Downloads/ulauncher_5.15.7_all.deb` to install it, correcting the version.
  - Also follow the [Wayland Instructions](https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland)

- Install the [systemd TUI](https://github.com/rgwood/systemctl-tui). `cargo install systemctl-tui --locked`

- Install [bun](https://bun.sh/) with `curl -fsSL https://bun.sh/install | bash`

- Install [pgadmin4](https://www.pgadmin.org/) by following the [install instructions](https://www.pgadmin.org/download/pgadmin-4-apt/)

- Install Gear Lever to manage flatpaks with `flatpak install flathub it.mijorus.gearlever app/org.ghidra_sre.Ghidra/x86_64/stable
`.

- Install [Cursor] by going to the page, selecting "Download for Linux", then doing the commands below (selecting the current version).

```
sudo mkdir -p /opt/cursor
sudo mv ~/Downloads/Cursor-0.49.6-x86_64.AppImage /opt/cursor/
chmod a+x /opt/cursor/Cursor-0.49.6-x86_64.AppImage
echo "alias cursor=/opt/cursor/Cursor-0.49.6-x86_64.AppImage" >> ~/.bashrc.local
. ~/.bashrc.local
```

- Install [Youtube Music Desktop](https://github.com/ytmdesktop/ytmdesktop) with `flatpak install flathub app.ytmdesktop.ytmdesktop`
 - Then launch it with `flatpak run app.ytmdesktop.ytmdesktop` and pin it to the dock
 - Download my "Focus" playlists.

- Install Gear Lever to manage flatpaks, with `flatpak install it.mijorus.gearlever`

## Add Gnome Extensions

```
gext install tophat@fflewddur.github.io
gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh

gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true

gsettings set org.gnome.shell.extensions.space-bar.behavior smart-workspace-names false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-activate-workspace-shortcuts false
gsettings set org.gnome.shell.extensions.space-bar.shortcuts enable-move-to-workspace-shortcuts true
gsettings set org.gnome.shell.extensions.space-bar.shortcuts open-menu "@as []"

gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

gsettings set org.gnome.desktop.interface clock-show-weekday true
```

## Setup ollama/mistral as local LLM.

- `ollama pull mistral`

## Setup Default Apps

- Search for `apps` and pick `default apps`.
- Set `web` to be `googlte chrome unstable`

## Add groups for apps

- Edit /etc/groups and add yourself to libvirt, libvirt-qemu, docker and wireshark

## Setup Shortcuts.

- In `Settings` -> `Keyboard`, select `Keyboard Shortcuts`.
- Set a `Custom Shortcut`. CTRL-ALT-T for the binary `kgx`.

## Fix App Launcher
 
- Remove all apps from the dash, except File Manager.
- Pin the Console.
- Pin Google Chrome.
- Pin Ferdium.
- Pin Slack.
- Pin Discord.
- Pin Mattermost.

## Install my SSH keys.

- Retrieve keys from secure vault and install in ~/.ssh
- Make sure the keys are chmod 600.

## Install my GPG keys.

- Retrieve keys from secure vault and install in ~/.gnupg
- Make sure the keys are chmod 600.

## Headshot.

- Download a headshot and put it in ~/Pictures/
- Go to `settings` -> `user`, and use the headshot as the user account image.

## Confirm you are running Wayland.

- Confirm you get WAYLAND from `echo $XDG_SESSION_TYPE`

## Disable password SSH authenticaton.

- Edit `/etc/ssh/sshd_config` and uncomment and set `PasswordAuthentication no`

## Init the locate database.

- `sudo updatedb`

## Setup filesystem snapshotting

- `snapper -c root create-config /`

## Install 0xtools

- Currently you need to install the [next version](https://github.com/tanelpoder/0xtools/tree/master/next) to use modern EBPF tools, but this may change.

## Let non-root users run tcpdump.

- `sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/tcpdump`

## In `tweaks`, do 

- Fonts -> Monospace Text -> Fira code
- Apperance -> Legacy Apps -> Adwaita-Dark
- Windows -> Titlebar Buttons -> Maximize
- Windows -> Titlebar Buttons -> Minimize
- Startup Applications -> Remove Mattermost

## Reboot

- Reboot so all groups and other changes are fully in effect.

