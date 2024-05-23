# terraform_templates




# Terraform
______________________________________________________________________________________________
## Terraform links
1) Modules - https://registry.terraform.io/browse/modules
2) Providers - https://registry.terraform.io/browse/providers
3) Docs = https://developer.hashicorp.com/terraform?product_intent=terraform

______________________________________________________________________________________________
## Terraform installation (preferred):
terraform-CLI | AWS CLI | VS Code Editor | Terraform plugin for VS Code

______________________________________________________________________________________________
## Terraform Workflow and command
terraform init --> terraform validate --> terraform plan --> terraform apply --> terraform destroy
1) terraform init (first command to run other writing a new Terraform configuration) use to initialize a working dir/download providers
2) terraform validate (validate the terraform config files in that respective dir to ensure syntax is valid)
3) terraform plan (show all plan belong to our config file, like all info about instance creating, and so on...)
4) terraform apply (used to apply the changes required to reach the desired state of the configuration)
5) terraform apply auto-approve
6) terraform destroy (using to destroy the Terraform-managed infrastructure/ask to confirm before destroying)
7) terraform fmt (format written files according terraform syntax)
8) terraform console (console for evaluating expressions)
9) terraform output es2_instance_pivateip (output value)
10) terraform output -json

______________________________________________________________________________________________
## Terraform basic preconditions:
1) use default VPC
2) use your region or update it (ensure that is resource is available in your region)
3) check ami
4) verify your AWS Credentials in $Home/.aws/credentials (cat $Home/.aws/credentials)

______________________________________________________________________________________________
## Terraform core commands:
 first step to work with projects in terraform machine
 1) move to working dir (cd /path/to/dir/terraform)
 2) initialize working dir/install hashicorp plugin into working dir to have the opportunity communication (terraform init)
    also after init we download the provider to have the opportunity to communicate with provider through API calls
 3) validate file syntax (terraform validate)
 4) show step to step plan and variables which already in our configure file or will be there (terraform plan)
 5) ask for confirmation and it automatically create infrastructure for it(terraform apply)
 6) delete your instance according our configuration(terraform destroy)

desire/current state - desire(your configuration in file.tf)/current(your resource after terraform apply
#Terraform state commands:

 ______________________________________________________________________________________________
## Terraform configuration syntax:
code stored in .tf or .tf.json file extension
when execute command we need to be in working dir

______________________________________________________________________________________________
## Terraform Top level Blocks:
There 3 type of Blocks (fundamental/variable/calling or referencing)
1) Terraform Settings Block 1
2) Provider Block 1
3) Resource Block 1
4) Input variables Block 2
5) Output variables Block 2
6) Local Values Block 2
7) Data Sources Block 3
8) Modules Block 3

______________________________________________________________________________________________
## Terraform providers
all the time when i do terraforming it, terraform go to terraform registry, download AWS provider, after terraform apply, terraform connect to AWS APIs and create instance or etc
every resource, is implemented by provider
without provider Terraform can't manage any infrastructure
terraform registry

______________________________________________________________________________________________
## Terraform providers
1) Provider requirements
2) provider configuration
3) dependency lock file

______________________________________________________________________________________________
## Multiple providers
we can define multiple configurations for the same provider, and select when we need it

______________________________________________________________________________________________
## Dependency lock file

______________________________________________________________________________________________
## Assign variables/Override variables
1) terraform plan -var="ec2_instance_type=t3.small" -var="ec2_instance_count=1"
2) terraform plan -var="ec2_instance_type=t3.small" -var="ec2_instance_count=1" -out v3plan.out (create plan)
3) terraform apply v3plan.out
4) export TF_VAR_ec2_instance_count=1 (if we terraform plan - terraform will get this var and use it)
5) unset TF_VAR_ec2_instance_count ( don't use environment vars)

______________________________________________________________________________________________
# Terraform Fundamental Blocks
## Terraform Settings Block
configure some behaviors and backend/ specifying required terraform version and provider requirements

______________________________________________________________________________________________
## Terraform Provider Blocks
relies on providers to interact with remote systems/declare providers for Terraform to install providers and use them

______________________________________________________________________________________________
## Terraform Resource Blocks
describe one or more infrastructure objects (need to understand how to declare resources/how terraform handlers resources/how to configure post-resource actions)

______________________________________________________________________________________________
# Resource behavior
1) Create Resource (create resource that exist in the configuration but are not associated with the real infrastructure object in the state
2) Destroy Resource (destroy resources that exist in the state but no longer exist in the configuration)
3) update-inplace Resource (update in-place resources whose arguments have changed)
4) Destroy and re-create (destroy and re-create resources whose arguments have changed but which cannot be updated in-place due to remote API limitations)

