resource local_file "mascotas" {
  content = var.content
  filename = var.filename
}


resource random_pet "mi-mascota" {
  length    = var.lengh
  prefix    = var.prefix
  separator = var.separator

}

