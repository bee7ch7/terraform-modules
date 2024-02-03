
resource "aws_ecr_repository" "this" {
  name                 = "${var.name}-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  tags = {
    Name        = "${var.name}-registry-${var.environment}",
    Environment = var.environment
  }
}

resource "aws_ecr_lifecycle_policy" "this" {
  count      = var.attach_lifecycle_policy ? 1 : 0
  repository = aws_ecr_repository.this.name
  policy     = var.policy
}
