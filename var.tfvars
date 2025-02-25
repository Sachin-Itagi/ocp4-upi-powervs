### IBM Cloud details

ibmcloud_api_key    = "<key>"
ibmcloud_region     = "<region>"
ibmcloud_zone       = "<zone>"
service_instance_id = "<cloud_instance_ID>"

### OpenShift Cluster Details

### This is default minimalistic config. For PowerVS processors are equal to entitled physical count
### So N processors == N physical core entitlements == ceil[N] vCPUs.
### Example 0.5 processors == 0.5 physical core entitlements == ceil[0.5] = 1 vCPU == 8 logical OS CPUs (SMT=8)
### Example 1.5 processors == 1.5 physical core entitlements == ceil[1.5] = 2 vCPU == 16 logical OS CPUs (SMT=8)
### Example 2 processors == 2 physical core entitlements == ceil[2] = 2 vCPU == 16 logical OS CPUs (SMT=8)
bastion   = { memory = "16", processors = "1", "count" = 1 }
bootstrap = { memory = "32", processors = "0.5", "count" = 1 }
master    = { memory = "32", processors = "0.5", "count" = 3 }
worker    = { memory = "32", processors = "0.5", "count" = 2 }
#With additional attributes
#master    = { memory = "32", processors = "0.5", "count" = 3, data_volume_count  = 0, data_volume_size  = 100 }
#worker    = { memory = "32", processors = "0.5", "count" = 2, data_volume_count  = 0, data_volume_size  = 100 }

rhel_image_name  = "rhel-8.3"
rhcos_image_name = "rhcos-4.12"

### Provide these parameters if RHCOS image needs to be imported from public bucket of cloud object storage to PVS.
### When this is provided, data provided through parameter "rhcos_image_name" will be ignored.
rhcos_import_image              = false # true/false (default=false).
rhcos_import_image_filename     = "rhcos-410-84-202201251004-0-ppc64le-powervs.ova.gz"
rhcos_import_image_storage_type = "tier1" # tier1/tier3 (default=tier1) Storage type in PowerVS

processor_type = "shared"
system_type    = "s922"
network_name   = "ocp-net"

rhel_username                   = "root" #Set it to an appropriate username for non-root user access
connection_timeout              = 30     # minutes
public_key_file                 = "data/id_rsa.pub"
private_key_file                = "data/id_rsa"
rhel_subscription_username      = "<subscription-id>"       #Leave this as-is if using CentOS as bastion image
rhel_subscription_password      = "<subscription-password>" #Leave this as-is if using CentOS as bastion image
rhel_subscription_org           = ""                        # Define it only when using activationkey for RHEL subscription
rhel_subscription_activationkey = ""                        # Define it only when using activationkey for RHEL subscription
rhel_smt                        = 4

### OpenShift Installation Details

openshift_install_tarball = "https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/stable/openshift-install-linux.tar.gz"
openshift_client_tarball  = "https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/stable/openshift-client-linux.tar.gz"
pull_secret_file          = "data/pull-secret.txt"

cluster_domain    = "ibm.com"  #Set domain to nip.io or sslip.io if you prefer using online wildcard domain and avoid modifying /etc/hosts
cluster_id_prefix = "test-ocp" # Set it to empty if just want to use cluster_id without prefix
cluster_id        = ""         # It will use random generated id with cluster_id_prefix if this is not set

use_zone_info_for_names = true # If set it to false, the zone info would not be used in resource names on PowerVS.
#fips_compliant      = false   # Set it true if you prefer to use FIPS enable in ocp deployment

### Using IBM Cloud Services
#use_ibm_cloud_services     = true
#ibm_cloud_vpc_name         = ""
#ibm_cloud_vpc_subnet_name  = ""
#ibm_cloud_resource_group   = "Default"
# iaas_vpc_region           = ""               # if empty, will default to ibmcloud_region.
# ibm_cloud_cis_crn         = "crn:v1:bluemix:public:internet-svcs:global:a/<account_id>:<cis_instance_id>::"
# ibm_cloud_tgw             = ""  # Name of existing Transit Gateway where VPC and PowerVS targets are already added.
# ibm_cloud_connection_name = ""  # Name of the cloud connection which is already attached to the above Transit Gateway.

### Misc Customizations

#enable_local_registry      = false  #Set to true to enable usage of local registry for restricted network install.
#local_registry_image       = "docker.io/ibmcom/registry-ppc64le:2.6.2.5"
#ocp_release_tag            = "4.4.9-ppc64le"
#ocp_release_name           = "ocp-release"
#release_image_override     = ""


