<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>방명록 페이지(총 갯수 : ${cnt })</h2>
		<form method=post>
			<table border=1 width=600>
				<tr>
					<th>rownum</th>
					<th>rnum</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
				<c:forEach items="${li }" var="w">
					<tr align=center>
						<td>${w.rownum }</td>
						<td>${w.rnum }</td>
						<td>${w.title }</td>
						<td>${w.writer }</td>
						<td>
							<c:set var="textVal" value="${w.dateStr }" />${fn:substring(textVal,0,10) }
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />