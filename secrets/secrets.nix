let
  keys = import ../keys.nix;
in
{
  "quartz/authentik.age".publicKeys = keys.ssh ++ [ keys.quartz-host ];
}
