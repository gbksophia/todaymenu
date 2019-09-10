<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style>
#quick {
  position: absolute;
  right: 10px;
  top: 150px;
  width: 50px;
  height: 50px;
  background: #fff;
  z-index: 2;
  border:1px solid #a19e9e;
}
</style>
</head>

<body>
<div id="quick">     
<jsp:include page="layerPopup.jsp"/>
</div>
</body>

<script>
	$(function() {
		var UI = {
			init : function() {
				this.quickMenuFn();
			},

			initialize : function() {
				this.id = {
					target : { quick : '#quick',},
				};
				this.init();
			},

			quickMenuFn : function() {
				var quick = $(this.id.target.quick);
				var qTop = parseInt(quick.css('top'));

				$(window).scroll(function() {
					var winTop = $(window).scrollTop();
					quick.stop().animate({
						top : winTop + qTop
					}, 400);
				})
			},
		};

		$(function() {
			UI.initialize();
		})
	})
</script>
 

</html>