#helpernode_repo            = "https://github.com/redhat-cop/ocp4-helpernode"
#helpernode_tag             = ""
#install_playbook_repo      = "https://github.com/ocp-power-automation/ocp4-playbooks"
#install_playbook_tag       = ""

#bastion_health_status      = "OK"
#installer_log_level        = "info"
#ansible_extra_options      = "-v"
#ansible_repo_name          = "ansible-2.9-for-rhel-8-ppc64le-rpms"
#dns_forwarders             = "1.1.1.1; 9.9.9.9"
#rhcos_pre_kernel_options   = []
#rhcos_kernel_options       = []
#node_labels                = {}
#chrony_config              = true
#chrony_config_servers      = [ {server = "0.centos.pool.ntp.org", options = "iburst"}, {server = "1.centos.pool.ntp.org", options = "iburst"} ]

#setup_squid_proxy          = false

## N/A when `setup_squid_proxy = true`, set `setup_squid_proxy = false` when using external proxy.
#proxy                      = {server = "hostname_or_ip", port = "3128", user = "pxuser", password = "pxpassword"}


#storage_type               = "nfs"
#volume_size                = "300"    #Value in GB
#volume_shareable           = false

#upgrade_image              = "" #quay.io/openshift-release-dev/ocp-release@sha256:xyz.."
#upgrade_version            = ""
#upgrade_pause_time         = "70"
#upgrade_delay_time         = "600"

#eus_upgrade_version        = ""
#eus_upgrade_channel        = ""  #(stable-4.x, fast-4.x, candidate-4.x, eus-4.x) eg. stable-4.11
#eus_upgrade_image          = ""  #(quay.io/openshift-release-dev/ocp-release@sha256:xyz..)
#eus_upstream               = ""  #https://ppc64le.ocp.releases.ci.openshift.org/graph

#ibm_cloud_dl_endpoint_net_cidr = ""  #Set this to IBM Cloud DirectLink endpoint network cidr eg. 10.0.0.0/8
#ibm_cloud_http_proxy = ""            #Set this to IBM Cloud http/squid proxy eg. http://10.166.13.64:3128

#cni_network_provider       = "OVNKubernetes"

#setup_snat                 = true

#csi_driver_install         = false  #Set to true to enable installation of csi-driver.

#luks_compliant              = false # Set it true if you prefer to use LUKS enable in OCP deployment
#luks_config                 = [ { thumbprint = "", url = "" }, { thumbprint = "", url = "" }, { thumbprint = "", url = "" } ]
#luks_filesystem_device      = "/dev/mapper/root"  #Set the Path of device to be luks encrypted
#luks_format                 = "xfs"  #Set the Format of the FileSystem to be luks encrypted
#luks_wipe_filesystem         = true  #Configures the FileSystem to be wiped
#luks_device                 = "/dev/disk/by-partlabel/root"  #Set the Path of luks encrypted partition
#luks_label                  = "luks-root"  #Set the value for user label of luks encrpted partition
#luks_options                = ["--cipher", "aes-cbc-essiv:sha256"]  #Set List of luks options for the luks encryption
#luks_wipe_volume             = true  #Configures the luks encrypted partition to be wiped
#luks_name                   = "root" #Set the value for the user label of Filesystem to be luks encrypted

#kdump_enable              = false # Set to true to enable the kdump on Cluster Nodes
#kdump_commandline_remove  = "hugepages hugepagesz slub_debug quiet log_buf_len swiotlb" # This option removes arguments from the current kdump command line
#kdump_commandline_append  = "irqpoll maxcpus=1 reset_devices cgroup_disable=memory mce=off numa=off udev.children-max=2 panic=10 rootflags=nofail acpi_no_memhotplug transparent_hugepage=never nokaslr novmcoredd hest_disable srcutree.big_cpu_lim=0" #This option appends arguments to the current kdump command line
#kdump_kexec_args          = "-s" #For adding any extra argument to pass to kexec command
#kdump_img                 = "vmlinuz" #For specifying image other than default kernel image
#kdump_log_path            = "/var/crash" #The file system path in which the kdump saves the vmcore file
#kdump_crash_kernel_memory = "2G-4G:384M,4G-16G:512M,16G-64G:1G,64G-128G:2G,128G-:4G" #The crashkernel memory reservation for kdump occurs during the system boot
