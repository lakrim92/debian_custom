#!/bin/bash

# Vérification des autorisations root
if [[ $(id -u) -ne 0 ]]; then
    echo "Ce script doit être exécuté en tant qu'utilisateur root."
    exit 1
fi

# Fonction pour installer les outils pour le profil garage
install_garage_tools() {
    # Installation des outils pour le garage
    install_package() {
        package_name="$1"
        if ! dpkg -l | grep -q "$package_name"; then
            apt-get install -y "$package_name"
        else
            echo "$package_name est déjà installé."
        fi
    }

    apt update
    install_package git
    install_package docker.io
    install_package docker-compose
    install_package kubectl
    install_package ansible
    install_package terraform

    # Installation de FreeNX pour le profil garage
    install_nx() {
        echo "Installation de FreeNX pour le profil garage"
        # Installation de FreeNX
        sudo add-apt-repository -y ppa:freenx-team/ppa
        sudo apt-get update
        sudo apt-get install -y freenx-server

        # Configuration de FreeNX
        sudo /usr/lib/nx/nxsetup --install

        # Démarrage du service FreeNX
        sudo service freenx-server start

        # Vérification du statut du service FreeNX
        sudo service freenx-server status
    }

    install_nx

    # Ajoutez d'autres outils spécifiques au garage ici
}

# Fonction pour installer les outils pour le profil élève
install_student_tools() {
    # Installation des outils pour l'élève
    install_package() {
        package_name="$1"
        if ! dpkg -l | grep -q "$package_name"; then
            apt-get install -y "$package_name"
        else
            echo "$package_name est déjà installé."
        fi
    }

    apt update
    install_package git
    install_package code # Exemple: installation de Visual Studio Code
    # Ajoutez d'autres outils spécifiques à l'élève ici
}

# Affichage du menu de sélection
echo "Choisissez le profil à installer :"
echo "1. Installation pour le garage"
echo "2. Installation pour l'élève"
read -p "Votre choix : " choix

# Vérification du choix de l'utilisateur et installation des outils correspondants
case $choix in
    1)
        install_garage_tools
        ;;
    2)
        install_student_tools
        ;;
    *)
        echo "Choix invalide. Veuillez choisir 1 ou 2."
        exit 1
        ;;
esac

# Nettoyage
apt autoremove -y
apt clean
