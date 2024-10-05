{ configs, pkgs, lib, ... } :

{
    home = {
        username = "robert";
        homeDirectory = "/home/robert";
        stateVersion = "24.05";

	packages = with pkgs; [
            neofetch
            fd
            dust
            eza
            i3lock
            discord
            brave
            obsidian
            ffmpeg_7-full
            btop
            htop
            wget
            vlc
            transmission_4-gtk
            protonvpn-gui
            (pkgs.python3.withPackages (python-pkgs: with python-pkgs;[
                pandas
                numpy
                matplotlib
                ipython
                tqdm
            ]))

            # gnome
            gnome.dconf-editor
            gnome.gnome-tweaks
        ];
    };



    programs = {
        git = {
            enable = true;
            userName = "Robertleoj";
            userEmail = "robert.leo.jonsson@gmail.com";
        };

        starship = {
            enable = true;
        };

        kitty = lib.mkForce {
            enable = true;
            settings = {
                font_family = "JetBrainsMono Nerd Font";
                confirm_os_window_close = 0;
                hide_window_decorations = true;
                enable_audio_bell = false;

                foreground = "#f8f8f2";
                background = "#282a36";
                selection_foreground = "#ffffff";
                selection_background  = "#44475a";

                url_color = "#8be9fd";

                # black
                color0 = "#21222c";
                color8 = "#6272a4";

                # red
                color1 = "#ff5555";
                color9 = "#ff6e6e";

                # green
                color2 = "#50fa7b";
                color10 = "#69ff94";

                # yellow
                color3 = "#f1fa8c";
                color11 = "#ffffa5";

                # blue
                color4 = "#bd93f9";
                color12 = "#d6acff";

                # magenta
                color5 = "#ff79c6";
                color13 = "#ff92df";

                # cyan
                color6 = "#8be9fd";
                color14 = "#a4ffff";

                # white
                color7 = "#f8f8f2";
                color15 = "#ffffff";

                # Cursor colors
                cursor = "#f8f8f2";
                cursor_text_color = "background";

                # Tab bar colors
                active_tab_foreground = "#282a36";
                active_tab_background = "#f8f8f2";
                inactive_tab_foreground = "#282a36";
                inactive_tab_background = "#6272a4";

                # Marks
                mark1_foreground = "#282a36";
                mark1_background = "#ff5555";

                # Splits/Windows
                active_border_color = "#f8f8f2";
                inactive_border_color = "#6272a4";
            };
        };
        
        zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            initExtra = ''
                set -o vi
                bindkey '^ ' autosuggest-accept
            '';
            shellAliases = {
                nixbuild = "sudo nixos-rebuild switch --flake /home/robert/nixos_config";
                ls = "exa --icons";
                ll = "exa --icons -la";
                l = "exa --icons -a";
                la = "exa --icons -a";
            };

            oh-my-zsh = {
                enable = true;
                plugins = [ "git" ];
                theme = "robbyrussell";
            };
        };

        vscode = {
            enable = true;
        };
	
        home-manager.enable = true;
        neovim = {
            enable = true;
            defaultEditor = true;
            viAlias = true;
            vimAlias = true;
            plugins = with pkgs.vimPlugins; [
                vim-airline
            ];
            extraConfig = ''
                set number relativenumber
            '';
        };
    };

    

   
    dconf.settings = {
        "org/gnome/shell" = {
            disable-user-extensions = false;
            disabled-extensions = [];
            enabled-extensions = [
                "pop-shell@system76.com"
                "user-theme@gnome-shell-extensions.gcampax.github.com"
                "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
                "system-monitor@gnome-shell-extensions.gcampax.github.com"
            ];
        };
        "org/gnome/shell/extensions/pop-shell" = {
            tile-by-default = true;
            active-hint = true;
            hint-color-rgba = "rgb(175,63,192)";
        };
        "org/gnome/desktop/input-sources" = {
            xkb-options = [
                "altwin:swap_lalt_lwin"
                "caps:ctrl_modifier"
            ];
        };
        "org/gnome/desktop/default-applications/terminal" = {
            exec = "kitty";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
            binding = "<Super>t";
            command = "kitty";
            name = "open-kitty";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
            binding = "<Super>i";
            command = "i3lock";
            name = "i3lock";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
            binding = "<Super>b";
            command = "brave";
            name = "Brave";
        };
        "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
            ];
        };
        "org/gnome/shell/keybindings" = {
            switch-to-application-1 = [];
            switch-to-application-2 = [];
            switch-to-application-3 = [];
            switch-to-application-4 = [];
            switch-to-application-5 = [];
            switch-to-application-6 = [];
            switch-to-application-7 = [];
            switch-to-application-8 = [];
            switch-to-application-9 = [];
            toggle-quick-settings = [];
        };
        "org/gnome/desktop/wm/preferences" = {
            num-workspaces = 10;
            theme = "Dracula";
        };
        "org/gnome/desktop/wm/keybindings" = {
            switch-to-workspace-1 = ["<Super>1"];
            switch-to-workspace-2 = ["<Super>2"];
            switch-to-workspace-3 = ["<Super>3"];
            switch-to-workspace-4 = ["<Super>4"];
            switch-to-workspace-5 = ["<Super>5"];
            switch-to-workspace-6 = ["<Super>6"];
            switch-to-workspace-7 = ["<Super>7"];
            switch-to-workspace-8 = ["<Super>8"];
            switch-to-workspace-9 = ["<Super>9"];
            switch-to-workspace-10 = ["<Super>0"];

            move-to-workspace-1=["<Super><Shift>1"];
            move-to-workspace-2=["<Super><Shift>2"];
            move-to-workspace-3=["<Super><Shift>3"];
            move-to-workspace-4=["<Super><Shift>4"];
            move-to-workspace-5=["<Super><Shift>5"];
            move-to-workspace-6=["<Super><Shift>6"];
            move-to-workspace-7=["<Super><Shift>7"];
            move-to-workspace-8=["<Super><Shift>8"];
            move-to-workspace-9=["<Super><Shift>9"];
            move-to-workspace-10=["<Super><Shift>0"];

            activate-window-menu = [];

            close = ["<Super>w"];
            minimize = [];
        };
        "org/gnome/desktop/interface" = {
            gtk-theme = "Dracula";
            color-scheme = "prefer-dark";
            gtk-color-palette = "black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90";
        };
        "org/gnome/shell/extensions/pop-shell" = {
            pop-workspace-up = [];
            pop-workspace-down = [];
            pop-monitor-down = [];
            pop-monitor-left = [];
            pop-monitor-right = [];
            tile-move-right-global = ["<Super><Shift>l"];
            tile-move-up-global = ["<Super><Shift>k"];
            tile-move-left-global = ["<Super><Shift>h"];
            tile-move-down-global = ["<Super><Shift>j"];
        };
    
    };
                
}
