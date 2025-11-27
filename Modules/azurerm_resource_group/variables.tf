variable "todorg" {
  type = map(object({
    name     = string
    location = string
  }))
}
