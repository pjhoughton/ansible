
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

# How to Install Ansible



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
