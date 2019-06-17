## This repository is created with learning purposes for Terraform.

## Purpose :

- It provides a simple example of how to use Terraform `null_resource` with remote state file.

## How to install terraform : 

- The information about installing terraform can be found on the HashiCorp website 
[here](https://learn.hashicorp.com/terraform/getting-started/install.html)

## How to use it :

- In a directory of your choice, clone the github repository :
    ```
    git clone https://github.com/martinhristov90/terraformRemoteState.git
    ```

- Change into the directory :
    ```
    cd terraformRemoteState
    ```
- Create an account and organization in TF cloud, by going to `https://app.terraform.io`.

- Substitute the values for `organization` and `workspace` in `main.tf` to fit your profile. 

- Run `terraform init` to download the `null` provider and initialize the remote backend. The output should look like this :
    ```
    Initializing the backend...

    Successfully configured the backend "remote"! Terraform will automatically
    use this backend unless the backend configuration changes.

    Initializing provider plugins...
    - Checking for available provider plugins on https://releases.hashicorp.com...
    - Downloading plugin for provider "null" (2.1.2)...

    The following providers do not have any version constraints in configuration,
    so the latest version was installed.

    To prevent automatic upgrades to new major versions that may contain breaking
    changes, it is recommended to add version = "..." constraints to the
    corresponding provider blocks in configuration, with the constraint strings
    suggested below.

    * provider.null: version = "~> 2.1"

    Terraform has been successfully initialized!

    You may now begin working with Terraform. Try running "terraform plan" to see
    any changes that are required for your infrastructure. All Terraform commands
    should now work.

    If you ever set or change modules or backend configuration for Terraform,
    rerun this command to reinitialize your working directory. If you forget, other
    commands will detect it and remind you to do so if necessary.
    ```

- Run `terraform plan` to see what actions are going to be performed Terraform. Output should look like this :
    ```
    ------------------------------------------------------------------------

    An execution plan has been generated and is shown below.
    Resource actions are indicated with the following symbols:
      + create

    Terraform will perform the following actions:

      + null_resource.helloWorld
          id: <computed>


    Plan: 1 to add, 0 to change, 0 to destroy.

    ------------------------------------------------------------------------
    ```

- Run `terraform apply` to create the `null_resource` resource. As output you should see :
    ```
    null_resource.helloWorld: Creating...
    null_resource.helloWorld: Provisioning with 'local-exec'...
    null_resource.helloWorld (local-exec): Executing: ["/bin/sh" "-c" "echo hello world"]
    null_resource.helloWorld (local-exec): hello world
    null_resource.helloWorld: Creation complete after 0s (ID: 4992259830273505160)

    Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
    ```
    
- In order to destroy the created resources, you can use `terraform destroy`.