<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>map+lf</title>

<style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:100px;left:100px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(/eatoday/resource/images/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
    
</head>
<body>
<div id="map" style="width:100%;height:500px;"></div>
<script src="/eatoday/resource/js/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=112ecff57900a2dd120c152f6c326b7b&libraries=services"></script>
<script>
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
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
				
				$.ajax({
					type: "post",
					url: "/eatoday/map/map_lf2.eat",
					data: { d1:d1, d2:d2, d3:d3 },
					success: function(data){
						console.log("ajax success");
						cateSearch(data.trim());

						document.getElementById('cate').innerHTML=data.substr(data.length-3,3);
					}
				});
			}
		};
		geocoder.coord2RegionCode(lon, lat, callback2);
	});
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    alert("위치정보사용불가!!");
}

////////////////////////////////////////////////////////////////
function cateSearch(data){
	console.log('cateSearch: '+data);
	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	    
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);
	    
	// 키워드로 장소를 검색합니다
	ps.keywordSearch(data, placesSearchCB);
	//ps.keywordSearch('이태원 맛집', placesSearchCB);
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<data.length; i++) {
	            displayMarkers(data[i]);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	         }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    } 
	}
	
	// 지도에 마커를 표시하는 함수입니다
	function displayMarkers(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	    	var content = '<div class="placeinfo">' +
							'<a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
	
	    if (place.road_address_name) {
	        content += '<span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                   '<span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '<span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '<span class="tel">'
	        		 + place.phone + '</span>' + '</div>'
	        		  + '<div class="after"></div>';
	
	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	    });
	}
}
</script>
<p id="addr"></p>
&nbsp;주변의
<p id="cate"></p>
&nbsp;검색결과입니다!
</body>
</html>