{
    inputs,
    lib,
    config,
    pkgs,
    ...
}: {
    imports = [
        ../modules/hyprland/hyprland.nix
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
        btop
        firefox
        nerdfonts
        font-awesome
    ];

    programs.home-manager.enable = true;

    systemd.user.startServices = "sd-switch";

    home.stateVersion = "24.05";
}
