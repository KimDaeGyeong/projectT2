<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<c:set var="key" value="704a683fd1763e1ecbadf91b53c6d795" scope="session" />
<!-- scope : 아무대서나 불러서 쓸수있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dk</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css"  />
<style type="text/css">

</style>

</head>
<body>
<header>
 <b> dk's Shop </b>
</header>
<nav>

&emsp;&emsp;<a href="${path}/shopForm.do">회원등록</a>
&emsp;&emsp;<a href="${path}/shopSelectAll.do">회원목록조회/수정</a>
&emsp;&emsp;<a href="${path}/shopMoney.do">회원매출조회</a>

<c:if test="${m.id == 'admin'}">
	&emsp;&emsp;<a href="${path}/OpenApiSelectAll.do">회사목록</a>
	&emsp;&emsp;<a href="${path}/OpenApiSelectAllMap.do">회사지도(좌표)</a>
	
	&emsp;&emsp;<a href="${path}/OpenApiSelectAllEv.do">충전소목록</a>
	&emsp;&emsp;<a href="${path}/OpenApiSelectAllEvMap.do">충전소지도(주소)</a>
</c:if>

&emsp;&emsp;<a href="${path}/product/product_form.jsp">상품등록</a>
&emsp;&emsp;<a href="${path}/productSelectAll.do">상품목록</a>

&emsp;&emsp;<a href="${path}/guestbookInsert.do">방명록등록</a>
&emsp;&emsp;<a href="${path}/guestbookList.do">방명록목록</a>

&emsp;&emsp;<a href="${path}/index.jsp">홈으로</a>

<c:if test="${empty m.custno}">
&emsp;&emsp;<a href="${path}/login/login.jsp">로그인</a>
</c:if>

<c:if test="${!empty m.custno}">
&emsp;&emsp;<a href="${path}/cartSelectAll.do?custno=${m.custno}">장바구니</a>
&emsp;&emsp;<a href="${path}/logout.do?custno=${m.custno}">${m.custname} 로그아웃</a>
</c:if>

<c:if test="${m.id == 'admin'}">
&emsp;&emsp;<a href="${path}/orderSelectAll.do">주문목록</a>
</c:if>

</nav>