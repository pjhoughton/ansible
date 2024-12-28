Ansible Vault is a feature of ansible that allows you to keep sensitive data such as passwords or keys in encrypted files, rather than as plaintext in playbooks or roles. These vault files can then be distributed or placed in source control by default vaults are edited in vim this can be changed to nano by adding the following line EDITOR=nano  to file  ~/.bashrc


# create a directory pass_file
 
 mkdir pass_file

# Create a secure password file 

 openssl rand -base64 4096 >pass_file/demo_ansible_vault.pass - create a password file

Create a new fault

ansible-vault create group_vars/demo_vault.yml --vault-password-file=pass_file/demo_ansible_vault.pass

# Add the following line to ansible.cfg


#vault_password_file = $HOME/ansible/pass_file/demo_ansible_vault.pass
