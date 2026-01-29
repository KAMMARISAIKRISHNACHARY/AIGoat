# resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "sagemaker_images_lifecycle_config" {
#   name = "sagemaker-lifecycle-config-similar-images"
#   on_create = base64encode(templatefile("resources/supply_chain/lifecycle_config.sh", {
#     s3_bucket_name = aws_s3_bucket.sagemaker_similar_images_bucket.id
#   }))
#   on_start = base64encode(templatefile("resources/supply_chain/lifecycle_config.sh", {
#     s3_bucket_name = aws_s3_bucket.sagemaker_similar_images_bucket.id
#   }))
#   depends_on = [aws_s3_bucket.sagemaker_similar_images_bucket]
# }

# resource "aws_security_group" "sagemaker_images_sg" {
#   name        = "sagemaker-images-sg"
#   description = "Security group for SageMaker notebook instance"
#   vpc_id      = var.vpc_id
#
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_sagemaker_notebook_instance" "similar_images_notebook" {
#   name                         = "similar-images-search-${random_string.suffix.result}"
#   instance_type                = "ml.t2.medium"
#   role_arn                     = aws_iam_role.sagemaker_similar_images_execution_role.arn
#   lifecycle_config_name        = aws_sagemaker_notebook_instance_lifecycle_configuration.sagemaker_images_lifecycle_config.name
#   direct_internet_access       = "Enabled"
#   subnet_id                    = var.subd_public
#   security_groups              = [aws_security_group.sagemaker_images_sg.id]
# }
