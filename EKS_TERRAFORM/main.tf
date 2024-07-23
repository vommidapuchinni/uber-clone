resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::851725626951:role/ec2-full-acess"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-0cc3ff7675c6d3902", "subnet-0d8423e973609d6c1"]  # Replace with your subnet IDs
    security_group_ids = ["sg-043eeb99f97d705ff"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::851725626951:role/ec2-full-acess"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-0cc3ff7675c6d3902", "subnet-0d8423e973609d6c1"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}
