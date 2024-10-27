{ }: {
    programs.git = {
        enable = true;
        userName = "szulf";
        userEmail = "szymon.mieln@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
        };
    };
}
