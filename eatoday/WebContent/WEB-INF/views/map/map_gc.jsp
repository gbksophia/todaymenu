<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>geo+cat_������ġ ī�װ� ����</title>
<style>
.map_wrapc, .map_wrapc * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'����',sans-serif;font-size:12px;}
.map_wrapc {position:relative;width:100%;height:350px;}
#categoryc {position:absolute;top:50px;left:50px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#categoryc li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#categoryc li.on {background: #eee;}
#categoryc li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#categoryc li:last-child{margin-right:0;border-right:0;}
#categoryc li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#categoryc li .category_bg {background:url(/eatoday/resource/images/places_category.png) no-repeat;}
#categoryc li .bank {background-position: -10px 0;}
#categoryc li .mart {background-position: -10px -36px;}
#categoryc li .pharmacy {background-position: -10px -72px;}
#categoryc li .oil {background-position: -10px -108px;}
#categoryc li .cafe {background-position: -10px -144px;}
#categoryc li .store {background-position: -10px -180px;}
#categoryc li.on .category_bg {background-position-x:-46px;}
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
/* �ݱ��ư */
.placeinfo .closeMapc {position: absolute;top: 100px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.placeinfo .closeMapc:hover {cursor: pointer;}
</style>
</head>
<body>

<div class="map_wrapc">
    <div id="mapc" style="width:100%;height:350px;position:relative;overflow:hidden;"></div>
    <ul id="categoryc">
    	<li id="FD6" data-order="1"> 
            <span class="category_bg mart"></span>
            ������
        </li>
         <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            ��Ʈ
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            ī��
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            ������
        </li>
    </ul>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=112ecff57900a2dd120c152f6c326b7b&libraries=services"></script>
<script>
		// ****** Category ******//
// ��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
    markers = [], // ��Ŀ�� ���� �迭�Դϴ�
    currCategory = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�
 
var mapContainer = document.getElementById('mapc'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        level: 5 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ��� �˻� ��ü�� �����մϴ�
var ps = new kakao.maps.services.Places(map); 

// ������ idle �̺�Ʈ�� ����մϴ�
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
contentNode.className = 'placeinfo_wrap';

// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� kakao.maps.event.preventMap �޼ҵ带 ����մϴ� 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// Ŀ���� �������� �������� �����մϴ�
placeOverlay.setContent(contentNode);  

// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
addCategoryClickEvent();

// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // Ŀ���� �������̸� ����ϴ� 
    placeOverlay.setMap(null);

    // ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // �˻������ ���°�� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���

    } else if (status === kakao.maps.services.Status.ERROR) {
        // ������ ���� �˻������ ������ ���� ��� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
        
    }
}

// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayPlaces(places) {

    // ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
    // �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
    var order = document.getElementById(currCategory).getAttribute('data-order');

    for ( var i=0; i<places.length; i++ ) {
            // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
            // ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
        imageSize = new kakao.maps.Size(27, 28),  // ��Ŀ �̹����� ũ��
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
            offset: new kakao.maps.Point(11, 28) // ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // ��Ŀ�� ��ġ
            image: markerImage 
        });

    marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
    markers.push(marker);  // �迭�� ������ ��Ŀ�� �߰��մϴ�

    return marker;
}

// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                  '<a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

    if (place.road_address_name) {
        content += '<span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                   '<span class="jibun" title="' + place.address_name + '">(���� : ' + place.address_name + ')</span>';
    }  else {
        content += '<span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '<span class="tel">' + place.phone + '</span>' + 
    		   '<span><div class="closeMapc" onClick="closeOverlayc()" title="�ݱ�"></div></span>' +
               '</div>' + 
               '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map); 
}

//Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
function closeOverlayc() {
    placeOverlay.setMap(null);     
}

// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
function addCategoryClickEvent() {
    var category = document.getElementById('categoryc'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
function changeCategoryClass(el) {
    var category = document.getElementById('categoryc'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 

	//****** GeoLocation ******//
//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
if (navigator.geolocation) {

// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
navigator.geolocation.getCurrentPosition(function(position) {
    
    var lat = position.coords.latitude, // ����
        lon = position.coords.longitude; // �浵
    
    var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
        message = '<div style="padding:5px;">���⿡ ��Ű���?!</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
    
    // ��Ŀ�� ���������츦 ǥ���մϴ�
    displayMarker(locPosition, message);
        
  });

} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
    message = 'geolocation�� ����Ҽ� �����..'
    
displayMarker(locPosition, message);
}

//������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
function displayMarker(locPosition, message) {

// ��Ŀ�� �����մϴ�
var marker = new kakao.maps.Marker({  
    map: map, 
    position: locPosition
}); 

var iwContent = message, // ���������쿡 ǥ���� ����
    iwRemoveable = true;

// ���������츦 �����մϴ�
var infowindow = new kakao.maps.InfoWindow({
    content : iwContent,
    removable : iwRemoveable
});

// ���������츦 ��Ŀ���� ǥ���մϴ� 
infowindow.open(map, marker);

// ���� �߽���ǥ�� ������ġ�� �����մϴ�
map.setCenter(locPosition);      



}
</script>
</body>
</html>
