{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        # settings
        userSettings = {
          "workbench.startupEditor" = "none";
          "git.autofetch" = true;
          "javascript.format.insertSpaceBeforeFunctionParenthesis" = true;
          "eslint.codeAction.showDocumentation" = {
            "enable" = true;
          };
          "javascript.updateImportsOnFileMove.enabled" = "always";
          "window.zoomLevel" = 2;
          "editor.codeActionsOnSave" = {
            "source.fixAll" = "explicit";
            "source.fixAll.eslint" = "explicit";
          };
          "eslint.validate" = [
            "javascript"
          ];
          "eslint.format.enable" = false;
          "extensions.ignoreRecommendations" = false;
          "typescript.preferences.importModuleSpecifier" = "relative";
          "monkeyC.developerKeyPath" = "/Users/nico/developer_key";
          "editor.inlineSuggest.enabled" = true;
          "solidity.telemetry" = true;
          "runOnSave.statusMessageTimeout" = 3000;
          "runOnSave.commands" = [
            {
              "match" = "\\.nix";
              "isAsync" = false;
              "command" = "nixfmt \${file}";
              "runIn" = "terminal";
            }
            {
              "match" = "\\.((t|j)sx?|json|md|ya?ml)$";
              "notMatch" = "services/portal";
              "isAsync" = false;
              "command" = "dprint-fmt-one-file \${file}";
              "runIn" = "terminal";
            }
          ];
          "github.copilot.enable" = {
            "*" = true;
            "plaintext" = false;
            "markdown" = false;
            "scminput" = false;
          };
          "diffEditor.useInlineViewWhenSpaceIsLimited" = false;
          "[solidity]" = {
            "editor.defaultFormatter" = "NomicFoundation.hardhat-solidity";
          };
          "search.exclude" = {
            "**/dist" = true;
          };
          "editor.largeFileOptimizations" = false;
          "rust-analyzer.inlayHints.typeHints.enable" = false;
          "rust-analyzer.inlayHints.parameterHints.enable" = false;
          "[jsonc]" = {
            "editor.defaultFormatter" = "vscode.json-language-features";
          };
          "github.copilot.editor.enableAutoCompletions" = true;
          "diffEditor.ignoreTrimWhitespace" = false;
          "typescript.preferences.organizeImports" = { };
          "[json]" = {
            "editor.defaultFormatter" = "vscode.json-language-features";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "yaml.schemas" = {
            "file:///Users/nico/.vscode/extensions/atlassian.atlascode-3.8.8/resources/schemas/pipelines-schema.json" =
              "bitbucket-pipelines.yml";
          };
          "atlascode.jira.enabled" = true;
          "atlascode.bitbucket.enabled" = false;
          "github.copilot.nextEditSuggestions.enabled" = true;
          "[typescript]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
        };

        # keybindings
        keybindings = [
          {
            key = "alt+ctrl+n";
            command = "workbench.action.terminal.sendSequence";
            args = {
              text = "dprint fmt";
            };
          }
          {
            key = "ctrl+k";
            command = "editor.action.deleteLines";
            when = "textInputFocus && !editorReadonly";
          }
          {
            key = "shift+ctrl+k";
            command = "-editor.action.deleteLines";
            when = "textInputFocus && !editorReadonly";
          }
          {
            key = "ctrl+j ctrl+c";
            command = "editor.action.addCommentLine";
            when = "editorTextFocus && !editorReadonly";
          }
          {
            key = "ctrl+k ctrl+c";
            command = "-editor.action.addCommentLine";
            when = "editorTextFocus && !editorReadonly";
          }
          {
            key = "ctrl+j ctrl+u";
            command = "editor.action.removeCommentLine";
            when = "editorTextFocus && !editorReadonly";
          }
          {
            key = "ctrl+k ctrl+u";
            command = "-editor.action.removeCommentLine";
            when = "editorTextFocus && !editorReadonly";
          }
          {
            key = "shift+ctrl+s";
            command = "saveAll";
          }
          {
            key = "alt+ctrl+s";
            command = "-saveAll";
          }
          {
            key = "shift+ctrl+i";
            command = "editor.action.formatSelection";
            when = "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly";
          }
          {
            key = "ctrl+k ctrl+f";
            command = "-editor.action.formatSelection";
            when = "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly";
          }
          {
            key = "alt+ctrl+k";
            command = "-keybindings.editor.recordSearchKeys";
            when = "inKeybindings && inKeybindingsSearch";
          }
          {
            key = "alt+ctrl+k";
            command = "workbench.action.closeUnmodifiedEditors";
          }
          {
            key = "ctrl+k u";
            command = "-workbench.action.closeUnmodifiedEditors";
          }
          {
            key = "ctrl+j ctrl+1";
            command = "editor.foldLevel1";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+1";
            command = "-editor.foldLevel1";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+2";
            command = "editor.foldLevel2";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+2";
            command = "-editor.foldLevel2";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+3";
            command = "editor.foldLevel3";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+3";
            command = "-editor.foldLevel3";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+4";
            command = "editor.foldLevel4";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+4";
            command = "-editor.foldLevel4";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+5";
            command = "editor.foldLevel5";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+5";
            command = "-editor.foldLevel5";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+6";
            command = "editor.foldLevel6";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+6";
            command = "-editor.foldLevel6";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+7";
            command = "editor.foldLevel7";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+7";
            command = "-editor.foldLevel7";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+j ctrl+[IntlBackslash]";
            command = "editor.unfoldAll";
            when = "editorTextFocus && foldingEnabled";
          }
          {
            key = "ctrl+k ctrl+j";
            command = "-editor.unfoldAll";
            when = "editorTextFocus && foldingEnabled";
          }
        ];

        # extensions
        extensions = with pkgs.vscode-marketplace; [
          jnoortheen.nix-ide
          arcanis.vscode-zipfs
          dbaeumer.vscode-eslint
          eamodio.gitlens
          effectful-tech.effect-vscode
          emeraldwalk.runonsave
          github.copilot
          github.copilot-chat
          madmanvo.error-toggle
          mechatroner.rainbow-csv
          mkhl.direnv
          nomicfoundation.hardhat-solidity
          # pucelle.run-on-save
          redhat.vscode-xml
          redhat.vscode-yaml
          usernamehw.errorlens
          yoavbls.pretty-ts-errors
        ];
      };
    };
  };
}
