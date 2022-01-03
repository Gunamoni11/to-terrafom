node('master'){
    stage('pulling'){
       git branch: 'main', url: 'https://github.com/Gunamoni11/to-terrafom.git'
        sh "ls"
    }
    stage('ec2 launching'){
         sh "terraform init"
        sh "terraform plan"
        sh "terraform apply -auto-approve"
    }
    stage('pushing data'){
        sh "git add terraform.tfstate"
        sh "git commit -m 'terraform'"
        sh "git remote set-url origin https://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@github.com/Gunamoni11/to-terrafom.git"
        sh "git push --set-upstream origin main"
       }
    }


provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "myec2" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  subnet_id   = "subnet-0ad08acb398ada09d"
  key_name = "sshkey1"
  security_groups = ["sg-017c097bb1674f881"]
  tags = {
    Name = "Ec2tf"
  }
}
