# Projet DevOps J

## Instructions
Le TP doit être rendu individuellement et se basera sur le code présent dans vos repositories personnels:
* `Dockerfile`
* `Jenkinsfile`
* `docker-compose.yml`
* fichiers de déploiement kubernetes

> :warning: **Warning**: L'utilisation de la norme Gitflow dans votre repository vous rapportera des points en plus !

## 0 : Description du projet
Dans ce projet nous allons mettre en application tous les outils et technos utilisées dans les TP précédents. Le but est de réaliser une chaine complète de build et déploiement.
Pour cela, nous allons utiliser un projet de démo mis à disposition par la communauté open source: [Spring Petclinic](https://spring-petclinic-community.herokuapp.com/)

Plus précisément, nous nous appuierons sur deux services:
* Un web service rest (backend): [spring-petclinic-rest](spring-petclinic-rest)
* Une webapp angular (frontend): [spring-petclinic-angular](spring-petclinic-angular)

Ces deux projets présentent une architecture simple dans laquelle la webapp réalise des appels vers le web service pour afficher les données retournées.

Chacun des deux repository contient la documentation permettant de packager et démarrer les front et back. Vous devrez vous baser sur ces documentations pour faire fonctionner ces deux services dans le cadre du projet.

## 1 : Dockeriser les services
Créer des images Docker pour chacun des deux services: Rest et webapp.

> Pour l'image front (webapp), appuyez vous sur le fichier `docker-entrypoint.sh` qui vous permet de démarrer le container en spécifiant le hostname et le port du backend.

## 2 : Let's automate !
Après avoir créé les deux `Dockerfile` pour les services front et back, automatisez le build des images Docker sur le serveur Jenkins (à partir d'un fichier `Jenkinsfile`).

A la fin de chaque build d'image, pushez vos images sur DockerHub dans des repositories nommés:
* Pour le backend: <username>/spring-petclinic-rest
* Pour le frontend:  <username>/spring-petclinic-angular

## 3 : Un peu d'orchestration
Créez un fichier `docker-compose.yml` permettant de démarrer les services front et back en faisant en sorte que le frontend pointe sur le backend.

## 4 : Une orchestration plus sérieuse
A partir du fichier `docker-compose.yml`, créez un fichier de déploiement kubernetes et déployez votre application sur votre cluster kubernetes personnel.

> :warning: Vous pouvez vous aider de l'outil Kompose pour générer vos fichiers

> Pour exposer vos services sur Internet, vous devez ajouter la ligne `type: LoadBalancer` dans la description du service kubernetes (front et back) tels qu'indiqué dans l'exemple ci-dessous:
```yaml
spec:
  ports:
    ...
    ...
    ...
  selector:
    ...
  type: LoadBalancer
```

## Bonus
Le projet étant assez simple `ヽ༼ ಠ益ಠ ༽ﾉ`, vous pouvez pousser un peu plus loin avec ces questions bonus:
  * Modifiez votre Jenkinsfile pour builder vos images Docker en parallèle 
  * Ajouter une étape dans votre Jenkinsfile afin d'automatiser le déploiement sur le cluster Kubernetes
  * Modifiez vos Dockerfile afin de réduire leur taille à l'aide des multistage builds.
  * Modifier votre Dockerfile frontend pour builder l'application angular en mode prod (--prod) 

