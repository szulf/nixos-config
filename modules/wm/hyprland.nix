{
    pkgs,
    ...
}: {
    imports = [
        ../kitty/kitty.nix
        ./waybar.nix
        ./wofi.nix
        ./wlogout.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;

        settings = {
            "decoration:rounding" = 15;
            "monitor" = "DP-1, 1920x1080@60, 0x0, 1";

            "exec-once" = [
                "swww-daemon"
                "waybar"
            ];

            "$mod" = "SUPER";
            "$mod_shift" = "SUPER_SHIFT";
            "$terminal" = "kitty";

            "xwayland" = {
                "force_zero_scaling" = "true";
            };

            bind = [
                # General bindings
                "$mod, RETURN, exec, $terminal"
                "$mod_shift, X, exit,"
                "$mod_shift, Q, killactive,"
                "$mod, J, cyclenext,"
                "$mod, K, cyclenext, prev"
                "$mod_shift, J, swapnext,"
                "$mod_shift, K, swapnext, prev"
                "$mod, H, splitratio, -0.1"
                "$mod, L, splitratio, +0.1"
                "$mod, M, fullscreen, 1"
                "$mod, D, exec, wofi --show run"

                # Workspace Control
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod, 6, workspace, 6"
                "$mod, 7, workspace, 7"
                "$mod, 8, workspace, 8"
                "$mod, 9, workspace, 9"

                "$mod_shift, 1, movetoworkspacesilent, 1"
                "$mod_shift, 2, movetoworkspacesilent, 2"
                "$mod_shift, 3, movetoworkspacesilent, 3"
                "$mod_shift, 4, movetoworkspacesilent, 4"
                "$mod_shift, 5, movetoworkspacesilent, 5"
                "$mod_shift, 6, movetoworkspacesilent, 6"
                "$mod_shift, 7, movetoworkspacesilent, 7"
                "$mod_shift, 8, movetoworkspacesilent, 8"
                "$mod_shift, 9, movetoworkspacesilent, 9"
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
}
