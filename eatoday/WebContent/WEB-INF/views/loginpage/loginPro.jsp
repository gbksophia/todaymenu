<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- loginCheck ���, 1= id/pw �˸°� �Է�--> <!--sign=1 �ű԰��� -->
<c:choose>
	<c:when test="${result ==1 }">
		<c:if test="${sign ==1 }">  
			<script>
				alert("ȸ������ ����!");
				alert("���̵� ã�� �ڵ� ��ȣ�� ${code} �Դϴ�. �� �ڵ�� �� �������� Ȯ�� �ϽǼ� �ֽ��ϴ�.");
				location= "/eatoday/homepage/index.eat";
			</script>
		</c:if>
		<script>
			alert("${id}�� ȯ���մϴ�.");
			location= "/eatoday/homepage/index.eat";
		</script>
	</c:when>	
	<c:otherwise>
		<script>
			alert("id/pw�� Ȯ�����ֽʽÿ�.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>