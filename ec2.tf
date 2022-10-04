module "web" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["web1", "three"])

  name = "instance-${each.key}"

  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.micro"
  key_name               = "aws_key_pair"
  monitoring             = true
  vpc_security_group_ids = ["sg-0a714c2ca8351d8fb"]
  subnet_id              = "subnet-08ce9d34644892619"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}