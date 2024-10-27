{
    config,
    pkgs,
    inputs,
    ...
}: {
    programs.wlogout = {
        enable = true;

        layout = [
            {
                label = "hibernate";
                action = "systemctl hibernate";
                text = "Hibernate";
                keybind = "h";
            }
            { }
            {
                label = "shutdown";
                action = "systemctl poweroff";
                text = "Shutdown";
                keybind = "s";
            }
            {
                label = "logout";
                action = "loginctl terminate-user $USER";
                text = "Logout";
                keybind = "l";
            }
            {
                label = "reboot";
                action = "systemctl reboot";
                text = "Reboot";
                keybind = "r";
            }
        ];

        style = ''
            * {
                font-family: "Monaspace Neon";
                margin: 0;
                padding: 0;
            }

            window {
                background: rgba(0, 0, 0, 0.5);
            }

            button {
                border-radius: 15px;
                border: 1.5px solid #ffffff;
                color: #ffffff;
                background: rgba(0, 0, 0, 0.8);
                margin: 5px;
            }

            button:nth-child(2),
            button:nth-child(6) {
                opacity: 0;
            }

            #hibernate {
                background-image: image(url("/home/user/Downloads/hibernate.png"));
                background-repeat: no-repeat;
                background-position: center;
                background-size: 64px 64px;
            }

            #shutdown {
                background-image: image(url("/home/user/Downloads/shutdown.png"));
                background-repeat: no-repeat;
                background-position: center;
                background-size: 64px 64px;
            }

            #reboot {
                background-image: image(url("/home/user/Downloads/reboot.png"));
                background-repeat: no-repeat;
                background-position: center;
                background-size: 64px 64px;
            }

            #logout {
                background-image: image(url("/home/user/Downloads/logout.png"));
                background-repeat: no-repeat;
                background-position: center;
                background-size: 64px 64px;
            }
        '';
    };
}
