resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::905418143553:role/ec2-0admin"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0a302525a470342cf", "subnet-09fe2ebc7d25c14dd"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0aff926e8c0eec7af"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::905418143553:role/ec2-0admin"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-0a302525a470342cf", "subnet-09fe2ebc7d25c14dd"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
