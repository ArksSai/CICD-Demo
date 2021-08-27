module "jenkins" {
  source ="./jenkins-server"

  ami-id = "ami-018495209bcc30f11"
  iam-instance-profile = aws_iam_instance_profile.jenkins.name
  key-pair = aws_key_pair.jenkins-key.key_name
  name = "jenkins"
  device-index = 0
  network-interface-id = aws_network_interface.jenkins.id
  repository-url = "repo URL"
}