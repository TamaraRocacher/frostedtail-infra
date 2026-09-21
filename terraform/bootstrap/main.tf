resource "ovh_me_api_oauth2_client" "ovh_auth_client" {
    name = "OVH Auth client"
    description = "Client d'authentification OVH"
    flow = "CLIENT_CREDENTIALS"
}