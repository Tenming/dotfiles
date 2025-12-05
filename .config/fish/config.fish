if status is-interactive
    starship init fish | source
end

abbr -a dnf-install-skipdeps sudo dnf install --setopt=install_weak_deps=False
abbr -a pkgup sudo dnf upgrade --refresh -y
abbr -a cls clear
abbr -a svim sudo -E nvim
alias fl="fastfetch|lolcat"
