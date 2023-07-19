<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<section>
	<br>
	<div align=center>
		<h2>회사목록 상세페이지</h2>
		<form action="${path }/companyUpdate.do">
			<table border=1 width=800>
				<tr><th>순번</th>
					<td>&nbsp;<input type=text name="idx" value="${m.idx }"></td>
					<td rowspan=5 width=500>
						<div id="map" style="width:100%;height:350px;"></div>
					</td></tr>
				<tr><th>회사이름</th><td>&nbsp;<input type=text name="entrprsNm" value="${m.entrprsNm }"></td></tr>
				<tr><th>대표이름</th><td>&nbsp;<input type=text name="rprsntvNm" value="${m.rprsntvNm }"></td></tr>
				<tr><th>주소</th><td>&nbsp;<input type=text name="rdnmadr" value="${m.rdnmadr }"></td></tr>
				<tr><th>대표상품</th><td>&nbsp;<input type=text name="mainGoods" value="${m.mainGoods }"></td></tr>
				<tr><td colspan=3 align=center>
						<input type=submit value="수정">&nbsp;
						<input type=button value="조회"></td></tr>
			</table>
		</form>
	</div>
	<br>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=704a683fd1763e1ecbadf91b53c6d795"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${m.latitude }, ${m.logitude }), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${m.latitude }, ${m.logitude }); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
</script>
<c:import url="/include/bottom.jsp" />