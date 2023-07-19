<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>회사 목록</h2>
		<table border=1>
			<tr>
				<th>순번</th>
				<th>회사이름</th>
				<th>대표이름</th>
				<th>주소</th>
				<th>대표상품</th>
				<th>위도</th>
				<th>경도</th>
			</tr>
			<c:forEach items="${li }" var="m">
				<tr align=center>
					<td>${m.idx }</td>
					<td><a href="${path }/OpenApiSelectOne.do?idx=${m.idx }">${m.entrprsNm }</a></td>
					<td>${m.rprsntvNm }</td>
					<td>${m.rdnmadr }</td>
					<td>${m.mainGoods }</td>
					<td>${m.latitude }</td>
					<td>${m.logitude }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />