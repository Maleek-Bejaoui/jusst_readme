
# Variables
ENV_DIR=malek_myenv
PROJECT_DIR=Desktop/NAASC/SpikCU-Master-Tools
SUPERVISOR_DIR=$(PROJECT_DIR)/Supervisor

# Active l'environnement virtuel
activate:
	cd $(PROJECT_DIR) && source $(ENV_DIR)/bin/activate

# Lance Supervisor.py avec sudo et les bonnes variables d'environnement
run:
	cd $(SUPERVISOR_DIR) && \
	sudo -E env "PATH=$$PATH" "VIRTUAL_ENV=$$VIRTUAL_ENV" python Supervisor.py

# Active puis exécute
start: activate run
