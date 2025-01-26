data "aws_eks_addon_version" "add-on-version" {
  addon_name         = "vpc-cni"
  kubernetes_version = aws_eks_cluster.main.version
}

output "add-on" {
  value = data.aws_eks_addon_version.add-on-version
}