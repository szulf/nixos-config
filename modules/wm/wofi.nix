{ }: {
    programs.wofi = {
        enable = true;

        settings = {
            hide_scroll = "true";
            prompt = "Search...";
            insensitive = "true";
            columns = 1;
            normal_window = "false";
        };

        style = ''
            * {
                font-family: "Monaspace Neon";
                font-size: 16px;
                margin: 0;
                padding: 0;
            }

            window {
                color: #ffffff;
                background: rgba(0, 0, 0, 0.8);
                border-radius: 15px;
            }

            #outer-box {
                padding: 20px;
                border-radius: 15px;
                border: 1.5px solid #ffffff;
            }

            #input {
                margin-bottom: 20px;
                background: #333333;
                box-shadow: none;
                border: none;
                color: #ffffff;
                border-radius: 15px;
            }

            #input:focus {
                border: none;
            }

            #input > image {
                -gtk-icon-transform:scaleX(0);
            }

            #entry {
                margin-bottom: 5px;
            }

            #entry:selected {
                background: transparent;
                border: none;
                outline-color: transparent;
                box-shadow: none;
            }

            #text {
                text-align: center;
            }

            #text:selected {
                font-weight: bolder;
                text-shadow: 0px 0px 4px #ffffff;
                border: none;
            }
        '';
    };
}
