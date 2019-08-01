
# Declare the data source
#data "aws_inspector_rules_packages" "rules" {}

# data "aws_instances" "myinstances" {
#   filter {
#       name = "tag:Name"
#       values = flatten(var.instances_tag_name)
#   }
#   instance_state_names = ["running", "stopped", "pending", "stopping"]
# }

# output "instance_ip_addr" {
#   value = "${data.aws_instance.myinstances}"
# }

resource "aws_inspector_resource_group" "myinstances" {
  tags =  var.instances_tag_name
}

resource "aws_inspector_assessment_target" "myinspect" {
  name = var.inspector_assessment_target_name
  resource_group_arn = "${aws_inspector_resource_group.myinstances.arn}"
}

resource "aws_inspector_assessment_template" "mytemplate" {
  name       = var.inspector_assessment_template_name
  target_arn = "${aws_inspector_assessment_target.myinspect.arn}"
  duration   = var.inspector_assessment_template_duration

  rules_package_arns = var.inspector_rules_packages
}
