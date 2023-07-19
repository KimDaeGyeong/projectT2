<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<section>
	<br>
	<div align=center>
		<h2>회원매출조회</h2>
		<table border=1 width=500>
			<tr><th>회원번호</th>
				<th>회원이름</th>
				<th>고객등급</th>
				<th>매출</th></tr>
			<c:forEach items="${li }" var="m">
				<tr align=center>
					<td>${m.custno }</td>
					<td>${m.custname }</td>
					<td><c:choose>
							<c:when test="${m.grade eq 'A' }">VIP</c:when>
							<c:when test="${m.grade eq 'B' }">일반</c:when>
							<c:when test="${m.grade == 'C' }">직원</c:when>
						</c:choose></td>
					<td width=30%>${m.total }</td></tr>
			</c:forEach>
		</table>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />