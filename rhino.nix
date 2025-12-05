let
  secrets = import ./secrets.nix;
  substituters = [
    "s3://rhinofi-nix-cache?endpoint=https://storage.googleapis.com&profile=rhinofi-nix-cache-read&priority=9"
    "https://nix-community.cachix.org"
    "https://numtide.cachix.org"
  ];
in
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "impure-derivations"
    "ca-derivations"
  ];
  nix.settings.trusted-substituters = substituters;
  nix.settings.substituters = substituters;
  nix.settings.trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
    "rhinofi:Cn3Tu54aOpn1doAYNYQw3fL4MWLwdZDO+01Ho3RdNeg="
  ];
  nix.settings.netrc-file = "/etc/nix/secrets/.netrc";
  nix.settings.access-tokens = "github.com=${secrets.githubAccessToken}";
}
