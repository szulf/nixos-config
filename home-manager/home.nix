{
    pkgs,
    ...
}: {
    imports = [
        ../modules/wm/hyprland.nix
        ../modules/nvim/nvim.nix
        ../modules/zsh/zsh.nix
        ../modules/git/git.nix
    ];

    nixpkgs = {
        overlays = [ ];
        config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
        };
    };

    home = {
        username = "user";
        homeDirectory = "/home/user";
    };

    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
        cargo
        gnumake
        clang
        btop
        firefox-unwrapped
        nerdfonts
        font-awesome
        gimp
        aseprite
        ripgrep
    ];

    programs.home-manager.enable = true;

    systemd.user.startServices = "sd-switch";
    
    home.stateVersion = "24.05";
}
