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
  typescript \
  typescript-language-server \
  vscode-langservers-extracted \
  vsce \
  wrangler \
  ;
