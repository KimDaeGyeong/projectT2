<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>주문서 출력 페이지</h2>
		<form method=post name=f1>
			<table border=1 width=600>
				<tr><th colspan=6 align=left>
						&nbsp;주문번호 : ${one[0].orderG }<br>
						&nbsp;주문날짜 : ${one[0].getDate }<br>
						&nbsp;회원이름 : ${one[0].custname }&emsp;/&emsp;전화번호 : ${one[0].phone }<br>
						&nbsp;주소 : ${one[0].address }&nbsp;${one[0].address2 }&emsp;(우)&nbsp;${one[0].zipcode }
					</th></tr>
				<tr>
					<th>상품번호</th>
					<th>상품이름</th>
					<th>상품가격</th>
					<th>수량</th>
					<th>상품사진</th>
				</tr>
				<c:forEach items="${one }" var="oo">
					<tr align=center>
						<td>${oo.productId }</td>
						<td>${oo.productName }</td>
						<td><fmt:formatNumber pattern="###,###,###">${oo.productPrice }</fmt:formatNumber>원</td>
						<td>${oo.amount }</td>
						<td><img src="${path }/product/files/${oo.productImgStr }" width=100 height=100></td>
					</tr>
				</c:forEach>
				<tr><td colspan=5 align=left>
					&nbsp;배송비 : <fmt:formatNumber pattern="###,###,###">${one[0].baesongbi }</fmt:formatNumber>원<br>
					&nbsp;상품 : <fmt:formatNumber pattern="###,###,###">${one[0].totalMoney }</fmt:formatNumber>원<br>
					&nbsp;총 합계 : <fmt:formatNumber pattern="###,###,###">${one[0].baesongbi + one[0].totalMoney }</fmt:formatNumber>원<br>
					</td></tr>
			</table>
		</form>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />