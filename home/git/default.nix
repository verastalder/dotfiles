{ config, pkgs, ... }:

{
  home.packages = with pkgs.gitAndTools; [
    diff-so-fancy
    hub
    tig
    gh
  ];

  programs.git = {
    enable = true;
    userName = "Jonas Schultheiss";
    userEmail = "jonas.raphael.schultheiss@gmail.com";
    package = pkgs.gitAndTools.gitFull;

    ignores = [
      ".cache/"
      ".DS_Store"
      ".idea/"
      "*.swp"
      "*.log"
    ];

    aliases = {
      l = "log --pretty=oneline -n 50 --graph --abbrev-commit";
      save = "!git add -A && git commit -v -m 'SAVEPOINT'";
      undo = "reset HEAD~1 --mixed";
      wipe = "!git add -A && git commit -qm 'WIPE SAVEPOINT' --no-verify && git reset HEAD~1 --hard";
      findcommit = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short -S$1; }; f";
      findmessage = "!f() { git log --pretty=format:'%C(yellow)%h  %Cblue%ad  %Creset%s%Cgreen  [%cn] %Cred%d' --decorate --date=short --grep=$1; }; f";
    };

    extraConfig = {
      commit.template = builtins.toPath ./git-message;

      # If no upstream branch is specified, push to the branch with the same
      # name as the current branch
      push.default = "current";

      core = {
        editor = "code --wait";
        pager = "diff-so-fancy | less --tabs=4 -RFX";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = true;

      "color \"diff-highlight\"" = {
        oldNormal = "red bold";
        oldHighlight = "red bold 52";
        newNormal = "green bold";
        newHighlight = "green bold 22";
      };

      "color \"diff\"" = {
        frag = "magenta bold";
        old = "red bold";
        new = "green bold";
        whitespace = "red reverse";
      };
    };
  };
}
