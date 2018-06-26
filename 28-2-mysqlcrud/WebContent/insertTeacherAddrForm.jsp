<!-- 2018.06.26 송유빈 -->
<!-- Teacher 주소 입력 화면 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Addr Form</title>
<style>
	#textAddr {
		height : 25px;
	}
	div {
		display: inline-block;
		float: left;
		margin-right : 5px;
	}
	#btn {
		padding: 5px;
	}
	#clear {
			clear: left;
		}
</style>
</head>
<body>
	<form action="./insertTeacherAddrAction.jsp" method ="post">
		<h2>Teacher 주소 입력</h2>
		<div>
			<input type = "hidden" id="teacherNo" name ="teacherNo" value="<%= request.getParameter("teacherNo")%>" readonly="readonly">
			<input type = "text" id="teacherAddrContent" name ="teacherAddrContent" size="30px" id="textAddr">
		</div>
		<div>
			<input type="submit" value="입력" id="btn">
		</div>
		<div id="clear"></div>
	</form>
</body>
</html>