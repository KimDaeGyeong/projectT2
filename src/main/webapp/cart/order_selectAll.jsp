<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<section>
	<br>
	<div align=center>
		<h2>주문 목록 페이지</h2>
		<form method=post name=f1>
			<c:if test="${li.size() != 0 }">
				<table border=1>
					<tr>
						<th>주문번호</th>
						<th>회원번호</th>
						<th>배송비</th>
						<th>총 합계</th>
						<th>주문날짜</th>
					</tr>
					<c:forEach items="${li }" var="o">
						<tr align=center>
							<td><a href="${path }/orderSelectOne.do?idx=${o.idx }">${o.idx }</a></td>
							<td>${o.ocustno }</td>
							<td><fmt:formatNumber pattern="###,###,###">
									${o.baesongbi }
								</fmt:formatNumber></td>
							<td><fmt:formatNumber pattern="###,###,###">
									${o.totalMoney }
								</fmt:formatNumber></td>
							<td>${o.getDate }</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${li.size() == 0 }">
				<br><br>주문 목록이 비어있습니다.
			</c:if>
		</form>
	</div>
	<br>
</section>
<c:import url="/include/bottom.jsp" />