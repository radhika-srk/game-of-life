#module.<MODULE_NAME>.<OUTPUT_NAME>#module.<MODULE_NAME>.<OUTPUT_NAME>
module "ec2" {
  source = "../../modules/ec2"
  ami= "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  availability_zones = "${var.availability_zones}"
}
data "aws_instance" "test" {
  #instance_id = "${module.ec2.terraformmachine.id}"
filter {
    name   = "tag:Name"
    values = ["DEV"]
  }
depends_on = [module.ec2]
}
output "aws_instance_public_ip"{
    value = "${data.aws_instance.test.public_ip}"
}
resource "null_resource" "testvk" {
  connection {
  #    host = "${element(module.ec2.terraformmachine.public_ip, 0)}"
      host = "${data.aws_instance.test.public_ip}"
     user        = "ubuntu"
    private_key = "${file("./vksonata.pem")}"
  }
  provisioner "remote-exec" {
    inline = [
        "sudo apt-get update -y",
        "sleep 10",
        "sudo apt-get update -y",
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }
}

