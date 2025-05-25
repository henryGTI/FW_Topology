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

## ☁️ AWS 적용 진행사항

기존 온프레미스 기반 방화벽 토폴로지를 AWS 인프라로 확장하여 Terraform 기반으로 자동화 구성하였습니다.

### ✅ 주요 구성

- **VPC 모듈 구성**: CIDR 및 DNS 설정 포함
- **EC2 인스턴스 모듈화**: firewall, server, pc 단위 분리 배포
- **IAM 사용자 모듈화**: 단일 사용자 리소스 포함
- **NAT Gateway 모듈화**: EIP 및 퍼블릭 서브넷 연계
- **토폴로지 모듈화**: 방화벽, 서버, PC 리소스를 독립적으로 관리
- **단일 Subnet/VPC 공유** 구조 (network 모듈에서 관리)

---

### 📦 디렉토리 구조

```
aws/
├── main.tf                 # 전체 인프라 통합 구성
├── terraform.tfvars        # 변수 정의 (현재 사용 안 함)
├── deploy.ps1 / destroy.ps1 # 자동 배포 및 제거 스크립트
├── modules/                # 재사용 가능한 공통 모듈
│   └── vpc, ec2, iam, nat
└── topology/               # 논리적 네트워크 토폴로지 단위
    └── firewall, server, pc, network
```

---

### 🚀 배포 명령어

```powershell
# 초기화 및 배포
cd aws
terraform init
terraform apply -auto-approve

# 제거
terraform destroy -auto-approve
```

---

### 🔐 향후 고려사항

- 보안 그룹 상세 정책 구성 (RDP/SSH/HTTP 제한)
- 서브넷을 public/private 구간으로 나누어 라우팅 제어
- EC2 → AWS WAF 또는 ALB로 확장 가능성 고려
- GitHub Actions 연동하여 배포 자동화 예정

  ---

## 🔐 보안 그룹 설정 정책 (모든 인스턴스 공통 적용)

다음 보안 그룹 정책이 모든 EC2 리소스에 공통으로 적용되어 있습니다.

### ✅ 인바운드 허용 규칙

| 포트 | 프로토콜 | 허용 CIDR          | 설명                    |
|------|----------|--------------------|-------------------------|
| 3389 | TCP      | 203.0.113.10/32    | RDP (원격 데스크탑 접속 허용) |
| 22   | TCP      | 10.0.1.100/32      | SSH (Jump Host에서만 허용)   |
| 80   | TCP      | 192.168.0.0/16     | HTTP (내부망 웹 접근)        |

### ✅ 아웃바운드 허용 규칙

- **모든 트래픽 허용** (`0.0.0.0/0`)

> ⚠️ 위 정책은 실습 및 테스트용 설정으로, 운영 환경에서는 최소 허용 범위로 제한 필요

