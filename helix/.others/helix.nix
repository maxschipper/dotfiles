{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  uwu_colors = inputs.uwucolors.packages.${pkgs.system}.default;
in
  with lib; {
    config = mkIf config.hm.editor.helix.enable {
      programs.helix = {
        enable = true;
        package = inputs.helix.packages.${pkgs.system}.default;
        languages = {
          grammar = {
            "use-grammars.only" = [
              "nix"
              "latex"
              "python"
              "bash"
              "markdown"
            ];
          };
          language = [
            {
              name = "nix";
              language-servers = [{name = "nil";} {name = "colors";}];
              formatter.command = "${pkgs.alejandra}/bin/alejandra";
              auto-format = true;
            }
            {
              name = "latex";
              language-servers = [{name = "texlab";}];
              formatter.command = "${pkgs.tex-fmt}/bin/tex-fmt";
            }
            {
              name = "python";
              formatter = {
                command = "${pkgs.black}/bin/black";
                args = [
                  "-" # stdin
                  "--quiet"
                  "--line-length=79"
                ];
              };
              language-servers = [{name = "jedi-language-server";}];
            }
            {
              name = "yaml";
            }
          ];

          language-server.colors = {
            command = "${uwu_colors}/bin/uwu_colors";
          };
          language-server.nil = with pkgs; {
            command = "${nil}/bin/nil";
            auto-format = true;
          };

          language-server.jedi-language-server.command = "jedi-language-server";

          language-server.texlab = with pkgs; {
            command = "${texlab}/bin/texlab";
            config.texlab = {
              diagnosticsDelay = 0;
              latexindent.modifyLineBreaks = true;
              build = {
                onSave = true;
                # folder out must be present
                executable = "tectonic";
                args = [
                  "-X"
                  "compile"
                  "%f"
                  "-o"
                  "out"
                  "--synctex"
                  "--keep-logs"
                  "--keep-intermediates"
                ];
                auxDirectory = "out";
                logDirectory = "out";
                pdfDirectory = "out";
                forwardSearchAfter = true;
              };
              forwardSearch = {
                executable = "zathura";
                args = [
                  "--synctex-forward"
                  "%l:1:%f"
                  "%p"
                ];
              };
              chktex.onEdit = true;
            };
          };
        };
        settings = {
          theme = "mytheme";
          editor = {
            line-number = "relative";
            lsp.display-messages = true;
            cursorline = false;
            color-modes = true;
            auto-format = true;
            text-width = 88;
            scroll-lines = 5;
            # show completions immediately;
            idle-timeout = 0;
            completion-trigger-len = 1;
            shell = ["zsh" "-c"];

            statusline = {
              left = [
                # "mode",
                "file-name"
                "read-only-indicator"
                "file-modification-indicator"
              ];

              right = ["spinner" "diagnostics" "position-percentage"];
            };
            gutters.layout = ["diagnostics" "line-numbers" "spacer" "diff"];

            file-picker.hidden = false; # show hidden files

            soft-wrap = {
              enable = true;
              wrap-at-text-width = true;
            };
            cursor-shape = {
              normal = "block";
              insert = "bar";
              select = "underline";
            };
          };
          keys = {
            normal = {
              esc = ["collapse_selection" "keep_primary_selection"];
              H = ":buffer-previous";
              L = ":buffer-next";
              D = ["ensure_selections_forward" "extend_to_line_end" "delete_selection"];
              C-g = [
                # Lazygit
                ":write-all"
                ":new"
                ":insert-output lazygit"
                ":buffer-close!"
                ":redraw"
                ":reload-all"
              ];
              C-y = [
                # Yazi
                ":sh rm -f /tmp/unique-file"
                ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
                ":insert-output echo '\x1b[?1049h\x1b[?2004h' > /dev/tty"
                ":open %sh{cat /tmp/unique-file}"
                ":redraw"
              ];
              space = {
                "." = ":fmt";
                w = ":w";
                q = ":q";
                B = ":bc";
                e = [
                  # Yazi
                  ":sh rm -f /tmp/unique-file-h21a434"
                  ":insert-output yazi '%{buffer_name}' --chooser-file=/tmp/unique-file-h21a434"
                  ":insert-output echo \"x1b[?1049h\" > /dev/tty"
                  ":open %sh{cat /tmp/unique-file-h21a434}"
                  ":redraw"
                ];
                E = [
                  # Yazi
                  ":sh rm -f /tmp/unique-file-u41ae14"
                  ":insert-output yazi '%{workspace_directory}' --chooser-file=/tmp/unique-file-u41ae14"
                  ":insert-output echo \"x1b[?1049h\" > /dev/tty"
                  ":open %sh{cat /tmp/unique-file-u41ae14}"
                  ":redraw"
                ];
              };
            };
          };
        };
      };
    };
  }
