# Présentation - Comment déployer un blog


## Introduction

1. Expliquer les outils qu'on va utiliser
2. Expliquer pourquoi les outils qu'on va utiliser permet d'améliorer le déploiement
3. Montrer un schéma du processus de déploiement qu'on va mettre en place

## Créer les ressources nécessaires

1. Créer repo gitlab
2. Créer instance SCW (Prendre instant App docker)
3. Créer registry SCW


## Préparer le blog

1. Présenter ce qu'est Hugo
2. Créer un blog avec Hugo
```sh
# Create the site
hugo new site hello-discord

cd hello-discord

# Add the theme
echo "theme = 'ananke'" >> hugo.toml

# Add theme
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

# Run the server (le flag -D permet de serve avec les articles en **draft**)
hugo server -D -p 8000

# Créer un article
hugo new posts/bienvenue.md

# Edit l'article avec un petit contenu
nvim contents/posts/bienvenue.md
```

# Préparer l'image docker

1. Créer l'image docker
```docker
FROM klakegg/hugo

COPY hello-discord /src

WORKDIR /src

ENTRYPOINT [ "hugo-official", "server", "-D", "--bind=0.0.0.0", "-p", "8080" ]
```
2. Exécuter l'image docker pour essayer
```sh
docker run -it -p 8080:8080  --rm --name hello-discord hello-discord
```

# Création de la pipeline github

1. Créer un dossier `./github/workflows`
2. Créer un fichier `./github/workflows/build-and-deploy.yml`