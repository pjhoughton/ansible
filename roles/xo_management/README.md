# Ansible Role: xo management

## Description
The `xo_management` Ansible role handles software and container updates efficiently. It includes tasks for:

- Updating Xen with `xenorchestraupdaterinstaller` script

Each task is disabled by default; set them to `true` to activate.

## Requirements
- Ansible 2.9+ 
- Compatible with all major Linux distributions

## Role Variables

update_script_path: "/home/paul/XenOrchestraInstallerUpdater/xo-install.sh"  # Default path to the update script


### Task Configuration

- `xen_update`: Update Xen with `xenorchestraupdaterinstaller` script (default: `false`)

