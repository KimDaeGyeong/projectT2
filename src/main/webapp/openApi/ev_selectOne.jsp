<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:import url="/include/top.jsp" />
<section>
	<br>
	<div align=center>
		<h2>충전소목록 상세페이지</h2>
		<form action="${path }/evUpdate.do">
			<table border=1 width=1100>
				<tr><th>순번</th>
					<td>&nbsp;<input type=text name="idx" value="${m.idx }"></td>
					<td rowspan=5 width=500>
						<div id="map" style="width:100%;height:350px;"></div>
					</td></tr>
				<tr><th>충전소이름</th><td>&nbsp;<input type=text name="csNm" value="${m.csNm }" size=40></td></tr>
				<tr><th>주소</th><td>&nbsp;<input type=text name="addr" value="${m.addr }" size=60></td></tr>
				<tr><th>충전기명칭</th><td>&nbsp;<input type=text name="cpNm" value="${m.cpNm }"></td></tr>
				<tr><th>충전기상태코드</th><td>&nbsp;<input type=text name="cpStat" value="${m.cpStat }"></td></tr>
				<tr><td colspan=3 align=center>
						<input type=submit value="수정">&nbsp;
						<input type=button value="조회"></td></tr>
			</table>
		</form>
	</div>
	<br>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${key}&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(35.1900573, 128.9925063), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
	
	var  csNm = "${m.csNm}";
	var  addr = "${m.addr}";	
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
		
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
	    	
		// 정상적으로 검색이 완료됐으면
	    if (status === kakao.maps.services.Status.OK) {
	
	      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	      // 결과값으로 받은 위치를 마커로 표시합니다
	      var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	      });
	
	      // 인포윈도우를 생성합니다
	      var infowindow = new kakao.maps.InfoWindow({
	          content: '<div style="width:250px;text-align:center;padding:6px 0;">' + csNm + '</div>',
	          removable : true
	      });
	          
	      // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, marker);  		      
	      
	      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	      map.setCenter(coords);
	    } 
	});
</script>
<c:import url="/include/bottom.jsp" />