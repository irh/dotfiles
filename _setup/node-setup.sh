fnm install --lts
eval "(fnm env)"

npm install -g pnpm
pnpm setup && source ~/.zshrc

pnpm install -g \
  gulp-cli \
  instant-markdown-d \
  lua-fmt \
  prettier \
  svelte-language-server \
  @tailwindcss/language-server \
  tldr \
  typescript \
  typescript-language-server \
  vscode-langservers-extracted \
  @vscode/vsce \
  wrangler \
  yaml-language-server \
  ;
