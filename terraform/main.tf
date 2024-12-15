terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

variable "docker_image_name" {
    description = "Docker image name"
    type        = string
}

variable "docker_image_tag" {
    description = "Docker image tag (optional)"
    type        = string
    default     = ""
}

variable "internal_port" {
    default = 80
}

variable "external_port" {
    default = 8080
}

resource "docker_image" "app_image" {
    name = "${var.docker_image_name}${var.docker_image_tag != "" ? ":${var.docker_image_tag}" : ""}"
}

resource "docker_container" "app_container" {
    name  = "app-container"
    image = docker_image.app_image.image_id

    ports {
        internal = var.internal_port
        external = var.external_port
    }
}
