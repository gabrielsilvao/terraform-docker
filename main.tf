terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "web" {
  name         = "web:latest"
  keep_locally = false
}

resource "docker_container" "web" {
  image = docker_image.web.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 80
  }
}
