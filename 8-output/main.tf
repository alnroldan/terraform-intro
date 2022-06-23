resource local_file my-file {
  content = "${random_pet.my-pet.id}"
  filename             = var.filename
  file_permission      = 0777
  directory_permission = 0777

  depends_on = [
    random_pet.my-pet
  ]
}


resource random_pet my-pet {
  length    = 1
  prefix    = var.prefix
  separator = " "

  
}

output pet-name {
  value       = random_pet.my-pet.id
  sensitive   = false
  description = "description"
  depends_on  = []
}


