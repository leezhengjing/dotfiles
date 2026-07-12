# --- Environment Setup ---

set -gx EDITOR nvim

# Homebrew
if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

# opam (OCaml package manager)
if type -q opam
    opam env | source
end

# Ruby (chruby)
# Note: Ensure chruby.fish is sourced before calling chruby
if test -f /opt/homebrew/share/chruby/chruby.fish
    source /opt/homebrew/share/chruby/chruby.fish
    chruby ruby-3.4
end

# --- Interactive Session Settings ---

if status is-interactive
    # Git Abbreviations
    abbr --add am 'git amend'
    abbr --add g git
    abbr --add gbr 'git br'
    abbr --add gco 'git co'
    abbr --add gd 'git diff -w'
    abbr --add gds 'git diff -w --staged'
    abbr --add glogf 'git logf'
    abbr --add glogo 'git logo'
    abbr --add gp 'git push origin'
    abbr --add gs 'git status'

    # Aliases
    alias algo-practice='python3 ~/Github/algo-practice/test_current.py'
    alias python=python3
    alias pip=pip3
end

# --- Google Cloud SDK ---
set -gx CLOUDSDK_PYTHON /opt/homebrew/bin/python3.14
if test -f "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end


# Added by Antigravity CLI installer
set -gx PATH "$HOME/.local/bin" $PATH
set -x COREPACK_ENABLE_STRICT 0
