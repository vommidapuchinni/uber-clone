resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::891377277875:role/uber-role"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0a60c45178eb227d4", "subnet-02d78eb93acef862f"]  # Replace with your subnet IDs
    security_group_ids = ["sg-02b97bab5a63fec8a"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::891377277875:role/uber-role"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-0a60c45178eb227d4", "subnet-02d78eb93acef862f"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
