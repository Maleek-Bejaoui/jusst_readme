SHELL := /bin/bash

ENV_DIR=malek_myenv
PROJECT_DIR=Desktop/NAASC/SpikCU-Master-Tools
SUPERVISOR_DIR=$(PROJECT_DIR)/Supervisor

activate:
	cd $(PROJECT_DIR) && source $(ENV_DIR)/bin/activate

run:
	cd $(SUPERVISOR_DIR) && \
	sudo -E env "PATH=$$PATH" "VIRTUAL_ENV=$$VIRTUAL_ENV" python Supervisor.py

# Active puis execute
start: activate run
