variable "name" {}
variable "vpc_id" {}

variable "ingress_rules" {
  type = list(object({
    from     = number
    to       = number
    protocol = string
    cidr     = list(string)
  }))
}
