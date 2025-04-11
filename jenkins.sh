#!/bin/bash

# Met à jour les paquets
sudo apt update -y

# Installe curl si ce n'est pas déjà fait
sudo apt install curl -y

# Ajout de la clé GPG d'Adoptium avec sudo pour tee
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo tee /etc/apt/keyrings/adoptium.asc > /dev/null

# Ajoute le dépôt Adoptium (Temurin)
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/adoptium.list > /dev/null

# Met à jour la liste des paquets
sudo apt update -y

# Installe le JDK Temurin 17
sudo apt install temurin-17-jdk -y

# Vérifie l'installation de Java
java --version

# Ajoute la clé GPG de Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Ajoute le dépôt Jenkins
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Met à jour les paquets
sudo apt update -y

# Installe Jenkins
sudo apt install jenkins -y

# Démarre le service Jenkins
sudo systemctl start jenkins

# Affiche le statut de Jenkins
sudo systemctl status jenkins
