<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- loginCheck 결과, 1= id/pw 알맞게 입력--> <!--sign=1 신규가입 -->
<c:choose>
	<c:when test="${result ==1 }">
		<c:if test="${sign ==1 }">  
			<script>
				alert("회원가입 성공!");
				alert("아이디 찾기 코드 번호는 ${code} 입니다. 이 코드는 내 정보에서 확인 하실수 있습니다.");
				location= "/eatoday/homepage/index.eat";
			</script>
		</c:if>
		<script>
			alert("${id}님 환영합니다.");
			location= "/eatoday/homepage/index.eat";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			alert("id/pw를 확인해주십시오.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>