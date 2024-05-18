# ISO Debian Personnalisé avec Simple-CDD

Ce projet, nommé DebianGN, est une distribution Debian personnalisée conçue pour répondre aux besoins des professionnels de DEVOPS. Il offre une configuration préinstallée avec une gamme d'outils et de logiciels destinés à faciliter le développement, le déploiement et la gestion des applications.

Cette distribution inclut des outils populaires tels que Docker, Kubernetes, Ansible, Terraform, Git, Jenkins, et bien d'autres, ainsi que des configurations optimisées pour un environnement DEVOPS. 

L'objectif principal de DebianGN est de fournir une solution prête à l'emploi pour les équipes DEVOPS, leur permettant de démarrer rapidement et de bénéficier d'une infrastructure solide et fiable basée sur Debian.

## Structure du Dépôt

- `debianGN.conf` : Le fichier de configuration principal pour Simple-CDD.
- `profiles/` : Contient les définitions de profils utilisées par Simple-CDD.
- `debianGN.description/` : Description des paquets Debian.
- `debianGN.downloads/` : Scripts de téléchargement pour les paquets nécessaires.
- `debianGN.packages/` : Liste des paquets à inclure dans l'ISO.
- `debianGN.preseed` : Fichier preseed pour automatiser l'installation.
- `post-install.sh` : Script à exécuter après l'installation.

## Configuration de debianGN

Le fichier `debianGN.conf` est le fichier de configuration principal utilisé par Simple-CDD (Custom Debian Distribution) pour définir les paramètres de construction de l'ISO personnalisée. Simple-CDD est un outil conçu pour simplifier le processus de création de distributions Debian personnalisées.

Dans `debianGN.conf`, vous pouvez spécifier diverses options et paramètres, tels que :

- **Les paquets à inclure** : Vous pouvez spécifier les paquets Debian à inclure dans l'ISO personnalisée. Cela peut inclure des packages système, des outils supplémentaires, des bibliothèques, etc.

- **Les paramètres de préconfiguration** : Vous pouvez définir des options de préconfiguration pour automatiser l'installation de Debian. Cela peut inclure des réponses aux questions posées pendant l'installation, des configurations réseau, des paramètres régionaux, etc.

- **Les configurations de partitionnement** : Vous pouvez définir des schémas de partitionnement personnalisés pour l'installation.

- **Les paramètres de post-installation** : Vous pouvez spécifier des scripts ou des actions à exécuter après l'installation pour effectuer des tâches supplémentaires de configuration ou d'installation de logiciels.

En résumé, `debianGN.conf` est un fichier qui permet de définir toutes les spécifications nécessaires pour construire une ISO Debian personnalisé.

# Description de DebianGN

Le fichier `debianGN.description` contient la description des paquets Debian utilisés dans ce projet DebianGN. Cette description est utilisée pour fournir des informations sur les paquets inclus dans l'ISO personnalisée.

La description des paquets permet aux utilisateurs de comprendre le but et la fonctionnalité de chaque paquet inclus dans l'ISO et facilicite la sélection des paquets appropriés en fonction des besoins spécifiques de l'utilisateur.

En résumé, le fichier `debianGN.description` est un composant qui fournit des informations détaillées sur les paquets inclus.

# Scripts de Téléchargement dans `debianGN.downloads/`

Le fichier `debianGN.downloads` contient les scripts de téléchargement utilisés pour récupérer les paquets nécessaires à l'inclusion dans l'ISO personnalisée du projet DebianGN.

Ces scripts automatisent le processus de téléchargement des paquets requis depuis les sources appropriées. Cela permet d'assurer que les paquets inclus dans l'ISO sont à jour et qu'ils peuvent être facilement intégrés au processus de construction.

Les scripts de téléchargement peuvent inclure des instructions pour récupérer les paquets depuis les dépôts officiels de Debian, ainsi que des sources tierces si nécessaire. Ils peuvent également effectuer des vérifications de somme de contrôle pour garantir l'intégrité des paquets téléchargés.

# Liste des Paquets dans `debianGN.packages/`

Le fichier `debianGN.packages` contient la liste des paquets à inclure dans l'ISO personnalisée du projet DebianGN.

Cette liste détermine les packages qui seront présents dans l'installation de Debian une fois que l'ISO personnalisée sera utilisée pour installer le système d'exploitation. Les paquets inclus peuvent être des logiciels système, des outils utilitaires, des bibliothèques, des pilotes ou tout autre composant logiciel requis pour répondre aux besoins spécifiques du projet DebianGN.

La liste des paquets est généralement définie dans un fichier texte ou un script, où chaque ligne représente un paquet à inclure. Ces paquets peuvent être spécifiés par leur nom, leur version ou d'autres informations pertinentes pour leur installation.

En résumé, le dossier `debianGN.packages` permet de définir précisément les composants logiciels qui seront présents dans l'installation finale.

# Fichier Preseed dans `debianGN.preseed`

Le fichier `debianGN.preseed` contient des directives de préconfiguration qui permettent d'automatiser le processus d'installation de Debian.

En utilisant un fichier preseed, vous pouvez spécifier des réponses automatiques aux questions posées pendant l'installation de Debian. Cela inclut des informations telles que les paramètres régionaux, les options de partitionnement, les noms d'utilisateur et de mot de passe, les configurations réseau, les miroirs de paquets, etc.

Le fichier preseed est généralement écrit au format texte et peut être personnalisé en fonction des besoins spécifiques du projet DebianGN. Il est utilisé par l'installateur Debian pendant le processus d'installation pour appliquer automatiquement les configurations prédéfinies, ce qui permet d'installer le système d'exploitation de manière plus rapide et plus cohérente.

# Script Post-installation `post-install.sh`

Le fichier `post-install.sh` est un script conçu pour être exécuté automatiquement après l'installation de Debian à partir de l'ISO personnalisée générée par le projet DebianGN. Ce script permet d'effectuer des tâches supplémentaires de configuration ou d'installation de logiciels une fois que le système de base est installé.

Dans `post-install.sh`, nous pouvons :

- Configurer des paramètres système supplémentaires, tels que les paramètres de réseau, les autorisations de fichier, etc.
- Installer des logiciels supplémentaires qui ne sont pas inclus dans l'ISO de base.
- Effectuer des configurations spécifiques à l'application ou au projet, telles que la configuration de serveurs, la personnalisation de l'interface utilisateur, etc.
- Effectuer des tâches de post-installation spécifiques au projet DebianGN, telles que la configuration des outils DEVOPS, la mise en place d'environnements de développement, etc.

En résumé, le fichier `post-install.sh` permet de créer des environnements de système d'exploitation personnalisés prêts à l'emploi.

## Prérequis

Assurez-vous d'avoir les paquets suivants installés sur votre système Debian :

```sh
sudo apt-get update
sudo apt-get install simple-cdd debian-cd debian-archive-keyring
```

## Construire l'ISO Debian Personnalisée

Pour construire l'ISO Debian personnalisée, suivez ces étapes :

Accédez au répertoire du projet :

```sh
cd ~/workspace/debian_custom/DebianGN-simple-cdd
```

 Exécutez Simple-CDD avec la configuration fournie :

```sh

    build-simple-cdd --conf ./debianGN.conf --logfile ./logs/build.log
```

## Tester l'ISO dans une Machine Virtuelle

### Tester avec VirtualBox

Si vous préférez utiliser VirtualBox, suivez ces étapes :

### Installer VirtualBox :

```sh

    sudo apt-get install virtualbox
```

### Créer une nouvelle VM :
- Ouvrez VirtualBox et cliquez sur "Nouveau".
- Nommez votre VM et sélectionnez "Linux" comme type et "Debian (64-bit)" comme version.
- Allouez de la mémoire (au moins 2048 Mo recommandé).
- Créez un disque dur virtuel et procédez avec les options par défaut.

### Monter l'ISO :
- Sélectionnez votre nouvelle VM et cliquez sur "Paramètres".
- Allez dans "Stockage" et cliquez sur le lecteur de CD vide.
- Cliquez sur l'icône du disque et sélectionnez "Choisir un fichier de disque".
- Naviguez jusqu'à images/debian-12-amd64-CD-1.iso et sélectionnez-le.

### Démarrer la VM :
Démarrez votre VM et suivez le processus d'installation de Debian.

## Contribution

Si vous souhaitez contribuer à ce projet, veuillez forker le dépôt et soumettre une pull request avec vos modifications.
Licence

Ce projet est sous licence MIT - voir le fichier LICENSE pour plus de détails.
