{
    config,
    pkgs,
    inputs,
    ...
}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
    };

    home.file.".config/nvim".source = ./.;
    home.file.".config/nvim".recursive = true;
}
