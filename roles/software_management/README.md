# Ansible Role: software_management

## Description
The `software_management` Ansible role handles software and container updates efficiently. It includes tasks for:

- Updating the software cache
- Performing distribution upgrades
- Upgrading software packages
- Pulling new Docker container versions
- Updating Xen with `xenorchestraupdaterinstaller` script

Each task is disabled by default; set them to `true` to activate.

## Requirements
- Ansible 2.9+ 
- Compatible with all major Linux distributions

## Role Variables

### Task Configuration
- `software_cache`: Update software cache (default: `false`)
- `software_dist_upgrade`: Perform a distribution upgrade (default: `false`)
- `software_upgrade`: Upgrade software packages (default: `false`)
- `docker_pull`: Pull new Docker container versions (default: `false`)
- `xen_update`: Update Xen with `xenorchestraupdaterinstaller` script (default: `false`)

### Software Lists
- `software_list`: Array of software packages to install
- `software_uninstall_list`: Array of software packages to uninstall

```yaml
software_cache: false
software_dist_upgrade: false
software_upgrade: false
docker_pull: false
xen_update: false

software_list: []
software_uninstall_list: []


