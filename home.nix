{ config, pkgs, ... }:

{
  imports = [
    ./vscode.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nico";
  home.homeDirectory = "/home/nico";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # zsh-powerlevel10k
    nixfmt-rfc-style
    fzf
    htop
    jq
    brave
    slack
    postman
    mongodb-compass
    zoom-us
    obsidian
    wl-clipboard # provides wl-copy and wl-paste (Wayland clipboard)

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nico/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # XDG configuration
  xdg = {
    enable = true;
    mime.enable = true;
    systemDirs.data = [ "${config.home.homeDirectory}/.nix-profile/share/applications" ];
  };

  # Autostart applications
  home.file.".config/autostart/slack.desktop".source =
    "${pkgs.slack}/share/applications/slack.desktop";
  home.file.".config/autostart/brave-browser.desktop".source =
    "${pkgs.brave}/share/applications/brave-browser.desktop";
  home.file.".config/autostart/code.desktop".source =
    "${pkgs.vscode}/share/applications/code.desktop";
  home.file.".config/autostart/kitty.desktop".source =
    "${pkgs.kitty}/share/applications/kitty.desktop";

  programs.git = {
    enable = true;
    userName = "nicob21";
    userEmail = "nico.bernard@rhino.fi";
    extraConfig = {
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_25519_sign_commits.pub";
      commit.gpgsign = true;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.kitty = {
    enable = true;
    themeFile = "ayu_mirage";
    settings = {
      # Font settings
      font_size = "16.0";

      # Tab bar styling - clean and minimal
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_bar_min_tabs = 1;
      tab_fade = "0.25 0.5 0.75 1";
      tab_title_template = " {index}: {title} ";
      
      # Active tab colors
      active_tab_foreground = "#fff";
      active_tab_background = "#5c6370";
      active_tab_font_style = "bold";
      
      # Inactive tab colors
      inactive_tab_foreground = "#abb2bf";
      inactive_tab_background = "#282c34";
      inactive_tab_font_style = "normal";

      # Other settings
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      scrollback_lines = 10000;
    };
    keybindings = {
      # Copy/Paste
      "ctrl+c" = "copy_to_clipboard";
      "ctrl+v" = "paste_from_clipboard";

      # Tabs
      "ctrl+t" = "new_tab";
      "ctrl+w" = "close_tab";
      
      # Tab navigation
      "ctrl+page_up" = "previous_tab";
      "ctrl+page_down" = "next_tab";
      "ctrl+1" = "goto_tab 1";
      "ctrl+2" = "goto_tab 2";
      "ctrl+3" = "goto_tab 3";
      "ctrl+4" = "goto_tab 4";
      "ctrl+5" = "goto_tab 5";
      "ctrl+6" = "goto_tab 6";
      "ctrl+7" = "goto_tab 7";
      "ctrl+8" = "goto_tab 8";
      "ctrl+9" = "goto_tab 9";

      # Navigation - beginning/end of line
      "ctrl+left" = "send_text all \\x01"; # Ctrl+A (beginning of line)
      "ctrl+right" = "send_text all \\x05"; # Ctrl+E (end of line)

      # Navigation - word by word
      "alt+left" = "send_text all \\x1b[1;3D"; # Alt+Left
      "alt+right" = "send_text all \\x1b[1;3C"; # Alt+Right

      # Delete full line
      "ctrl+backspace" = "send_text all \\x15"; # Ctrl+U (delete from cursor to beginning of line)
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ".." = "cd ..";
      "ll" = "ls -la";
      "core" = "cd ~/rhino/rhino-core";
      "pbcopy" = "wl-copy";
      "pbpaste" = "wl-paste";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = ".p10k.zsh";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "powerlevel10k";
    };
  };

  # GNOME dconf settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      text-scaling-factor = 1.1; # adjust as needed (1.0 = 100%, 1.5 = 150%, etc.)
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/.wallpaper";
      picture-uri-dark = "file://${config.home.homeDirectory}/.wallpaper";
      picture-options = "zoom";
    };
    "org/gnome/desktop/session" = {
      idle-delay = 600; # seconds before screen goes blank (300 = 5 minutes, 0 = never)
    };
  };

  # Wallpaper
  home.file.".wallpaper".source = ./wallpapers/milkyway.jpg;

  # Brave flags for touchpad gestures
  home.file.".config/brave-flags.conf".text = ''
    --enable-features=TouchpadOverscrollHistoryNavigation
  '';

}
