
variable "instances_tag_name" {
  description = "List of tags to filter the instance to include into AWS Inspect"
  type = map
  default = {"Name" = "*"}
}


variable "inspector_rules_packages" {
  description = "List of ARNs of the rules packages to apply to AWS Inspect. To retrive it run: 'aws inspector list-rules-packages' or use 'data aws_inspector_rules_packages'"
  type = list(string)
  default = [
    "arn:aws:inspector:eu-west-1:357557129151:rulespackage/0-SPzU33xe",
    "arn:aws:inspector:eu-west-1:357557129151:rulespackage/0-SnojL3Z6",
    "arn:aws:inspector:eu-west-1:357557129151:rulespackage/0-lLmwe1zd",
    "arn:aws:inspector:eu-west-1:357557129151:rulespackage/0-sJBhCr0F",
    "arn:aws:inspector:eu-west-1:357557129151:rulespackage/0-ubA5XvBh",
  ]
}

variable "inspector_assessment_target_name" {
  description = "Name of the AWS Inspect assessment target"
  type = string
  default = "instance-assessment-target"
}

variable "inspector_assessment_template_name" {
  description = "Name of the AWS Inspect assessment template"
  type = string
  default = "instance-assessment-template"
}

variable "inspector_assessment_template_duration" {
  description = "Duration of the AWS Inspect assessment template"
  type = string
  default = "3600"
}
