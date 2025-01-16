#!/bin/bash

# Gere o build do Flutter Web
flutter build web

# Vá para a branch de deploy (page)
git checkout page

# Limpe os arquivos antigos na branch, exceto as pastas "assets", "canvaskit" e "icons"
for dir in */; do
  if [[ "$dir" != "assets" && "$dir" != "canvaskit" && "$dir" != "icons" ]]; then
    rm -rf "$dir"
  fi
done

# Copie os novos arquivos do build/web para o repositório
cp -r build/web/* .

# Adicione os arquivos
git add .

# Faça o commit
git commit -m "Atualização do deploy Flutter Web"

# Envie para a branch page
git push origin page

# Volte para a branch principal
git checkout main