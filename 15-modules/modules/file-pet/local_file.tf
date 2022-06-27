resource local_file "my-pet" {
  content = "Contenido: ${random_pet.my-pet.id}"
  filename             = var.filename
}
