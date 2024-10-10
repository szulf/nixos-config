{
    config,
    pkgs,
    inputs,
    ...
}: {
    programs.git = {
        enable = true;
        userName = (builtins.readFile ./username.txt);
        userEmail = (builtins.readFile ./email.txt);
        extraConfig = {
            init.defaultBranch = "main";
        };
    };
}
