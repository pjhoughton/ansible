# Ansible Role: file_management

## Description
The `file_management` Ansible role provides tasks for managing files and folders, as well as scheduling playbooks and scripts as cron jobs. The tasks include:

- `copy_file`: Copy a file from source to destination
- `copy_folder`: Copy a folder from source to destination
- `create_cron_playbook`: Add a playbook as a cron job
- `create_cron_script`: Add a script as a cron job
- `list_cron`: List existing cron jobs
- `make_executable`: Make a script executable
- `move_file`: Move a file from source to destination
- `move_folder`: Move a folder from source to destination

Each task is disabled by default and can be enabled by setting the respective variable to `true`.

## Requirements
- Ansible 2.9+ 
- Compatible with all major Linux distributions

## Role Variables

### Task Configuration
- `copy_file`: Copy a file (default: `false`)
- `copy_folder`: Copy a folder (default: `false`)
- `create_cron_playbook`: Add a playbook as a cron job (default: `false`)
- `create_cron_script`: Add a script as a cron job (default: `false`)
- `list_cron`: List existing cron jobs (default: `false`)
- `make_executable`: Make a script executable (default: `false`)
- `move_file`: Move a file (default: `false`)
- `move_folder`: Move a folder (default: `false`)

### Path Configuration
- `copy_file_src`: Source path for copying file
- `copy_file_dest`: Destination path for copying file
- `copy_folder_src`: Source path for copying folder
- `copy_folder_dest`: Destination path for copying folder
- `move_file_src`: Source path for moving file
- `move_file_dest`: Destination path for moving file
- `move_folder_src`: Source path for moving folder
- `move_folder_dest`: Destination path for moving folder

### Cron Configuration
- `cron_playbook_name`: Name of the playbook to be added as cron job
- `cron_playbook_minute`: Minute at which the playbook should run (default: "0")
- `cron_playbook_hour`: Hour at which the playbook should run (default: "2")
- `cron_playbook_day`: Day at which the playbook should run (default: "*")
- `cron_playbook_month`: Month at which the playbook should run (default: "*")
- `cron_playbook_weekday`: Weekday at which the playbook should run (default: "*")
- `cron_playbook_command`: Command to run the playbook

- `cron_script_name`: Name of the script to be added as cron job
- `cron_script_minute`: Minute at which the script should run (default: "0")
- `cron_script_hour`: Hour at which the script should run (default: "3")
- `cron_script_day`: Day at which the script should run (default: "*")
- `cron_script_month`: Month at which the script should run (default: "*")
- `cron_script_weekday`: Weekday at which the script should run (default: "*")
- `cron_script_command`: Command to run the script

- `file_to_make_executable`: Path to the script to be made executable

```yaml
copy_file: false
copy_folder: false
create_cron_playbook: false
create_cron_script: false
list_cron: false
make_executable: false
move_file: false
move_folder: false

copy_file_src: /path/to/source/file
copy_file_dest: /path/to/destination/file
copy_folder_src: /path/to/source/folder
copy_folder_dest: /path/to/destination/folder
move_file_src: /path/to/source/file
move_file_dest: /path/to/destination/file
move_folder_src: /path/to/source/folder
move_folder_dest: /path/to/destination/folder

cron_playbook_name: playbook_name
cron_playbook_minute: "0"
cron_playbook_hour: "2"
cron_playbook_day: "*"
cron_playbook_month: "*"
cron_playbook_weekday: "*"
cron_playbook_command: "ansible-playbook /path/to/playbook.yml"

cron_script_name: script_name
cron_script_minute: "0"
cron_script_hour: "3"
cron_script_day: "*"
cron_script_month: "*"
cron_script_weekday: "*"
cron_script_command: "/path/to/script.sh"

file_to_make_executable: /path/to/script.sh
