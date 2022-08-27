# 프로젝트 - IaC를 이용해 AWS EC2 인스턴스에 Wordpress CMS 배포하기

## 0. 시나리오 - 목표

- Ansible을 이용해 Wordpress CMS를 설치하는 Playbook을 작성한다.
- Packer로 Ansible Playbook을 실행하는 HCL을 작성하고 AWS AMI 이미지를 생성한다.
- Terraform으로 Packer를 통해 생성한 AWS AMI 이미지를 기반으로 하는 AWS EC2 인스턴스와 관련 리소스를 생성한다.

## 1. Wordpress CMS 설치 및 구성

Ansible Playbook을 작성하기 전 Wordpress CMS를 설치하는 방법을 정리하고, 이를 바탕으로  Ansible Playbook에 사용할 역할 및 작업을 생각해본다.

### 1) 의존성 패키지 설치

Apache, PHP, MySQL 관련 패키지 설치

```console
$ 
```

### 2) Wordpress 설치

Wordpress 설치를 위한 `/srv/www` 디렉토리 생성

```console
$ 
```

디렉토리 소유자는 Apache 사용자인 `www-data`로 설정

```console
$ 
```

`wordpress.org`에서 Wordpress 소스 다운로드 후 설치

```console
$ 
```

### 3) Wordpress를 위한 Apache 구성

Wordpress 애플리케이션을 위한 Apache 가상 호스트 구성

`/etc/apache2/sites-available/wordpress.conf`

```apache

```

가상호스트 활성화

```console
$ 
```

Apache Rewrite 모듈 활성화

```console
$ 
```

테스트 페이지 설정 비활성화

```console
$ 
```

Apache 서비스 리로드

```console
$ 
```

### 4) 데이터베이스 구성

MySQL 데이터베이스 접속

```console
$ 
```

`wordpress` 데이터베이스 생성

```console
$ 
```

`wordpress` 사용자 및 패스워드 설정

```console
$ 
```

`wordpress` 사용자에게 `wordpress` 데이터베이스 권한 부여

```console
$ 
```

권한 변경사항 적용

```console
$ 
```

### 5) Wordpress와 데이터베이스 연결 구성

Wordpress 설정파일 구성

`/srv/www/wordpress/wp-config-sample.php` 파일을 `wp-config-php`로 복사

```console
$ 
```

데이터베이스 이름, 데이터베이스 사용자, 데이터베이스 패스워드 변경

`/srv/www/wordpress/wp-config.php`

```console
$ 
```

## 2. Wordpress를 배포하기 위한 Ansible Playbook 작성

### 1) 요구사항

- Main Ansible Playbook
- Ansible 역할
  - wordpress 역할
    - 작업: 패키지 설치, 구성파일 복사, 모듈 및 사이트 활성화, 서비스 시작
    - 핸들러: 모듈 및 사이트 활성화, 서비스 재시작
    - 변수: 데이터베이스명, 데이터베이스 사용자, 데이터베이스 패스워드(암호화) 등
    - 파일: 구성파일
  - mysql 역할
    - 작업: 패키지 설치, 데이터베이스 생성, 사용자 생성, 사용자 권한 부여, 구성파일 복사(위임 또는 wordpress에서 작업 가능), 서비스 시작
    - 핸들러: 서비스 재시작
    - 변수: 데이터베이스명, 데이터베이스 사용자, 데이터베이스 패스워드(암호화) 등
    - 파일: 구성파일

### 2) Ansible Playbook

```yaml
<Paste of Your Code>
```

## 3. Pakcer와 Ansible Playbook을 위한 AWS AMI 생성

### 1) 요구사항

- Wordpress를 배포하기 위한 Ansible Playbook
- AWS AMI 이미지를 위한 Packer HCL 코드

### 2) Packer HCL

```terraform
<Paste of Your Code>
```

## 4. Terraform과 Packer로 생성한 AWS AMI 이미지로 AWS EC2 인스턴스 배포

### 1) 요구사항

- Packer로 생성한 AWS AMI 이미지
- AWS EC2 인스턴스 배포를 위한 Terraform HCL 코드
  - VPC, Subnet 등 네트워크 리소스
  - EC2 인스턴스, SSH 키, 보안 그룹 등 리소스

### 2) Terraform HCL

```terraform
<Paste of Your Code> 
```
