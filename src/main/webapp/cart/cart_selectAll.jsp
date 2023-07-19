<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<script>
	function delK(k) {
		// alert(k + " 삭제")
		location.href="cartDeleteOne.do?cartId=" + k + "&custno=" + ${m.custno };
	}
	
	function delA(a) {
		// alert("전체 삭제")
		location.href="cartDeleteAll.do?custno=" + a;
	}
</script>
<section>
	<br>
	<div align=center>
		<h2>장바구니 페이지</h2>
		<form method=post name=f1>
			<c:if test="${li.size() != 0 }">
				<table border=1>
					<tr>
						<th>장바구니번호</th>
						<th>상품이름</th>
						<th>상품가격</th>
						<th>수량</th>
						<th>합계</th>
						<th>상품사진</th>
						<th>주문취소</th>
					</tr>
					<c:forEach items="${li }" var="c">
						<input type=hidden name="cartId" value="${c.cartId }">
						<input type=hidden name="custno" value="${m.custno }">
						<input type=hidden name="productId" value="${c.productId }">
						<input type=hidden name="productName" value="${c.productName }">
						<tr align=center>
							<td>${c.cartId }</td>
							<td>${c.productName }</td>
							<td><fmt:formatNumber pattern="###,###,###">
									${c.productPrice }
								</fmt:formatNumber></td>
							<td><input type=number name="amount" value="${c.amount }" min=1 max=5 size=3></td>
							<td><fmt:formatNumber pattern="###,###,###">
									${c.productPrice*m.amount }
								</fmt:formatNumber></td>
							<td><img src="${path}/product/files/${c.productImgStr }" width=100 height=100></td>
							<td><input type=button value="삭제" onClick="delK('${c.cartId }')"></td>
						</tr>
						<c:set var="sum" value="${c.productPrice * c.amount }" />
						<c:set var="total" value="${total + sum }" />
					</c:forEach>
					<tr><td colspan=7 align=left>
						<c:if test="${total >= 30000 }">
							배송비 : 0 <c:set var="baesongbi" value="0" /> <br>
							상품 : <fmt:formatNumber value="${total }" pattern="###,###,###" /> <br>
							총 합계(상품+배송비) : <fmt:formatNumber value="${total }" pattern="###,###,###" />							
						</c:if>
						<c:if test="${total < 30000 }">
							배송비 : 3,000 <c:set var="baesongbi" value="3000" /> <br>
							상품 : <fmt:formatNumber value="${total }" pattern="###,###,###" /> <br>
							총 합계(상품+배송비) : <fmt:formatNumber value="${total + 3000 }" pattern="###,###,###" />
						</c:if>
					</td></tr>
					<tr><td colspan=7 align=center>
							<input type=hidden name=totalMoney value="${total }">
							<input type=hidden name=baesongbi value="${baesongbi }">
							
							<input type=submit value="주문하기" onClick="javaScript:action='${path}/cartOrder.do'">&nbsp;
							<input type=submit value="수정하기" onClick="javaScript:action='${path}/cartUpdate.do'">&nbsp;
							<input type=button value="전체삭체" onClick="delA('${m.custno }')">&nbsp;</td></tr>
				</table>
			</c:if>
			<c:if test="${li.size() == 0 }">
				<br><br>장바구니가 비어있습니다.
			</c:if>
		</form>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />