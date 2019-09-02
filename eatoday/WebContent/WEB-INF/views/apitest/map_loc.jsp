<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>geo+addr+latlon</title>
    
</head>
<body>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<div id="map" style="width:100%;height:700px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=112ecff57900a2dd120c152f6c326b7b&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
        
/////
        var geocoder = new kakao.maps.services.Geocoder();

		var coord = new kakao.maps.LatLng(lat, lon);
        var callback = function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
                //document.getElementById('addr2').value=result[0].address.address_name;
            }
        };
        geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);

          var callbackaa = function(result, status) {
            if (status === kakao.maps.services.Status.OK) {

                var spot = result[0].address_name;
				var area1 = result[0].region_1depth_name;
				var area2 = result[0].region_2depth_name;
				var area3 = result[0].region_3depth_name;
				var allData = { "spot":spot, "area1":area1,"area2":area2, "area3":area3 };
                console.log('지역 명칭 : ' + area1);

                console.log('d1: '+result[0].region_1depth_name);
                console.log('d2: '+result[0].region_2depth_name);
                console.log('d3: '+result[0].region_3depth_name);
                
                //document.getElementById('addr2').innerHTML='내위치2: '+result[0].address_name;
                document.getElementById('d1t').value=result[0].region_1depth_name;
                document.getElementById('addr2').value=result[0].address_name;

                document.getElementById('d1').innerHTML=result[0].region_1depth_name;
                document.getElementById('d2').innerHTML=result[0].region_2depth_name;
                document.getElementById('d3').innerHTML=result[0].region_3depth_name;

				/* var ddd = new Object();
				ddd.d1 = result[0].region_1depth_name;
				ddd.d2 = result[0].region_2depth_name;
				ddd.d3 = result[0].region_3depth_name;

				var jsonText = JSON.stringify(ddd, "\t");
				document.write(jsonText); */
	            				                               
            }
        };
        geocoder.coord2RegionCode(lon, lat, callbackaa);
/////

      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}

$.ajax({
	type : "post",
	url : "test.eat",
	data : allData,
	success : function(data){
		alert(data);
	}
});
</script>
<form action="test.eat">
	<input type="text" id="addr2" name="addr2" />
	<input type="submit" value="asdasdasd"/>
</form>
<input type="text" id="d1t" name="d1t" />
<p id="d1"></p>
<p id="d2"></p>
<p id="d3"></p>
</body>
</html>
