<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>회원목록 페이지</h2>
		<table border=1>
			<tr>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>등록일자</th>
				<th>고객등급</th>
				<th>도시코드</th>
			</tr>
			<c:forEach items="${li }" var="m">
			<tr align=center>
				<td>${m.custno }</td>
				<td><a href="${path }/shopSelectOne.do?custno=${m.custno }">${m.custname }</a></td>
				<td>${m.phone }</td>
				<td>${m.address }</td>
				<td>
					<fmt:parseDate pattern="yyyy-MM-dd" var="registered" value="${m.joindate }"/>
					<fmt:formatDate pattern="yyyy년MM월dd일" value="${registered }"/></td>
				<td>
					<c:choose>
						<c:when test="${m.grade eq 'A' }">VIP</c:when>
						<c:when test="${m.grade eq 'B' }">일반</c:when>
						<c:when test="${m.grade == 'C' }">직원</c:when>
					</c:choose></td>
				<td>${m.city }</td>
			</tr>
			</c:forEach>
		</table>
		<br>
		<form action="${path }/shopSelectAll.do">
			<select name=ch1>
				<option value="custname">회원이름</option>
				<option value="phone">전화번호</option>
				<option value="address">주소</option>
			</select>
			<input type=text name=ch2>
			<input type=submit value="검색">	
		</form>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />