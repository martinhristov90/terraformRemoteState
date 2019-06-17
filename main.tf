terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "YOUR_ORGANIZAITON"

    workspaces {
      name = "YOUR_WORKSPACE"
    }
  }
}

resource "null_resource" "helloWorld1" {
  provisioner "local-exec" {
    command = "echo hello world1"
  }
}