<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<script>
	function listK() {
		// alert("목록이동")
		location.href="${path}/productSelectAll.do"
	}

	function delK(k) {
		alert(k + " 삭제완료")
		location.href="${path}/productDelete.do?productId=" + k
	}
</script>
<section>
	<br>
	<div align=center>
		<h2>상품목록 상세페이지</h2>
		<form action="${path }/cartInsert.do">
			<input type=hidden name="productId" value="${p.productId }">
			<input type=hidden name="custno" value="${m.custno }">
			<table border=1 width=600 height=500>
				<tr><th>상품번호</th>
					<td>&nbsp;${p.productId }</td>
					<td rowspan=4 align=center><img src="${path }/product/files/${p.productImgStr }" width=200 height=200></td></tr>
				<tr><th>상품이름</th>
					<td>&nbsp;<input type=text name="productName" value="${p.productName }"></td></tr>
				<tr><th>상품가격</th>
					<td>&nbsp;<input type=text name="productPrice" value="${p.productPrice }"></td></tr>
				<tr><th>상품설명</th>
					<td>&nbsp;<textarea cols=20  rows=3 name="productDesc">${p.productDesc }</textarea></td></tr>
				<tr><th>상품사진</th>
					<td colspan=2>&nbsp;<input type=file name="productImg" value="${p.productImgStr }"></td></tr>
				<tr><th>구매수량</th>
					<td colspan=2>&nbsp;
						<input type=number name="amount" min=1 max=5>
					</td></tr>
				<tr><th>등록일</th>
					<td colspan=2>&nbsp;<input type=text name="productDate"value="${p.productDate }"></td></tr>
				<tr><td colspan=3 align=center>
						<input type=submit value="구매">&nbsp;
						<input type=button value="목록" onClick="listK()">&nbsp;
						<input type=button value="삭제" onclick="delK('${p.productId }')"></td></tr>
			</table>
		</form>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />