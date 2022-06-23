resource local_file "mascota" {
  filename = "${path.module}/out/Mascotas.txt"
  content = "Mascotas super!" 
}

resource random_pet "mi-mascota" {
  length    = "1"
  prefix    = "Hola"
  separator = " "
}


