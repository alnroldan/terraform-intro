resource local_file "saludo" {
  filename = "./out/saludo.txt"
  content = "Hola! .."
  # add after this line
  file_permission = "0700"
}
