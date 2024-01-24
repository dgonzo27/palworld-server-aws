# palworld-server-aws

[![provider aws](https://img.shields.io/badge/provider-aws-blue?logo=amazonaws)](https://img.shields.io/badge/provider-aws-blue?logo=amazonaws) [![aws ec2](https://img.shields.io/badge/aws-ec2-blue?logo=amazonec2&logoColor=#FF9900)](https://img.shields.io/badge/aws-ec2-blue?logo=amazonec2&logoColor=#FF9900) [![terraform version](https://img.shields.io/badge/terraform-v5.33.0-blue?logo=terraform&logoColor=purple)](https://img.shields.io/badge/terraform-v1.2.4-blue?logo=terraform&logoColor=purple)

This repository contains the infrastructure as code as well as the additional steps required for setting up a dedicated PalWorld server on AWS.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Local Development Guide](#local-development-guide)
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

## Need Support?

File an issue via [GitHub Issues](https://github.com/dgonzo27/rust-yew-tailwind/issues).

## Reporting Security Vulnerabilities and Security Bugs

Security vulnerabilities and bugs should be reported privately, via email, to the maintainers of this repository. Please contact [Dylan Gonzales](mailto:dylangonzales247@gmail.com). For more information, visit the [security guidelines](./SECURITY.md).

## Contributing

Before contributing to this repository, please review the [code of conduct](./CODE_OF_CONDUCT.md).

Contributions and suggestions are welcomed. However, there is a level of responsibility placed on the contributor to follow best-practices, provide thorough testing, follow the branching strategy, use the pull request template, and maintain a positive and coachable attitude when receiving feedback or questions on your code.

When contributing, you are granting the maintainers of this repository the rights to use your contribution(s).
