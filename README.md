# Installation

```bash
git clone https://github.com/erwinmintiens/nixos-dotfiles.git ~/nixos-dotfiles
```

## Installing dependencies
### Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Neovim

```bash
cd ~/nixos-dotfiles/config
git clone https://github.com/erwinmintiens/nvim.git
```

### Alacritty

```bash
cd ~/nixos-dotfiles/config
git clone https://github.com/erwinmintiens/alacritty.git
```

### Qtile (optional)

```bash
cd ~/nixos-dotfiles/config
git clone https://github.com/erwinmintiens/qtile.git
```

## Choose your environment and install (kde or qtile)

```bash
cd ~/nixos-dotfiles/kde
cp /etc/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch --flake .
```

