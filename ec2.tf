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
