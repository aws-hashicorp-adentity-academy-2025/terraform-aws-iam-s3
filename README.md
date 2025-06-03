# HCP Terraform 데모용 AWS S3 ReadOnly IAM 모듈

## 개요

이 모듈은 HCP Terraform 데모 환경에서 사용할 AWS S3 읽기 전용(ReadOnly) 권한을 가진 IAM 사용자를 생성합니다. 
Terraform을 통해 S3 리소스에 대한 읽기 권한만을 부여할 수 있도록 설계되었습니다.

## 사용 방법

1. 이 모듈을 Terraform 구성에 포함시킵니다.
2. 필요한 경우 변수 값을 수정하여 사용자의 이름 등을 커스터마이즈할 수 있습니다.

```hcl
module "iam_s3_readonly" {
  source = "./terraform_aws_iam_s3"
  # 필요한 경우 변수 추가
}
```

## 주요 기능

- AWS S3 읽기 전용 IAM 사용자 생성
- AmazonS3ReadOnlyAccess 정책 부여

## 사전 조건

- AWS 계정 및 접근 권한
- Terraform 설치 및 환경 구성

## 적용 방법

1. Terraform 초기화  
   ```
   terraform init
   ```
2. Terraform 계획 확인  
   ```
   terraform plan
   ```
3. Terraform 적용  
   ```
   terraform apply
   ```

## 참고 사항

- 이 모듈은 데모 및 테스트 용도로만 사용하시기 바랍니다.
- 실제 운영 환경에서는 최소 권한 원칙(Least Privilege Principle)을 준수하여 권한을 설정하세요.
