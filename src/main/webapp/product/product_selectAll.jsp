<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>상품목록 페이지</h2>
		<table border=1>
			<tr>
				<th>상품번호</th>
				<th>상품이름</th>
				<th>상품가격</th>
				<th>상품설명</th>
				<th>상품사진</th>
				<th>파일명</th>
				<th>등록일</th>
			</tr>
			<c:forEach items="${li }" var="m">
				<tr align=center>
					<td>${m.productId }</td>
					<td><a href="${path }/productSelectOne.do?productId=${m.productId }">${m.productName }</a></td>
					<td>${m.productPrice }</td>
					<td>${m.productDesc }</td>
					<td><img src="${path }/product/files/${m.productImgStr }" width=50 height=50></td>
					<td>${m.productImgStr }</td>
					<td>${m.productDate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />