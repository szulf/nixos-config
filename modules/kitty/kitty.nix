{
    pkgs,
    ...
}: {
    home.packages = with pkgs; [
        monaspace
    ];

    programs.kitty = {
        enable = true;
        settings = {
            background_opacity = "0.5";
            window_padding_width = 5;
        };
        font = {
            name = "Monaspace Neon";
            size = 8;
        };
    };
} 

