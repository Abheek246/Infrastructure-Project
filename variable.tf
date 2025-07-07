variable "cidr" {
    default = "10.0.0.0/16"
}

variable "security_group" {
    default = "abheek_security_group"
}
variable "ami-id" {
    default = "ami-020cba7c55df1f615"
}
variable "key-name" {
    default = "jenkins-server"
}
variable "instance-type" {
    default = "t2.micro"
}