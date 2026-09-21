resource "ovh_iam_policy" "iam_policy" {
    name        = "frostedtail-terraform"
    description = "Terraform management of The Frosted Tail VPS"

    identities = [
        ovh_me_api_oauth2_client.ovh_auth_client.identity
    ]

    resources = [
        "urn:v1:eu:resource:vps:${var.vps_service_name}"
    ]

    allow = [
        "vps:apiovh:*"
    ]
}