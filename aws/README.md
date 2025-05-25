# ☁️ AWS Terraform 구조 적용 (모듈화)

이 디렉토리는 기존 방화벽 토폴로지를 AWS 인프라로 확장하여 구성한 Terraform 기반 프로젝트입니다.

## ✅ 적용 대상 컴포넌트

- **VPC**: 퍼블릭/프라이빗 서브넷, IGW, RT 구성
- **EC2**: 서버 또는 보안 장비 역할 인스턴스 구성
- **IAM**: 사용자/역할/정책의 모듈화된 권한 관리
- **NAT**: 프라이빗 네트워크를 위한 NAT Gateway 구성

## 🗂️ 디렉토리 구조

```
FW_Topology/
└── aws/
    ├── modules/
    │   ├── vpc/
    │   ├── ec2/
    │   ├── iam/
    │   └── nat/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```

## 🚀 명령어 예시

```bash
terraform init
terraform plan
terraform apply
```

## 🔐 보안 유의사항

- AWS credentials는 Git에 절대 커밋하지 않도록 `.gitignore` 사용
- `.tfvars`, `.aws`, `*.pem` 등 민감 파일은 예외 처리

## 📌 향후 확장 계획

- 모듈 재사용성 강화
- GitHub Actions 기반 IaC 테스트 자동화
