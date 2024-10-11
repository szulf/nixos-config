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
            "exec-once" = "swww-daemon";

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
}
