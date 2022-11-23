variable "environment" {
  type        = string
  description = ""
}

variable "aws_region" {
  type        = string
  description = ""
}

variable "autoscale_min" {
  default     = "1"
  description = "Minimum autoscale"
}

variable "autoscale_max" {
  default     = "1"
  description = "Maximum autoscale"
}

variable "subnet_counts" {
  default     = 2
  description = "number of subnets"
}

variable "amis" {
  description = "Images avaiables."
  default = {
    us-east-1 = "ami-002070d43b0a4f171"
    us-east-2 = ""
    us-west-1 = ""
    us-west-2 = ""

  }
}

variable "key_name" {
  type        = string
  description = "key name"
  default     = "kp_wiki"
}

variable "sns_topic_arn" {
  default = "arn:aws:sns:us-east-2:791659331772:SNS_Notificacao_Terraform:0ec46410-7035-4154-88ef-c1ad9435f141"
}

variable "sns-email" {
  default = "rogerio.calixto@futurasistemas.com.br"
}