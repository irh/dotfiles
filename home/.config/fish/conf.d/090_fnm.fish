if command -q fnm
    fnm env --shell fish --use-on-cd --version-file-strategy recursive | source
end
