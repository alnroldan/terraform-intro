resource local_file "my-file" {
  content = data.local_file.external-file.content
  filename             = "${path.module}/out/file.txt"
  file_permission      = 0700
  directory_permission = 0777
}

data local_file "external-file" {
  filename = "${path.module}/out/sample.txt"
}

