<!-- 2018.06.26 ������ -->
<!-- Teacher �Է� ȭ��  -->
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
			<h2>Teacher ���� �Է�</h2>
			<div>
				�̸� : <input type="text" name="teacherName" size="10px"><br>
				���� : <input type="text" name="teacherAge" size="10px"><br>
			</div>
			<div>
				<input type="submit" value="�Է�" id="btn">
			</div>
			<div id="clear"></div>
		</form>
	</body>
</html>