______________________________________________________________________________________________
## Resource Meta_Arguments
Meta_Arguments (use with any resource type to change the behavior of the resources
1) depends_on (to handle hidden resource or module dependencies than Terraform can't automatically infer)
2) count (for creating multiple resource instances according to a count)
3) for_each (to create multiple instances according to a map,set of strings)
4) provider (for selecting a non-default provider configuration)
5) lifecycle (standard resource behavior can be altered using special nested lifecycle block within a resource block body)
create_before_destroy (change the behavior steps, default - resource after changes firstly will be destroyed and after in new configured resource will up, if create_before_destroy = true - firstly will create new resource and after it the old will be destroed)
prevent_destroy (if we try destroy resource, resource will not to be destroed) terraform destroy)
ignore-changes (do not detect any sifferent in the current settings and real infra by related arguments)
6) provisioners and connections (extra actions after resource creation (install some app on server or do something on local desktop after resource is created at remote resource)

______________________________________________________________________________________________
# Terraform Variables
1) Input variables  parameters for Terraform module
terraform console functions (length | substr | file)
length("hi") ...output = 2
substr("hello world", 1, 4) ...output "ello"

______________________________________________________________________________________________
## Terraform Local variables
1) Local values can be helpful ti avoid repeating the same values or expressions multiple times in a configuration

______________________________________________________________________________________________
# Terraform Datasources

______________________________________________________________________________________________
## Terraform State
1) Terraform backend (responsible for storing state and providing an API for state locking)
2) Terraform State Storage (aws s3 bucket) - backend place where terraform.tfstate file locate (significant thing for multi-employees)
3) Terraform State Locking (aws DynamoDB) - backend noSQL db used for locked state where update takes place, at this time terraform.tfstate file can't to be updated

______________________________________________________________________________________________
#Terraform state command
1) terraform show - show output from terraform plan but human readable
2) terraform refresh - refresh terraform.tfsate if some changes were updated in aws ui and we need to update or desired state to real state
3) terraform state list - list all resources in terraform.tfsate file without attributes
4) terraform state show - show resources attributes
5) terraform state mv - very dangerous command (move an item and change local terraform resource name)just change state configouration by changing name, IF WE USE plan/apply -resource will be recreated
6) terraform state rm - remove resource from desire state (after in current resource in provider will be working but it can't be managed by terraform)
7) terraform state replace provider - change the provider
8) terraform state pull - download and output the state from remote state
9) terraform state push - push you local terraform.tfstate into remote
10) terraform force-unlock - removes the lock on the state for the current configuration (only remove configuration can be unlock)
11) terraform taint (terraform taint <Resource_NAME>) - auto-mark terraform resource as taint - and this resource will be destroed and recreated during next terraform apply
12) terraform untaint - untaint terraform resource (without manage infrastructure)
13) terraform apply target - used for focusing Terraform's attantion on only a subset of resources

______________________________________________________________________________________________
# Terraform workspaces
local/remote - backend
by default we are working in default workspace
developer working on a complex set of infrastructure changes need to create a new temporary workspace, experiment with it without affecting the default workspace
don't recommend using workspace with huge infra/recomended to use separate configuration dirs
for remote backend when we create new workspace - path to terraform.tfstate (s3/bucket/${bucket-name}/env:/${workspace-name}/workspace/terraform.tfstate)

______________________________________________________________________________________________
## Terraform workspace commands
terraform workspace show - show your current workspace
terraform workspace list - show all workspaces
terraform workspace new - create new workspace
terraform workspace select - change to other workspace
terraform workspace delete - delete workspace (default can't be deleted)

______________________________________________________________________________________________
# Terraform provisioners
use to model specific action on the local machine or on remote machine in order to prepare servers
1) passing data into virtual machines/resource
2) running configurantion mgmt sowtware (chef,ansible)
Types of provisioners:
1) file (copy files/dirs from terraform machine to new machine)
2) remote-exec (invokes a script on a remote resource after it created) can be use ti run conf mgmt tool or bootstrap into cluster
3) local-exec (invokes a local executable after the resource is created on terraform machine)
If povisioners failed - terraform apply failed too (can change it on_failure = continue, default on_failure = fail)
if terraform apply failed (and on_failure = fail) - the resource will be automatically tainted and after second approve resource will be recreated

______________________________________________________________________________________________
## Connection block
Most provisioners require access to remote resource (SSH/WinRM), and expect connection block
Null_resource (if we need to create a chean of action) ex: 1 resource time sleap --- 2 resource timestamp from first resource "
Also reusable every time when terraform apply used

______________________________________________________________________________________________
# Terraform modules
1) Modules - containers for multiple resources that are used together.
every terraform conf has at least one module
there are root modules and child modules
2) Terraform registry - publicly avaliable modules
private/public terraform modules registry
possible to taint specific resource in the module (can't taint all module, need to taint every resource separatly)
terraform get (both init/get command get modules, but best practic is using get, because terraform init also initialize backends and install plugins)

______________________________________________________________________________________________
# Terraform Cloud or Enterprise
Different distributions of the same app
terraform VCS integration (automatically initiate Terraform runs by Git/bitbucket auto action)
Terraform Cloud private module registry - help to share terraform modules accross organization
Terraform Cloud CLI Driven Workflow - uses Terraform's standard CLI tools to execute runs in Terraform Cloud

______________________________________________________________________________________________
# Terraform Cloud Sentinel
Sentinel - not a free tools
Sentinel - is a group of policies (prise/cis/etc.) which help to more easily manage cloud provider
