data "aws_eks_addon_version" "add-on-version" {
  for_each           = var.add-ons
  addon_name         = each.key
  kubernetes_version = aws_eks_cluster.main.version
}
