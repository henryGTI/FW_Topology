# 🔐 FW_Topology Network Lab

이 프로젝트는 EVE-NG 또는 실제 네트워크 실습을 위한 **방화벽 중심의 네트워크 토폴로지 구성 예시**입니다.

---

## 🖼️ 네트워크 토폴로지 이미지

![image](https://github.com/user-attachments/assets/6a095df3-8eb8-41aa-b895-460b7652a65d)

## 📦 구성 디렉토리

- `FireWall_1/`: Server_1, Server_2, PC와 연결된 **메인 방화벽**
- `FireWall_2/`: Server_3과 연결된 **분리된 망의 방화벽**
- `Server_1/`, `Server_2/`, `Server_3/`: 각 방화벽 인터페이스에 연결된 서버
- `pc/`: 내부 사용자 단말 (eth3 연결)

---

## 🗺️ 네트워크 구성 예시 (보안 처리된 임의 IP)

| 구간                 | Interface | 방화벽 IP         | 대상 서버/PC IP      |
|----------------------|-----------|--------------------|------------------------|
| FireWall_1 ↔ Server_1 | eth1      | 100.100.100.1/30   | 100.100.100.2/30       |
| FireWall_1 ↔ Server_2 | eth2      | 203.0.113.1/29     | 203.0.113.2/29         |
| FireWall_1 ↔ PC       | eth3      | 10.10.10.1/26      | 10.10.10.2/26          |
| FireWall_2 ↔ Server_3 | 내부      | 198.51.100.1/24    | 198.51.100.2/24        |

> **참고:** 위 IP들은 보안 목적으로 문서/실습용으로 예약된 예제 대역입니다.

---

## 📁 구성 예시 (디렉토리 트리)

```
FW_Topology/
├── FireWall_1/
│   └── Interfaces/
│      ├── eth1/
│      ├── eth2/
│      └── eth3/
│   
├── FireWall_2/
│   └── Interfaces/
│   
├── Server_1/
├── Server_2/
├── Server_3/
└── pc/
```

---

## 📌 사용 목적

- **AhnLab TrusGuard 방화벽 구성 실습**
- **RDP, NAT, ACL, 정책 기반 라우팅 학습**
- 실무 보안망 구성과 **망 분리/정책 적용 연습**
- 네트워크 자동화 테스트 기반 디렉토리 관리

---

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

