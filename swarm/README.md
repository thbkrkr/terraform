## Terraforming Swarm on Openstack

Declare the module in .tf file and populate all variables.

    > cat swarm.tf

    module "terraform-swarm" {
      source = "github.com/thbkrkr/terraform/swarm"

      prefix = "swarm-1"

      nb_keystores = 3
      nb_masters  = 3
      nb_nodes  = 10

      image = "Ubuntu 15.10"
      flavor = "eg-7"
      region = "BHS1"

      admin_cidr = "42.42.42.42/32"
      ssh_public_key = "${file("/ops/creds/ssh/ovh_openstack.pub")}"
    }

Go!

    terraform apply