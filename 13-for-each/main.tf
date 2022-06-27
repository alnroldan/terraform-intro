resource local_file "my-file" {
  
  content = "for-each"
  
  filename = each.value
  
  for_each = var.filename

}


output files {
  value       = local_file.my-file
  description = "show dataset"
  sensitive = true
}
