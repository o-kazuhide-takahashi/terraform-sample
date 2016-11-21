
## base name
#variable "basename" { type = "string" default = "simple" }

## resion and az(availavility zone)
variable "region" { type = "string" default = "ap-northeast-1" description = "リージョン指定" }

# CentOS 7 Officeial AMI (region tokyo) verion Release:1602 2016/02/26
#   https://aws.amazon.com/marketplace/pp/B00O7WM7QW
# Region-ID/AMI-ID
#   Asia Pacific (Mumbai) ami-95cda6fa
#   EU (Ireland) ami-7abd0209
#   Asia Pacific (Singapore) ami-f068a193
#   Asia Pacific (Sydney) ami-fedafc9d
#   Asia Pacific (Seoul) ami-c74789a9
#   EU (Frankfurt) ami-9bf712f4
#   Asia Pacific (Tokyo) ami-eec1c380
#   US East (N. Virginia) ami-6d1c2007
#   US East (Ohio) ami-6a2d760f
#   US West (N. California) ami-af4333cf
#   South America (Sao Paulo) ami-26b93b4a
#   US West (Oregon) ami-d2c924b2
variable "ami" { type = "string" default = "ami-eec1c380" } # region : Tokyo

# for region : Tokyo
variable "az" { type = "string" default = "ap-northeast-1a" }
variable "aza" { type = "string" default = "ap-northeast-1a" }
variable "azc" { type = "string" default = "ap-northeast-1c" }

## for ec2 common setting
##   base ebs (boot / root_block_device)
variable "root_ebs_type" { default = "gp2" }
variable "root_ebs_size" { default = 8 }
##   extra ebs
variable "ebs_type" { default = "gp2" }
variable "ebs_size" { default = 8 }
variable "ebs_device" { default = "/dev/sdf" }
