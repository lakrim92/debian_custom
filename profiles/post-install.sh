#!/bin/bash

# Mettre à jour la liste des paquets
apt-get update

# Installer zstd et debootstrap s'ils ne sont pas déjà installés
apt-get install -y debootstrap

# Autres commandes post-installation
# ...

# Définir les variables pour l'exécution de debootstrap
TARGET_DIR="/mnt/debootstrap"
DEBIAN_VERSION="stable"
DEBIAN_MIRROR="http://deb.debian.org/debian/"

# Créer le répertoire cible si nécessaire
if [ ! -d "$TARGET_DIR" ]; then
    echo "Création du répertoire cible $TARGET_DIR..."
    mkdir -p $TARGET_DIR
fi

# Exécuter debootstrap
echo "Exécution de debootstrap..."
debootstrap --arch=amd64 $DEBIAN_VERSION $TARGET_DIR $DEBIAN_MIRROR

# Vérifier les logs de debootstrap
echo "Affichage des 50 dernières lignes des logs de debootstrap..."
tail -n 50 $TARGET_DIR/debootstrap/debootstrap.log

# Message de bienvenue
echo "Bienvenue sur votre nouveau système Debian!" > /home/visiteur/welcome.txt

# Copier le script dans le système nouvellement installé
cp /home/lakrim/workspace/debian_custom/DebianGN-simple-cdd/profiles/post-install.sh /target/home/visiteur/custom_post_install.sh

# Assurez-vous que le script est exécutable
chmod +x /target/home/visiteur/custom_post_install.sh

# Lancer le script post-installation personnalisé
chroot /target /home/visiteur/custom_post_install.sh

echo "Script post_install.sh terminé."
