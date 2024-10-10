{
    config,
    pkgs,
    inputs,
    ...
}: {
    home.packages = with pkgs; [
        monaspace
    ];

    programs.kitty = {
        enable = true;
        settings = {
            background_opacity = "0.5";
        };
        font = {
            name = "Monaspace Argon";
            size = 8;
        };
    };
} 

