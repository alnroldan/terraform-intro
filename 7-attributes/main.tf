resource local_file my-file {
  content = "${random_pet.my-pet.id}"
  filename             = var.filename
  file_permission      = 0777
  directory_permission = 0777
}


resource random_pet my-pet {
  length    = 1
  prefix    = var.prefix
  separator = " "
}

