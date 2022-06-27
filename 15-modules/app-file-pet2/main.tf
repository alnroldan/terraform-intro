module "local-random2" {
  source = "../modules/file-pet"
  filename = "./out/file.txt"
  prefix = "Hi"
}
