<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>충전소 목록</h2>
		<table border=1>
			<tr>
				<th>순번</th>
				<th>충전소<br>이름</th>
				<th>주소</th>
				<th>충전기<br>명칭</th>
				<th>충전기<br>상태코드</th>
			</tr>
			<c:forEach items="${li }" var="m">
				<tr align=center>
					<td>${m.idx }</td>
					<td>${m.csNm }</td>
					<td>${m.addr }</td>
					<td>${m.cpNm }</td>
					<td>${m.cpStat }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />