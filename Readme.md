# S3 Static Website (Terraform)

## Overview

This project demonstrates how to deploy a static website hosted on Amazon S3 using Terraform. The setup includes creating an S3 bucket, configuring it for public access, applying a bucket policy to restrict write access, and uploading the website files (`index.html` and `error.html`) to the bucket.

## Features

- Creation of an S3 bucket with a unique name.
- Configuration of public access for the bucket to allow read-only access.
- Implementation of an S3 bucket policy to restrict write access while allowing public read access.
- Configuration of the S3 bucket as a static website.
- Uploading `index.html` and `error.html` files to the bucket using Terraform.

## Prerequisites

- Terraform installed on your local machine (version 1.0.0 or later).
- AWS CLI configured with appropriate credentials and permissions.
- An AWS account with access to create S3 buckets.

## Steps to Follow

1. **Create the S3 Bucket**:
   - Use Terraform to create an S3 bucket with a unique name.

2. **Configure Public Access**:
   - Enable public access for the bucket to allow users to access the website files.

3. **Apply a Bucket Policy**:
   - Add a bucket policy to allow public read access (`s3:GetObject`) while restricting write access.

4. **Configure Static Website Hosting**:
   - Set up the S3 bucket to serve as a static website by specifying the `index.html` and `error.html` files.

5. **Upload Website Files**:
   - Use Terraform to upload the `index.html` and `error.html` files to the S3 bucket.

6. **Access the Website**:
   - Use the S3 bucket's website endpoint to access the static website.

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd S3-Static-Website
   ```

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Review the execution plan:

    ```bash
    terraform plan
    ```

4. Apply the configuration to create resources:

    ```bash
    terraform apply -auto-approve
    ```

5. Access the static website using the S3 bucket's website endpoint, which will be displayed in the Terraform output.

6. Destroy the resources to avoid unnecessary costs:

    ```bash
    terraform destroy
    ```

## Project Structure

- provider.tf:  Configures the AWS provider.
- s3.tf: Contains the Terraform configuration for the S3 bucket, bucket policy, and static website hosting.
- index.html: The main HTML file for the static website.
- error.html: The error page for the static website.
- output.tf: Has the configuration for the website endpoint. It stores the website endpoint and shows us in the console.

## Notes

- Ensure the bucket name is globally unique, as S3 bucket names are shared across all AWS accounts.
- Use proper IAM permissions to allow Terraform to create and manage S3 resources.
- Always review the execution plan before applying changes to avoid unintended modifications.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
