resource "kubectl_manifest" "ingress" {
  depends_on = [time_sleep.wait_120_seconds]
  yaml_body  = <<YAML
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/target-type: ip
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/certificate-arn: ${data.terraform_remote_state.route53.outputs.acm_arn}
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}, {"HTTPS":443}]'
    alb.ingress.kubernetes.io/actions.ssl-redirect: '{"Type": "redirect", "RedirectConfig": { "Protocol": "HTTPS", "Port": "443", "StatusCode": "HTTP_301"}}'
    alb.ingress.kubernetes.io/target-group-attributes: deregistration_delay.timeout_seconds=30
    alb.ingress.kubernetes.io/ssl-policy: ELBSecurityPolicy-FS-1-2-Res-2020-10
spec:
  rules:
  - host: "pgadmin.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: pgadmin
              port:
                number: 80
  - host: "phpmyadmin.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: phpmyadmin
              port:
                number: 80
  - host: "ads.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: sweply
              port:
                number: 80
  - host: "app.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: frontend
              port:
                number: 3000
  - host: "admin.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: admin-ui
              port:
                number: 4173
  - host: "media.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: media
              port:
                number: 9999
  - host: "mediatoolkit.${data.terraform_remote_state.route53.outputs.domain}"
    http:
      paths:
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: ssl-redirect
              port:
                name: use-annotation
        - path: "/"
          pathType: Prefix
          backend:
            service:
              name: mediatoolkit
              port:
                number: 6666
YAML
}
