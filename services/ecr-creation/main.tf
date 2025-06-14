locals {
  Environment = "prod"
  Application = "ws"
  image_tag_mutability = "MUTABLE"
  ecr_name = "${local.Environment}-${local.Application}"

}



resource "aws_ecr_repository" "ecr_creation" {
   # for_each = toset(var.ecrList)
   # name = each.value

   count = length(var.ecrList)
   name = var.ecrList[count.index]

    image_scanning_configuration {
      scan_on_push = true
    
    }

    image_tag_mutability = local.image_tag_mutability

    tags = {
      Environment = local.Environment
      Application = local.Application
      ecr_Name = local.ecr_name

    }
}
