# Ansible Role: docker_management

## Description
The `docker_management` Ansible role handles software and container updates efficiently. It includes tasks for:


- Pulling new Docker container versions


Each task is disabled by default; set them to `true` to activate.

## Requirements
- Ansible 2.9+ 
- Compatible with all major Linux distributions

## Role Variables

### Task Configuration

- `docker_pull`: Pull new Docker container versions (default: `false`)


