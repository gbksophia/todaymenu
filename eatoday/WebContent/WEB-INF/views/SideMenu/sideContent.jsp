<%-- 레이어팝업창 내용 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#css_tabs {
	font-family: 'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum',
		'돋움', sans-serif
}

/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1),
	#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2),
	#css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3)
	{
	display: none
}

#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked 
	~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3)
	{
	display: block
}

/* 라벨 기본 스타일 지정 */
#css_tabs>label {
	display: inline-block;
	font-variant: small-caps;
	font-size: .9em;
	padding: 5px;
	text-align: center;
	width: 20%;
	line-height: 1.8em;
	font-weight: 700;
	border-radius: 3px 3px 0 0;
	background: #eee;
	color: #777;
	border: 1px solid #ccc;
	border-width: 1px 1px 0
}

#css_tabs>label:hover {
	cursor: pointer
}

#css_tabs label[for=tab1] {
	margin-left: 1.5em
}

/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs>label[for=tab1]:hover
	{
	background: tomato;
	color: #fff
}

#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs>label[for=tab2]:hover
	{
	background: gold;
	color: #fff
}

#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs>label[for=tab3]:hover
	{
	background: green;
	color: #fff
}

/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content
	{
	padding: 2em;
	border: 1px solid #ddd;
	width: 80%;
	height: 80%
}
</style>
</head>
<body>
	<div id="css_tabs">
		<!-- 라디오 버튼 -->
		<input id="tab1" type="radio" name="tab" checked="checked" /> <input
			id="tab2" type="radio" name="tab" /> <input id="tab3" type="radio"
			name="tab" />

		<!-- 라벨 : 화면에 표시되는 탭 제목 -->
		<label for="tab1">서비스 소개</label> <label for="tab2">FAQ 수강생</label> <label
			for="tab3">FAQ 튜터</label>

		<!-- 탭 내용 : 탭 제목을 선택했을 때 표시되는 본문 -->
		<div class="tab1_content">
			<p>
			<p>1. 쉘위는 무엇인가요?</p>
			<p>쉘위는 P2P 재능 공유 온라인 플랫폼입니다. 쉘위에서는 자신의 재능을 강의로 등록하여 수업을 진행할 수 있고,
				다른 사람의 재능강의를 들을 수도 있습니다.</p>
			<br />
			<hr>
			<p>2. 쉘위에는 무엇이 있나요?</p>
			<p>다양한 사람, 재능, 이야기가 존재합니다. 이외에도 수많은 사람들이 서로의 재능을 공유하고 있습니다.:)</p>
			<br />
			<hr>
			<p>3. 믿을 수 있는 강의 일까요?</p>
			<p>강의에 등록된 후기와 별점을 확인해보세요 :)</p>
			<br />
		</div>
		<div class="tab2_content">

			<p>1. 수업 신청 후 절차가 어떻게 되나요</p>
			<p>수업신청은 " 수업신청서 발급 >> 결제완료 >> 튜터님의 수업승인 >> 수업매칭" 으로 절차가 진행됩니다!
				튜터님과 연결되시면 일정을 조율하여 첫 수업날짜를 잡아보세요</p>
			<br />
			<hr>

			<p>2. 수업료는 어떻게 결제하나요?</p>
			<p>원데이 수업 : 전체수업료를 한번에 결제하는 전체결제로 진행이 됩니다 2회차 이상의 수업 : 1) 전체수업료를
				한번에 결제하기(전체결제) : 탈잉에서 전체수업료를 가지고 있다가 첫 수업이 마친 후 탈잉 수수료인 1시간 수업료를 제외한
				나머지 금액을 튜터님께 돌려드리고 있어요 2) 1시간의 수업료를 예약금으로 결제하기 : 튜터분과 첫 수업을 진행하신 다음,
				향후 수업료는 튜터에게 직접 전달해주시면 됩니다. (수업료는 계좌이체 등으로 송금 근거를 남겨 두시길 권장합니다.)</p>
			<br />
			<hr>

			<p>3. 결제방식은 어떻게 되나요?</p>
			<p>원데이 수업 : 앱과 PC에서 카드/무통장으로 결제하실 수 있어요 2회차 이상의 수업 : 앱, PC(동일) -
				수업료 전체결제 / 1시간의 수업료를 예약금으로 카드/무통장으로 결제하실 수 있어요</p>
			<br />
			<hr>

		</div>
		<div class="tab3_content">
			<p>1.수업 등록은 아무나 할 수 있나요?</p>
			<p>누구나 수업 등록을 하실 수 있습니다. 단, 신분증 / 대학교 / 대학원인증 중 1개의 인증으로 신분인증을
				해주셔야 합니다. 또한 튜터로서 활동하실때 수강생분들과 연락하실 연락처 인증을 해주셔야 합니다. 수업 등록 후 관리자의
				최종 승인이 있어야 홈페이지에 게시되고 신청을 받을 수 있습니다. 관리자는 등록된 수업내용, 이미지, 튜터 프로필 등의
				적절성, 사실확인을 검증한 이후 최종 승인을 해드립니다.</p>
			<br />
			<hr>

			<p>2. 수업등록은 어떻게 하나요?</p>
			<p>수업등록은 앱과 PC(웹)에서 모두 가능합니다. 앱에서 등록 할 경우 : "더보기 >> 튜터모드로 >> 수업관리
				>> 수업등록"의 절차를 통해 수업을 등록하실 수 있습니다. PC(웹)에서 등록 할 경우 : " 튜터등록 >> 튜터
				등록하기 >> 재능 등록 등록하기"의 절차를 통해 수업을 등록하실 수 있습니다.</p>
			<br />
			<hr>

			<p>3. 수업은 어디서 진행하면 되나요?</p>
			<p>기본적으로 튜터님께서 수업소개서에 설정해주신 곳(EX)카페, 스터디룸, 튜터님 개인 스튜디오 등)에서 수업을
				진행해주시면 되세요. 자유롭게 장소를 정하여 수업을 하는 것이 탈잉의 장점이니까요.</p>
			<br />
		</div>
	</div>
</body>
</html>