## Terraforming simple nodes on Openstack

    OS_AUTH_URL=https://auth.cloud.ovh.net/v2.0/
    OS_TENANT_ID=
    OS_TENANT_NAME=
    OS_USERNAME=
    OS_PASSWORD=
    OS_REGION_NAME=

    module "terraform-blurb" {
      source = "github.com/thbkrkr/terraform/nodes"

      prefix = "c1.blurb"

      nb_nodes  = 3

      image = "Ubuntu 17.10"
      flavor = "s1-8"
      region = "SBG3"

      admin_cidr = "42.42.42.42/32"
      ssh_public_key = "${file("ssh/admin.id_rsa.pub")}"
    }
