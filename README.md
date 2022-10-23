# 프로젝트 제목

[프로젝트 홈페이지 - https://koposoftware.github.io/finalproject_template/](https://koposoftware.github.io/finalproject_template/)

# 1. 프로젝트 소개
## 1) 프로젝트 개요
## 2) 프로젝트 목적
## 3) 프로젝트 기대효과
<img src="/img_HanaBizUp/anticipated_result.png"/><br>
## 4) 프로젝트 수행기간


# 2. 프로젝트 구성
## 1) 서비스 아키텍쳐
<img src="/img_HanaBizUp/service_architecture.png"/><br>

## 2) 시스템 아키텍쳐
<img src="/img_HanaBizUp/system_architecture.png"/><br>

## 3) ERD

## 4) 주요 기능
### Ⅰ. 매출 및 비용 관리 & 회계분개
### **1. 기업에서 발생한 모든 거래내용 기록** <br>
-  전문 회계지식이 없어도 기업의 거래내역을 **회계분개**할 수 있도록 입력폼 설계<br>
<sub>* 회계분개: 거래에 알맞은 회계 계정과목을 선택하여 금액과 함께 기록하는 절차</sub><br><br>
- **매출, 생산비용, 판매비와 관리비, 자산** 항목 입력 가능<br>
ex) 매출발생 시 상품명, 판매일자(인도일자), 판매금액과 수량, 매출액 지급방식, 비고를 입력하면 거래상황에 맞는 차변과 대변의 회계코드를 찾아 회계분개 후 총계정원장에 저장<br>
<sub>* 차변과 대변: 복식 회계에서의 양 변을 말하는 것으로 좌측이 차변(debit) 우측이 대변(credit)</sub><br><br>
<img src="/img_HanaBizUp/fn4.png" width="800" /><br>
<br>

### **2. 회계 계정과목 검색** <br>
- 전문 회계지식이 없는 이용자를 위한 계정과목 검색 기능<br>
ex) 거래처와 회식한 경우 그 금액은 판매관리비의 접대비, 주식을 매수한 경우 일반적으로 단기금융상품으로 분류<br><br>
<img src="/img_HanaBizUp/fn3.png" width="800"/><br><br>

### **3. 월별 판매 리포트 제공**<br>
- 상품을 등록하고 매출/생산 내역을 입력하면 회계분개가 진행되는 동시에  각 상품의 판매 및 생산 정보를 상품 로그 TABLE에 저장, 향후 월별 판매현황 리포트에서 관련 통계 확인 가능
<br><br><br>

### Ⅱ. 재무제표 도출
<img src="/img_HanaBizUp/fn2.png" width="800" /><br>
### **1. 합계잔액시산표 도출**<br>
- 일정기간 동안 발생한 모든 거래의 차변 및 대변의 합계와 잔액을 계산해 합계잔액시산표를 도출<br><br>
- 차변과 대변의 잔액(합계)이 일치해야 올바른 합계잔액시산표 **(대차평균의 원리)** .<br><br>
**(필요성)** 합계잔액시산표는 일정 기간동안 발생한 모든 회계 계정과목의 합계와 잔액을 나타낸 표로, 계정과목의 흐름을 파악하고 향후 재무제표에 문제가 생겼을 때 어디서 문제가 발생했는지 추적하는데 활용<br><br>
### **2. 손익계산서 도출**<br>
- 회계항목 중 수익과 비용 항목을 최종 결산한 손익계산서 도출<br>
<sub> * 당기순이익 = (매출 – 매출원가) – 판매관리비 – 영업외수익 및 비용 – 법인세비용</sub>
<br><br>
### **3. 재무상태표 도출**<br>
- 손익계산서의 당기순이익을 자본의 이익잉여금 항목으로 계상한 후 최종 재무상태표 도출<br><br>
- **자산 총계와 부채 및 자본 총계가 일치해야 올바른 재무상태표** <br><br>
<br><br>

### Ⅲ. 재무분석
### **1. 재무제표 통계 리포트**<br>
- 도출된 재무제표를 바탕으로 각종 재무지표를 계산해 기업의 안정성 및 성장성 진단<br>
<sub>* 유동비율 = 유동자산/유동부채로 높을수록 기업의 유동성이 양호함 의미</sub><br>
<sub>* 부채비율 = 부채총계/자기자본으로 낮을수록 기업의 안정성이 높음 의미</sub><br>
<sub>* 종자산수익률 = 당기순이익/자기자본으로 기업가가 주어진 자산을 얼마나 효율적으로 활용하여 이익을 얻었는가를 나타냄</sub>
<br><br>

### **2. 기업가치 계산**<br>
- 도출된 재무제표를 바탕으로 기업잉여현금흐름 모형에 근거한 기업가치 계산<br><br>
- 매기 감가상각액만큼 재투자되고 안정성장률 만큼 영구히 성장한다고 가정(상한)<br>
<sub>* 기업가치 하한의 경우 매기 감가상각액만큼 재투자된다고 가정</sub><br><br>
<img src="/img_HanaBizUp/fn5.png" width="650"/><br>
<br><br>


## 5) 사용기술


# 3. 프로젝트 결과
프로젝트 결과를 추가하세요. 발표자료. 시연동영상을 추가하세요.

## 발표 ppt 


## 시연 동영상 

  <iframe width="424" height="238" src="https://www.youtube.com/embed/reOGfxYJre0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# 4. 기타
그외 프로젝트를 더욱 설명할수 있는 것들을 추가하세요
 
# 5. 본인 소개

본인 소개를 추가하세요

|이름 |고길동|![gdKO](/gdko.jpg)|
|연락처 | gdko(@)kopo.ac.kr|
|skill set| Frontend - HTML, CSS, Javascript|
| | Backend - Java, Spring, Oracle|
|자격증| 20xx년 정보처리기사 |
|| 20xx년 빅데이터분석기사 |
|| 20xx년 SQLD |
|| 20xx년 ADsP |
|수상| 20xx년 ICT 멘토링 프로젝트 대상 수상 (과학기술정보통신부 지원)  |
| | 20xx년 한국폴리텍대학 벤처창업아이템경진대회 대상 수상 (고용노동부 후원)  |
| | 20xx년 금융데이터경진대회 금상 수상|
| | 20xx년 대학생 논문 경진대회 은상 수상|
|특기사항|  TOEIC 990 |
||  리니지 만랩 |


