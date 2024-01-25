# palworld-server-aws

[![provider aws](https://img.shields.io/badge/provider-aws-blue?logo=amazonaws)](https://img.shields.io/badge/provider-aws-blue?logo=amazonaws) [![aws ec2](https://img.shields.io/badge/aws-ec2-blue?logo=amazonec2&logoColor=#FF9900)](https://img.shields.io/badge/aws-ec2-blue?logo=amazonec2&logoColor=#FF9900) [![terraform version](https://img.shields.io/badge/terraform-v5.33.0-blue?logo=terraform&logoColor=purple)](https://img.shields.io/badge/terraform-v1.2.4-blue?logo=terraform&logoColor=purple)

This repository contains the infrastructure as code as well as the additional steps required for setting up a dedicated PalWorld server on AWS.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Local Development Guide](#local-development-guide)
  - [Server Setup Guide](#server-setup-guide)
  - [Server Automation Guide](#server-automation-guide)
- [Need Support?](#need-support)
- [Reporting Security Vulnerabilities and Security Bugs](#reporting-security-vulnerabilities-and-security-bugs)
- [Contributing](#contributing)

## Getting Started

This section provides supporting steps and documentation for working with this repository.

### Prerequisites

Before jumping into the code, there are a few prerequisites.

1. Local development should be done from a UNIX-based machine - use Linux, MacOS, or WSL2 if you're on a Windows machine.

2. GitHub access should be managed through an SSH key in your UNIX environment. If you're unfamiliar with this process [start here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

3. [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).

4. [Create an AWS account](https://aws.amazon.com/resources/create-account/).

5. [Create a dedicated S3 bucket](https://docs.aws.amazon.com/AmazonS3/latest/userguide/creating-bucket.html) for storing the Terraform state.

### Local Development Guide

1. Clone the repository (if this is your first time).

   ```sh
   git clone git@github.com:dgonzo27/palworld-server-aws.git
   ```

2. Navigate into the repository directory.

   ```sh
   cd palworld-server-aws
   ```

3. Update/validate environment variables in `terraform/variables.tf`.

4. Update/validate the bucket name in `terraform/terraform.tf`.

5. Set the environment variables for AWS programmatic access.

   ```sh
   export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
   export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
   ```

6. Create the SSH key pair for the environment you are provisioning resources for.

   ```sh
   ssh-keygen -m PEM -f change_me_ssh.pem
   ```

7. Copy the public key that was generated and paste its contents as a new file in `terraform/pubkeys/change_me_ssh.pem.pub`.

   ```sh
   pbcopy < ~/.ssh/change_me_ssh.pem.pub
   ```

8. Navigate into the `terraform` direction, init and validate terraform.

   ```sh
   cd terraform

   terraform init

   terraform validate
   ```

9. Run the `plan` command to review the deployment.

   ```sh
   terraform plan
   ```

10. Run the `apply` command to deploy.

    ```sh
    terraform apply
    ```

### Server Setup Guide

1. Update permissions on the SSH key.

   ```sh
   chmod 400 ~/.ssh/change_me_ssh.pem
   ```

2. SSH into the newly deployed EC2 instance.

   ```sh
   ssh -i ~/.ssh/change_me_ssh.pem admin@public-ip-address
   ```

3. Update and upgrade everything.

   ```sh
   sudo apt update && sudo apt dist-upgrade
   ```

4. Install SteamCMD with all its dependencies.

   ```sh
   sudo apt install software-properties-common && sudo apt-add-repository non-free && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install steamcmd
   ```

5. Install the Palworld dedicated server via SteamCMD.

   ```sh
   /usr/games/steamcmd +login anonymous +app_update 2394010 validate +quit
   ```

6. Create a `.steam` directory and move the newly installed folder inside of the `.steam` directory.

   ```sh
   mkdir .steam

   mv ~/Steam/ ./.steam
   ```

7. Create symlinks to the `linux32` and `linux64` SDKs (this may be located somewhere different for you so just be sure to locate them).

   ```sh
   ln -s ~/.local/share/Steam/steamcmd/linux32 ~/.steam/sdk32

   ln -s ~/.local/share/Steam/steamcmd/linux64 ~/.steam/sdk64
   ```

8. Launch the server for creating configuration files.

   ```sh
   cd ~/.steam/Steam/steamapps/common/PalServer

   ./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
   ```

9. Copy the default server settings into the appropriate directory and update the settings for your server.

   ```sh
   cp DefaultPalWorldSettings.ini Pal/Saved/Config/LinuxServer/PalWorldSettings.ini

   nano Pal/Saved/Config/LinuxServer/PalWorldSettings.ini
   ```

### Server Automation Guide

1. Download the maintenance script and make it executable.

   ```sh
   sudo wget https://raw.githubusercontent.com/dgonzo27/palworld-server-aws/master/scripts/palworld-maintenance.sh -P /home/admin/ && chmod +x /home/admin/palworld-maintenance.sh
   ```

2. Create the backup folder.

   ```sh
   mkdir -p /home/admin/Palworld_backups
   ```

3. Download the service file.

   ```sh
   sudo wget https://raw.githubusercontent.com/dgonzo27/palworld-server-aws/master/scripts/palworld.service -P /etc/systemd/system/
   ```

4. Enable and start the service.

   ```sh
   sudo systemctl enable palworld.service && sudo systemctl daemon-reload && sudo systemctl start palworld.service
   ```

## Need Support?

File an issue via [GitHub Issues](https://github.com/dgonzo27/palworld-server-aws/issues).

## Reporting Security Vulnerabilities and Security Bugs

Security vulnerabilities and bugs should be reported privately, via email, to the maintainers of this repository. Please contact [Dylan Gonzales](mailto:dylangonzales247@gmail.com). For more information, visit the [security guidelines](./SECURITY.md).

## Contributing

Before contributing to this repository, please review the [code of conduct](./CODE_OF_CONDUCT.md).

Contributions and suggestions are welcomed. However, there is a level of responsibility placed on the contributor to follow best-practices, provide thorough testing, follow the branching strategy, use the pull request template, and maintain a positive and coachable attitude when receiving feedback or questions on your code.

When contributing, you are granting the maintainers of this repository the rights to use your contribution(s).
