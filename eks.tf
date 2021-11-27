module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.24.0"

  cluster_version = "1.21"
  cluster_name    = "rahulp-test-cluster"

  vpc_id          = data.aws_vpc.vpc.id
  subnets         = data.aws_subnet_ids.private.ids

  write_kubeconfig = true
  kubeconfig_name  = "kubeconfig"

  worker_groups = [
    {
      instance_type = "t2.large"
      asg_max_size  = 5
    }
  ]

  tags = {
    created_by   = "rahulp"
    purpose      = "test-cluster"
    businessunit = "DevOps"
  }
}
