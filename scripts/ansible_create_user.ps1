﻿New-LocalUser -name usr_ansible -Password (Read-Host -AsSecureString) -PasswordNeverExpires -AccountNeverExpires -UserMayNotChangePassword
Add-LocalGroupMember -Group Administrators -Member usr_ansible