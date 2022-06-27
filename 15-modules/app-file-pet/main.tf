module "local-random" {
  source = "../modules/file-pet"
  filename = "./out/file.txt"
  prefix = "Hola"
}
