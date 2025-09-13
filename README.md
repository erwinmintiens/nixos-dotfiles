# Installation

```bash
git clone https://github.com/erwinmintiens/nixos-dotfiles.git ~/nixos-dotfiles
cd ~/nixos-dotfiles
cp /etc/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch --flake .
```

## Installing dependencies
### Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
