{
  config,
  lib,
  pkgs,
  ...
}:
let
  enabled = config.crystal-cavern.gui;
in
{
  config = lib.mkIf enabled {
    home.packages = with pkgs; [ fira-code-nerdfont ];
    programs = {
      joplin-desktop = {
        enable = true;
        sync = {
          interval = "5m";
          target = "joplin-server";
        };
        extraConfig = {
          "spellChecker.languages" = [
            "en-US"
            "de-DE"
          ];
          "theme" = 22;
          "trackLocation" = false;
          "editor.spellcheckBeta" = true;
          "welcome.enabled" = false;
        };
      };
    };
    services = {
      flameshot = {
        enable = true;
        settings.General = {
          drawThickness = 13;
          startupLaunch = true;
          useJpgForClipboard = false;
        };
      };
    };
  };
  options.crystal-cavern.gui = lib.mkOption {
    type = lib.types.bool;
    description = "Whether to configure gui tools";
    default = false;
  };
}