{
    config,
    pkgs,
    inputs,
    ...
}: {
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
                format = "  {volume}%";
                "format-muted" = " {volume}%";
                "on-scroll-up" = "wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%+";
                "on-scroll-down" = "wpctl set-volume -l 2.0 @DEFAULT_AUDIO_SINK@ 5%-";
                "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };

            battery = {
                format = "{icon}  {capacity}%";
                "format-icons" = ["" "" "" "" ""];
            };

            network = {
                format-ethernet = "  {signalStrength}%";
                format-wifi = "  {signalStrength}%";
                format-disconnected = "󰤭 ";
            };

            clock = {
                format = "{:%H:%M %A, %b %d, %Y}";
            };

            "custom/power" = {
                format = "";
                "on-click" = "wlogout";
            };
        }];
        
        style = ''
            * {
                font-family: "Monaspace Neon";
                font-size: 12px;
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
