#!/bin/bash

# Aller dans le dossier du projet
cd ~/Desktop/NAASC/SpikCU-Master-Tools

# Activer l'environnement virtuel
source malek_myenv/bin/activate

# Aller dans le dossier Supervisor
cd Supervisor

# Lancer le script avec sudo et conserver les variables d'env du venv
sudo -E env "PATH=$PATH" "VIRTUAL_ENV=$VIRTUAL_ENV" python Supervisor.py
