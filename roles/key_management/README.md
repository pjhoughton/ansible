# Ansible Role: key_management

## Description
The `key_management` Ansible role is designed to manage SSH keys, including adding, backing up, creating, and deleting keys. Each task is disabled by default and can be enabled by setting the respective variable to `true`.

## Requirements
- Ansible 2.9+ 
- Compatible with all major Linux distributions

## Role Variables

### Task Configuration
- `add_keys`: Add new SSH keys (default: `false`)
- `backup_keys`: Backup existing SSH keys (default: `false`)
- `create_keys`: Create new SSH keys (default: `false`)
- `delete_keys`: Delete existing SSH keys (default: `false`)

### Key Configuration
- `rsa_key_size`: RSA key size
- `ed25519_key_size`: Ed25519 key size
- `ssh_key_backup_path`: Path to backup SSH keys

```yaml
add_keys: false
backup_keys: false
create_keys: false
delete_keys: false

rsa_key_size: 2048
ed25519_key_size: 256
ssh_key_backup_path: /path/to/backup
