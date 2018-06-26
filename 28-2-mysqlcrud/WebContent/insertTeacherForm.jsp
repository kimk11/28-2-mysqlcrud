<!-- 2018.06.26 송유빈 -->
<!-- Teacher 입력 화면  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherForm</title>
		<style>
		div {
			display: inline-block;
			float: left;
		}
		
		#btn {
			padding: 12px 20px;
		}
		
		#clear {
			clear: left;
		}
		</style>
	</head>
	<body>
		<form action="./insertTeacherAction.jsp" method="post">
			<h2>Teacher 정보 입력</h2>
			<div>
				이름 : <input type="text" name="teacherName" size="10px"><br>
				나이 : <input type="text" name="teacherAge" size="10px"><br>
			</div>
			<div>
				<input type="submit" value="입력" id="btn">
			</div>
			<div id="clear"></div>
		</form>
	</body>
</html>