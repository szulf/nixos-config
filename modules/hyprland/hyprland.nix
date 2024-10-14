{
    config,
    pkgs,
    inputs,
    ...
}: {
    imports = [
        ../kitty/kitty.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;

        settings = {
            "decoration:rounding" = 15;

            "exec-once" = [
                "swww-daemon"
                "waybar"
            ];

            "$mod" = "SUPER";
            "$mod_shift" = "SUPER_SHIFT";
            "$terminal" = "kitty";

            bind = [
                # General bindings
                "$mod, RETURN, exec, $terminal"
                "$mod_shift, X, exit,"
                "$mod_shift, Q, killactive,"
                "$mod, J, cyclenext,"
                "$mod, K, cyclenext, prev"
                "$mod_shift, J, swapnext,"
                "$mod_shift, K, swapnext, prev"
                "$mod, m, fullscreen, 1"

                # Workspace Control
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"

                "$mod_shift, 1, movetoworkspacesilent, 1"
                "$mod_shift, 2, movetoworkspacesilent, 2"
                "$mod_shift, 3, movetoworkspacesilent, 3"
                "$mod_shift, 4, movetoworkspacesilent, 4"
            ];

            binde = [
                # Audio control
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ];
        };
    };

    home.packages = with pkgs; [
        swww
    ];

    programs.waybar = {
        enable = true;

        settings = [{
            spacing = 5;

            modules-left = [
                "hyprland/workspaces"
            ];

            modules-center = [
                "hyprland/window"
            ];

            modules-right = [
                "battery"
                "clock"
            ];

            battery = {
                format = "{capacity}%";
            };

            clock = {
                "tooltip-format" = "<tt><small>{calendar}</small></tt>";
            };
        }];
        
        style = ''
            * {
                font-family: "Monaspace Neon";
                font-size: 13px;
                padding: 0;
                margin: 0;
            }

            window#waybar {
                background: transparent;
            }

            #workspaces,
            #window,
            #clock,
            #battery {
                margin: 3px 0px 0 0px;
                border-radius: 15px;
                padding: 0 10px;
                color: #ffffff;
                background-color: rgba(0, 0, 0, 0.5);
                border: 1.5px solid #ffffff;
            }

            #workspaces {
                margin-left: 20px;
            }

            #workspaces button {
                color: #ffffff;
                padding: 0 5px;
            }

            #workspaces button:hover {
                color: #ffffff;
                background: transparent;
                border: 1px solid #ffffff;
            }

            #workspaces button.active {
                font-weight: bolder;
                text-shadow: 0px 0px 4px #ffffff;
            }

            #clock {
                margin-right: 20px;
            }
        '';
    };
}
