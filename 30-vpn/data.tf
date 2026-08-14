data "aws_ami" "openvpn" {
    owners = ["679593333241"]  ## VPN Owner ID
    most_recent = true

    filter {
      name = "name"
      values = ["OpenVPN Access Server Community Image-3b5882c4-551b-43fa-acfe-*"]
    }

    # filter {
    #   name = "root-device-type"
    #   values = ["ebs"]
    # }

    # filter {
    #   name = "virtualization-type"
    #   values = ["hvm"]
    # }
}

output "ami_id" {
    value = data.aws_ami.openvpn.id
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project}/${var.environment}/vpn_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}