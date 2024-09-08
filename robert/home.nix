{ configs, pkgs, ... } :

{
    home = {
        username = "robert";
        homeDirectory = "/home/robert";
        stateVersion = "24.05";

	packages = with pkgs; [
            neofetch
            vim
            fd
            dust
            eza
            i3lock

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

        kitty = {
            enable = true;
        };
        
        zsh = {
            enable = true;
            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            initExtra = ''
                set -o vi
            '';
            shellAliases = {
                nixbuild = "sudo nixos-rebuild switch --flake /home/robert/nixos_config";
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
    };

    

   
    dconf.settings = {
        "org/gnome/shell" = {
            disable-user-extensions = false;
            disabled-extensions = [];
            enabled-extensions = [
                "pop-shell@system76.com"
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
        "org/gnome/settings-daemon/plugins/media-keys" = {
            custom-keybindings = [
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
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
        };
        "org/gnome/desktop/wm/preferences" = {
            num-workspaces = 10;
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

            close = ["<Super>w"];
        };
    
    };
                
}
