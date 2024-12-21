
# Note if you dont like vim  change the default editor by adding the following line EDITOR=nano  to file  ~/.bashrc


# create a directory pass_file
 
 mkdir pass_file

# Create a secure password file 

 openssl rand -base64 4096 >pass_file/demo_ansible_vault.pass - create a password file

Create a new fault

ansible-vault create group_vars/demo_vault.yml --vault-password-file=pass_file/demo_ansible_vault.pass

# Add the following line to ansible.cfg


#vault_password_file = $HOME/ansible/pass_file/demo_ansible_vault.pass
