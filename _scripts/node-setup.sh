fnm install --lts
eval "(fnm env)"

npm install -g pnpm
pnpm setup && source ~/.zshrc 

pnpm install -g \
  gulp-cli \
  instant-markdown-d \
  lua-fmt \
  prettier \
  typescript \
  typescript-language-server \
  vsce \
  wrangler \
  ;
