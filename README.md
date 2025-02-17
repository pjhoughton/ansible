
# What is Ansible

Ansible is an open source IT automation engine that automates provisioning, configuration management, application deployment, orchestration, and many other IT processes. It is free to use, and the project benefits from the experience and intelligence of its thousands of contributors.

Ansible’s main strengths are simplicity and ease of use. It also has a strong focus on security and reliability, featuring minimal moving parts. It uses OpenSSH for transport (with other transports and pull modes as alternatives), and uses a human-readable language that is designed for getting started quickly without a lot of training.

Control node
The machine from which you run the Ansible CLI tools.

Managed nodes
Also referred to as ‘hosts’, these are the target devices (servers, network appliances or any computer) you aim to manage with Ansible.

Inventory
A list of managed nodes provided by one or more ‘inventory sources’. Your inventory can specify information specific to each node, like IP address. It is also used for assigning groups, that both allow for node selection in the Play and bulk variable assignment.

Playbooks
They contain Plays (which are the basic unit of Ansible execution). This is both an ‘execution concept’ and how we describe the files on which ansible-playbook operates.

Playbooks are written in YAML and are easy to read, write, share and understand. To learn more about playbooks, see Ansible playbooks.

Plays
The main context for Ansible execution, this playbook object maps managed nodes (hosts) to tasks. The Play contains variables, roles and an ordered lists of tasks and can be run repeatedly. It basically consists of an implicit loop over the mapped hosts and tasks and defines how to iterate over them.

Roles
A limited distribution of reusable Ansible content (tasks, handlers, variables, plugins, templates and files) for use inside of a Play.

Tasks
The definition of an ‘action’ to be applied to the managed host. You can execute a single task once with an ad hoc command using ansible or ansible-console (both create a virtual Play).

# How to Install Ansible (Ubuntu)

On the control node:


sudo apt update
sudo apt upgrade -y
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible


# SSH Keys

SSH Keys are vital for ansible to work, you probably already use SSH keys but I suggest you have seperate key just for ansible, using the ed25519 standard due to the following benefits.

1) it’s faster: to generate and to verify
2) it’s more secure
3) collision resilience – this means that it’s more resilient against hash-function collision attacks (types of attacks where large numbers of keys are generated with the hope of getting two different keys have matching hashes)
4) keys are smaller – this, for instance, means that it’s easier to transfer and to copy/paste them

On the control node:

Create an SSH Key pair: run the followinhg command (note  i have added a comment, and changed the file name to denote its to be used for ansiable and also so it doenst over write your existing keys, usually a passphrase is a good idea but for automation leave it blank. 

   ssh-keygen -t ed25519  -C "Ansible" -f ~/.ssh/ansible _ed25519

 Copy the public key to all managed nodes
 
   ssh-copy-id -i ~/.ssh/ansible _ed25519 user@host


# GitHub

Its best practice to have a github ( or similar) repository for  ease of version control, sharing  and documentation 

# Github Syntax

git pull 

git status

git add .

git commit -m "added roles"

git push


# Ansible syntax

ansible all --key-file ~/.ssh/ansible_ed25519 -i inventory -m ping

# Can be simplified  to the following using ansible.cfg

ansible all -m ping   

 
# Other simple commands

ansible all --list hosts
ansible all -m gather_facts
ansible all -m gather_facts --limit xo.houghton.network

# What if you need to elevate the command thats where --become command is used:

# installs atitude on a servers asking for sudo password 

ansible all -m apt -a name=aptitude --become --ask-become-pass

# Updates snapd asking  sudo password 

ansible all -m apt -a "name=snapd state=latest" --become --ask-become-pass

# Playbook state: latest to install state: absent to remove 


ansible-playbook --ask-become-pass install_aptitude.yml 

# tags can be used as well as limit 

ansible-playbook --tags cockpit --ask-become-pass install_packages.yml



# variables 

can be used when when managing systems of different distributions as package and package management software , may well be differnet  

declare variables inventary files or  host variable files 

variable_name:value


using variables inside Plays and tasks  

eg.     name: {{variable_name}}


Roles

All Roles craeted as seperate yml files, which are lsited in main.yml but set to false so do not run unless flag is set to true 

audit
base
cron
db_servers
file_servers
key_management:
   tasks:
	backup_keys
	create_keys
	delete_keys

server_deploy:
   tasks:
	disable_ipv6
	set_timezone
	swap_file

software_management:
   tasks:
	docker_pull		runs a docker compose pull to update containers
	soctware_cache		updates cache, autoclean, autoremove
	software_dist_upgrade   performs a distribution update
	software_install        installs on or more software pacakages
	software_uninstall      uninstalls one or more software packages
	software_upgrade        upgrades all software 
	xen_update              update xen orchestrata using XenOrchestraInstallerUpdater script

user_management:
   tasks:
	assign_groups
	create_user
	delete_user
	make_sudoer

web_servers
   tasks:
	copy_index		copys index.html to default location
	copy_website            copys website to a default location 
	install			install either Nginx or Apache2 
	tidy_up
	uninstall		uninstall either Nginx or Apache2 
	update_website
   handlers:
	start web server
	stop webserver
	restart web server
	reload web server

workstations
xcp_servers





