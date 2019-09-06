<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>addr only</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=112ecff57900a2dd120c152f6c326b7b&libraries=services"></script>
<script>
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {

    // GeoLocation을 이용해서 접속 위치를 얻어옵니다 (위치 정보)
	navigator.geolocation.getCurrentPosition(function(position) {
        
		var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
                    
        var geocoder = new kakao.maps.services.Geocoder();

		var callback2 = function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				console.log('지역 명칭 : ' + result[0].address_name);
				console.log('d1: '+result[0].region_1depth_name);
				console.log('d2: '+result[0].region_2depth_name);
				console.log('d3: '+result[0].region_3depth_name);

				var d1 = result[0].region_1depth_name;
				var d2 = result[0].region_2depth_name;
				var d3 = result[0].region_3depth_name;
				
				document.getElementById('addr').innerHTML=result[0].address_name;
			}
		};
		geocoder.coord2RegionCode(lon, lat, callback2);
	});
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    alert("위치정보사용불가!!");
}
</script>

<p id="addr"></p>

</body>
</html>





