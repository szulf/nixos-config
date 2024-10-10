{
    pkgs,
    ...
}: {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
            enable = true;
            custom = (builtins.toString ./.);
            theme = "custom";
        };
    };
}