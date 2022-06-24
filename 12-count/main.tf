resource local_file "my-file" {
  content = "prueba"
  filename             = var.filename[count.index]

  count = 3
  
}
