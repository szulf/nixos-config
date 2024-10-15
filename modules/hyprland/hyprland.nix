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
                ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%-"
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
            spacing = 8;

            modules-left = [
                "clock"
            ];

            modules-center = [
                "hyprland/workspaces"
            ];

            modules-right = [
                "wireplumber"
                "battery"
                "network"
                "custom/power"
            ];

            wireplumber = {
                format = " {volume}%";
                "format-muted" = " {volume}%";
                "on-scroll-up" = "wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+";
                "on-scroll-down" = "wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%-";
                "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };

            battery = {
                format = "{icon} {capacity}%";
                "format-icons" = ["" "" "" "" ""];
            };

            network = {
                format-ethernet = " {signalStrength}%";
                format-wifi = " {signalStrength}%";
                format-disconnected = "󰤭 ";
            };

            clock = {
                format = "{:%H:%M %A, %b %d, %Y}";
            };

            "custom/power" = {
                format = "";
                "on-click" = "shutdown -h now";
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

            #clock,
            #workspaces,
            #wireplumber,
            #battery,
            #network,
            #custom-power {
                margin: 3px 0 0 0;
                border-radius: 15px;
                padding: 0 10px;
                color: #ffffff;
                background-color: rgba(0, 0, 0, 0.5);
                border: 1.5px solid #ffffff;
            }

            #clock {
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

            #custom-power {
                margin-right: 20px;
                padding-right: 15px;
            }
        '';
    };
}
