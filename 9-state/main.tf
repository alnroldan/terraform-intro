resource "local_file" "my-file" {
  content          = "Mi mascota favorita es ${random_pet.dog.id}!!"
  filename         = var.filename
  file_permission = "0700"
}


# set this information after status file review

resource "random_pet" "dog" {
  length    = 1
  prefix    = ""
  separator = ""

}

resource "random_pet" "cat" {
  length    = 1
  prefix    = ""
  separator = ""

}

