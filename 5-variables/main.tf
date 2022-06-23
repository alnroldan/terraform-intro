resource random_pet "mascotas" {
  length    = 1
  prefix    = var.prefix[1]
  separator = " "
}


resource local_file name {
  content = var.file-content["contenido2"]
  filename             = "${path.module}/out/mascotas.txt"
 
}




