{ config, pkgs, ... }:

let 
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    # qtile = "qtile";
    nvim = "nvim";
    alacritty = "alacritty";
  };
in

{
  home.username = "moinsdix";
  home.homeDirectory = "/home/moinsdix";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    rofi
    signal-desktop
    rustdesk
    bruno
    zed-editor
    alacritty
    spotify
    obsidian
    bitwarden-desktop
    thunderbird
    librewolf
    localsend
    dbeaver-bin
    sqlitestudio
    qtcreator
    pcloud
    kdePackages.dolphin
    protonmail-desktop
    flameshot
    tldr
    firefox
    warp-terminal
    teams-for-linux

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    nmap # A utility for network discovery and security auditing

    # misc
    file
    which
    tree
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # compiler
    gcc
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Erwin Mintiens";
    userEmail = "erwin.mintiens@protonmail.com";
  };
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs; 

  # Install zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      dcompose="docker compose";
      pcompose="podman compose";
      wifi="nmcli device wifi";
    };
    sessionVariables = {
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = true;
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    custom = "$HOME/.oh-my-zsh/custom/";
    theme = "powerlevel10k/powerlevel10k";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
