## General Steps

1. **Generate SSH Key Pair on the Master Server**:
   On the master server, run `ssh-keygen` to generate an SSH key pair. This will create a private key (`id_rsa`) and a public key (`id_rsa.pub`) in the `~/.ssh` directory.

   ```bash
   ssh-keygen
   ```

2. **Copy Public Key to Target Server**:
   Copy the contents of the public key (`id_rsa.pub`) generated in the `~/.ssh` directory of the master server to the `authorized_keys` file on the target server. This allows SSH access from the master server to the target server without requiring a password.

3. **Add Target Server to Known Hosts**:
   Run `ssh-keyscan` to add the target server's SSH host key to the `known_hosts` file on the master server. This prevents SSH from prompting for confirmation when connecting to the target server for the first time.

   ```bash
   ssh-keyscan -H targetserver-ip >> ~/.ssh/known_hosts
   ```

4. **Create Ansible Playbook**:
   Create an Ansible playbook (e.g., `scr-2.yml`) to define the tasks you want to perform on the target server. Ensure that you have tasks defined in the playbook to perform the required actions on the target server.

5. **Create Ansible Vault Credentials**:
   If you need to store sensitive information, such as passwords or API keys, create an Ansible Vault file (`abc.yml`) using the `ansible-vault create` command. This file will store encrypted variables securely.

   ```bash
   ansible-vault create abc.yml
   ```

   Follow the prompts to create and edit the encrypted file.

6. **Run Ansible Playbook**:
   Run the Ansible playbook (`scr-2.yml`) using the `ansible-playbook` command, providing the inventory file (`inventory`) and using `--ask-vault-pass` to prompt for the vault password when running the playbook.

   ```bash
   ansible-playbook -i inventory scr-2.yml --ask-vault-pass
   ```

   This command will execute the tasks defined in the playbook on the target server.

