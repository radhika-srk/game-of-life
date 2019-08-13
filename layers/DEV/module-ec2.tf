#module.<MODULE_NAME>.<OUTPUT_NAME>
module "ec2" {
  source = "../../modules/ec2"
  ami= "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  availability_zones = "${var.availability_zones}"
}
resource "null_resource" "test" {
  connection {
      host = "${element(module.ec2.*.public_ip, 0)}"
      user        = "ubuntu"
    private_key = "${file(vksonata.pem)}"
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

