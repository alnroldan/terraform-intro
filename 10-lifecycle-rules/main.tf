resource "local_file" "my-file" {
  content              = "lifecycle-rules"
  filename             = "${path.module}/out/file.txt"
  file_permission      = 0700
  directory_permission = 0777

  # posterior al ejemplo de inmutable
  #   lifecycle {
  #     create_before_destroy = true
  #   }

  # posterior al paso anterior
  lifecycle {
    prevent_destroy = true

  }



}





