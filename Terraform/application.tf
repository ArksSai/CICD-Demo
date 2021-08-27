module "application-server" {
  source = "./application-server"

  ami-id = "ami-018495209bcc30f11"
  iam-instance-profile = aws_iam_instance_profile.simple-web-app.id
  key-pair = aws_key_pair.simple-web-app-key.key_name
  name = "Simple Web App"
  device-index = 0
  network-interface-id = aws_network_interface.simple-web-app.id
  //repository-url = "repo URL"
  repository-url = aws_ecr_repository.simple-web-app.repository_url
}