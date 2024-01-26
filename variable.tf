variable "ami_id" {
 type = string
 default = "ami-0c00c714c7f84b49d"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "instance_name" {
  type = string
  default = "pardeep-instance"
}

variable "key_pair_name" {
  type    = string
  default = "terraform"
}

variable "bucket_name" {
  default = "my17bucket"
}

variable "dynamodb_table" {
  default = "student_record"
}
