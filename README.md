# AWS Terraform Remote Backend Bootstrap

This project provisions the essential AWS infrastructure required to host Terraform state files remotely. By using this setup, you ensure that your infrastructure state is stored securely in S3 with concurrent modification protection via DynamoDB state locking.

## 🏗️ Resources Provisioned

- **S3 Bucket (`s3.tf`):** Provides durable, versioned storage for Terraform state files.
- **DynamoDB Table (`dynamodb.tf`):** Enables state locking to prevent multiple users from running Terraform simultaneously on the same state.
- **Provider Config (`providers.tf`):** Configures the AWS provider.
- **Terraform Settings (`terraform.tf`):** Defines required versions and initial backend settings.

## 🛠️ Prerequisites

- **Terraform CLI:** Installed locally.
- **AWS Credentials:** Already configured on your local machine (via `~/.aws/credentials` or environment variables).

## 🚀 Getting Started (Initial Setup)

Run these commands within this directory to bootstrap your remote backend:

1. **Initialize Terraform:**
   ```bash
   terraform init
    ```

2. **Deploy Infrastructure:**
    ```bash
    terraform apply
    ```

## 🔗 How to use this in other Projects
1. **Identify your Resource Names**
Note the names of the S3 Bucket and DynamoDB Table created by this project.

2. **Configure the Backend**
In your other project's root directory, create or update a file (usually main.tf or backend.tf) with the following block:

```bash
terraform {
  backend "s3" {
    bucket         = "your-unique-s3-bucket-name"
    key            = "project-name/terraform.tfstate" # Path within the bucket
    region         = "your-aws-region"                # e.g., ap-south-1
    dynamodb_table = "your-dynamodb-table-name"
    encrypt        = true
  }
}
```

3. **Initialize the Remote State**
Run the following command in that new project:
```bash
terraform init
```

Terraform will detect the backend configuration and ask if you want to migrate your local state to S3. Type yes.