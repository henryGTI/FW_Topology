🔐 FW_Topology Network Lab
이 프로젝트는 EVE-NG 또는 실제 네트워크 실습을 위한 방화벽 중심의 네트워크 토폴로지 구성 예시입니다.

📦 구성 디렉토리
FireWall_1/: Server_1, Server_2, PC와 연결된 메인 방화벽

FireWall_2/: Server_3과 연결된 별도 분리망 방화벽

Server_1/, Server_2/, Server_3/: 각각 방화벽 인터페이스에 연결된 서버

pc/: 내부 사용자 단말 (eth3 연결)

🗺️ 네트워크 구성 예시 (보안 처리된 임의 IP)
구간	Interface	IP 주소	대상
FireWall_1 ↔ Server_1	eth1	100.100.100.1/30	100.100.100.2/30
FireWall_1 ↔ Server_2	eth2	203.0.113.1/29	203.0.113.2/29
FireWall_1 ↔ PC	eth3	10.10.10.1/26	10.10.10.2/26
FireWall_2 ↔ Server_3	내부	198.51.100.1/24	198.51.100.2/24

📁 구성 예시
arduino
복사
편집
FW_Topology/
├── FireWall_1/
│   ├── Interfaces/
│   │   ├── eth1/
│   │   ├── eth2/
│   │   └── eth3/
│   └── Server/
├── FireWall_2/
│   ├── Interfaces/
│   └── Server/
├── Server_1/
├── Server_2/
├── Server_3/
└── pc/
📌 사용 목적
TrusGuard CLI/GUI 정책 실습

RDP, NAT, ACL, 정책기반 라우팅 실습

실전 네트워크 보안 구간 분리 구성 연습

