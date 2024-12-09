resource "time_sleep" "wait_180_seconds" {
  depends_on       = [kubectl_manifest.ingress]
  create_duration  = "180s"
  destroy_duration = "10s"
}

resource "time_sleep" "wait_120_seconds" {
  destroy_duration = "120s"
}

##############################################################################################
############################# For EKS Ingress v1.30 ##########################################
##############################################################################################


data "aws_lb" "ingress" {
  depends_on = [time_sleep.wait_180_seconds]
  tags = {
    "ingress.k8s.aws/stack" = "default/ingress"
    "elbv2.k8s.aws/cluster" = data.terraform_remote_state.vpc.outputs.eks_cluster_name
  }
}

resource "aws_route53_record" "pgadmin" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "pgadmin"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}

resource "aws_route53_record" "phpmyadmin" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "phpmyadmin"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}

resource "aws_route53_record" "ads" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "ads"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}

resource "aws_route53_record" "app" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "app"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}

resource "aws_route53_record" "admin-ui" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "admin"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}

resource "aws_route53_record" "media" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "media"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}

resource "aws_route53_record" "mediatoolkit" {
  depends_on      = [time_sleep.wait_180_seconds]
  name            = "mediatoolkit"
  type            = "A"
  zone_id         = data.terraform_remote_state.route53.outputs.route53_public_hosted_zone_id
  allow_overwrite = true

  alias {
    evaluate_target_health = false
    name                   = data.aws_lb.ingress.dns_name
    zone_id                = data.aws_lb.ingress.zone_id
  }
}
