stage('Infrastructure Provisioning') {
    steps {
        script {
            // 1. Get IPs from Terraform
            def masterIP = sh(script: "cd infra/terraform && terraform output -raw master_ip", returnStdout: true).trim()
            def workerIP = sh(script: "cd infra/terraform && terraform output -raw worker_ip", returnStdout: true).trim()

            // 2. Update Inventory File dynamically
            sh "sed -i 's/<MASTER_IP>/${masterIP}/g' infra/ansible/inventory.ini"
            sh "sed -i 's/<WORKER_IP>/${workerIP}/g' infra/ansible/inventory.ini"

            // 3. Run Ansible Playbook
            sh "ansible-playbook -i infra/ansible/inventory.ini infra/ansible/playbook.yml"
        }
    }
}