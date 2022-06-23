variable prefix {
  type        = list(string)
  default     = ["Hola", "Que Tal", "Como Vas"]
  description = "description"
}

variable file-content {
  type        = map(string)
  default     = {
    "contenido1" = "Mascotas super",
    "contenido2" = "Mascotas geniales"
  }
  description = "description"
}

variable juno {
  type        = object({
    nombre = string
    color = string
    edad = number
    favorita = bool
  })
  default = {
    nombre = "juno"
    color = "gris"
    edad = 3
    favorita = true
  }
  description = "description"
}

variable jill {
  type        = tuple([string, number, bool])
  default     = ["perro", 7, true]
  description = "description"
}




