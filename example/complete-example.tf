data "aws_inspector_rules_packages" "rules" {

}

module "inspector" {
  source = "github.com/dipietro-salvatore/terraform_aws_inspector_module.git"

  instances_tags = {
    "Name" = "*"
    "Customer" = "Customer1"
  }

  inspector_rules_packages = data.aws_inspector_rules_packages.rules.arns
  inspector_assessment_target_name = "instance-assessment-target"
  inspector_assessment_template_name = "instance-assessment-template"
  inspector_assessment_template_duration = "3600"
}
