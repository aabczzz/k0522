<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table { height: 450px; border: 2px solid black; width: 90%;
		table-layout: fixed; overflow: hidden; }
	div { height: 400px; overflow: scroll; }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	let websocket = new WebSocket("ws://192.168.40.186:8080/ch17/websocket");
	let disp;
	websocket.onopen = function() { 	// 처음 연결되면바보
		disp = document.getElementById("disp");
		disp.innerHTML += "연결되었습니다<br>";
	}
	websocket.onclose = function() {	// 연결을 종료하면
		disp.innerHTML += "종료되었습니다<br>";
	}
	websocket.onerror = function() {	// 에러가 발생하면
		disp.innerHTML += "어이쿠 에러네<br>";
	}
	websocket.onmessage = function(event) {	// 메세지가 도착하면
		disp.innerHTML += event.data+"<br>";
		// scrollbar 를 움직여서 최신 글자가 보이게 
		let objDiv = document.getElementById("disp");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	
	function webstart() {
		let message = document.getElementById("content").value;
		let name = document.getElementById("name").value;
		websocket.send(name+" > "+message);
		document.getElementById("content").value = "";
	}
	function init() {
		let cont = document.getElementById("content");
		cont.addEventListener("keyup", function() {
			// 누른 키보드 값			IE ? 	IE의 키값  :	  나머지
			let keycode = event.keyCode?event.keyCode:event.which;
			if ( keycode == 13 ) webstart();	// 아스키코드 13 == enter
			event.stopPropagation();	// 이벤트 전달을 금지
		});
	}
</script>
</head>
<body onload="init()">
	별명 :
	<input type="text" name="name" id="name">
	<table border="1">
		<tr>
			<th height="400" id="a">
				<div id="disp"></div>
			</th>
		</tr>
		<tr>
			<td height="50"><input type="text" id="content"><br>
				<button onclick="webstart()">웹 채팅</button></td>
		</tr>
	</table>
</body>
</html>
