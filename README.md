What is Ansible
Ansible is an open-source IT automation engine that automates provisioning, configuration management, application deployment, orchestration, and many other IT processes. It is free to use and benefits from the experience and intelligence of its thousands of contributors.

Ansible's main strengths are simplicity and ease of use. It also has a strong focus on security and reliability, featuring minimal moving parts. It uses OpenSSH for transport (with other transports and pull modes as alternatives) and uses a human-readable language designed for getting started quickly without extensive training.

Key Concepts
Control Node
The machine from which you run the Ansible CLI tools.

Managed Nodes
Also referred to as 'hosts', these are the target devices (servers, network appliances, or any computer) you aim to manage with Ansible.

Inventory
A list of managed nodes provided by one or more 'inventory sources'. Your inventory can specify information specific to each node, like IP address. It is also used for assigning groups, allowing for node selection in the play and bulk variable assignment.

Playbooks
Playbooks contain Plays, which are the basic unit of Ansible execution. This is both an 'execution concept' and how we describe the files on which ansible-playbook operates. Playbooks are written in YAML and are easy to read, write, share, and understand. To learn more about playbooks, see Ansible playbooks.

Plays
The main context for Ansible execution. A playbook maps managed nodes (hosts) to tasks, containing variables, roles, and an ordered list of tasks. Plays can be run repeatedly, consisting of an implicit loop over the mapped hosts and tasks.

Roles
A limited distribution of reusable Ansible content (tasks, handlers, variables, plugins, templates, and files) for use inside of a play.

Tasks
The definition of an 'action' to be applied to the managed host. You can execute a single task once with an ad hoc command using ansible or ansible-console, both creating a virtual play.

How to Install Ansible (Ubuntu)
On the control node, run the following commands:

sh
sudo apt update
sudo apt upgrade -y
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
SSH Keys
SSH keys are vital for Ansible to work. While you probably already use SSH keys, it's recommended to have a separate key just for Ansible, using the ed25519 standard due to its benefits:

Faster: To generate and verify.

More Secure

Collision Resilience: More resilient against hash-function collision attacks.

Smaller Keys: Easier to transfer and copy/paste.

On the control node, create an SSH key pair by running the following command (note the comment and the filename to denote it's for Ansible):

sh
ssh-keygen -t ed25519 -C "Ansible" -f ~/.ssh/ansible_ed25519
Copy the public key to all managed nodes:

sh
ssh-copy-id -i ~/.ssh/ansible_ed25519 user@host
GitHub
It's best practice to have a GitHub (or similar) repository for ease of version control, sharing, and documentation.

GitHub Syntax
sh
git pull 
git status
git add .
git commit -m "added roles"
git push
Ansible Syntax
sh
ansible all --key-file ~/.ssh/ansible_ed25519 -i inventory -m ping
Simplified using ansible.cfg:

sh
ansible all -m ping
Other Simple Commands
sh
ansible all --list-hosts
ansible all -m gather_facts
ansible all -m gather_facts --limit xo.houghton.network
Elevating Commands with --become
Install aptitude on all servers, asking for sudo password:

sh
ansible all -m apt -a name=aptitude --become --ask-become-pass
Update snapd, asking for sudo password:

sh
ansible all -m apt -a "name=snapd state=latest" --become --ask-become-pass
Playbook Commands
Install packages using a playbook:

sh
ansible-playbook --ask-become-pass install_aptitude.yml
Using tags and limit:

sh
ansible-playbook --tags cockpit --ask-become-pass install_packages.yml
Variables
Variables can be used when managing systems of different distributions as package management software may vary.

Declare variables in inventory files or host variable files:

yaml
variable_name: value
Using variables inside plays and tasks:

yaml
name: {{ variable_name }}
Roles
All roles are created as separate YAML files and listed in main.yml, but set to false so they do not run unless flagged as true.

Role List
audit

base

cron

db_servers

file_management:

tasks:

copy_file

copy_folder

move_file

move_folder

create_cron_playbook

create_cron_script

make_executable

file_servers

key_management:

tasks:

backup_keys

create_keys

delete_keys

add_keys

server_deploy:

tasks:

disable_ipv6

set_timezone

swap_file

software_management:

tasks:

docker_pull: runs a docker-compose pull to update containers

software_cache: updates cache, autoclean, autoremove

software_dist_upgrade: performs a distribution update

software_install: installs one or more software packages

software_uninstall: uninstalls one or more software packages

software_upgrade: upgrades all software

xen_update: updates Xen Orchestrata using XenOrchestraInstallerUpdater script

user_management:

tasks:

assign_groups

create_user

delete_user

make_sudoer

web_servers:

tasks:

copy_index: copies index.htmlto default location

copy_website: copies website to a default location

install: installs either Nginx or Apache2

tidy_up

uninstall: uninstalls either Nginx or Apache2

update_website

handlers:

start web server

stop web server

restart web server

reload web server

workstations

xcp_servers