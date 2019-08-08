# Terraform AWS Inspector module

This Terraform modules enable AWS Inspector for your account.

To use it, just insert this following two sections into your Terraform code and run it.

```
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
```

The module creates an assessment for all the selected instances that have a defined set of tags. 
The tags to considered can be defined in `instances_tags`.
