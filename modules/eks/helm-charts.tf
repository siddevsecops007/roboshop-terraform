resource "null_resource" "kube-bootstrap" {
  depends_on = [aws_eks_cluster.main, aws_eks_node_group.main]
  provisioner "local-exec" {
    command = <<EOF
aws eks update-kubeconfig --name ${var.env}-eks
kubectl create namespace devops
EOF
  }

}


resource "helm_release" "nginx-ingress" {
  depends_on = [null_resource.kube-bootstrap]
  chart = "oci://ghcr.io/nginx/charts/nginx-ingress"
  name  = "nginx-ingress"
  namespace = "devops"
  wait       = true

  values = [
    file("${path.module}/helm-config/nginx-ingress.yml")
  ]
}

resource "helm_release" "external-DNS" {
  depends_on = [null_resource.kube-bootstrap, helm_release.nginx-ingress]

  name             = "external-dns"
  repository       = "https://kubernetes-sigs.github.io/external-dns/"
  chart            = "external-dns"
  namespace        = "devops"
  create_namespace = true
  wait             = false

}

resource "helm_release" "argocd" {
  depends_on = [null_resource.kube-bootstrap, helm_release.external-DNS]

  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  wait             = false
#   set {
#     name  = "global.domain"
#     value = "argocd-${var.env}.siddevsecops.icu"
#   }
  values = [
    file("${path.module}/helm-config/argocd.yml")
  ]

}





#




