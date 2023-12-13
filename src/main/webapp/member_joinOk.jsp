<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//파라미터 값 utf-8 인코딩
	
		String uid = request.getParameter("userid");//회원 가입시 입력한 아이디
		String upw = request.getParameter("userpw");//회원가입시 입력한 비밀번호
		String uemail = request.getParameter("useremail");//회원가입 시 입력한 이메일

		String sql="INSERT INTO members(id, passwd, email) VALUES('"+uid+"','"+upw+"','"+uemail+"')";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/memberdata";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB연동
			
			stmt = conn.createStatement();
			int success = stmt.executeUpdate(sql);//SQL 문 실행 -> 성공하면 정수 1이 반환
			
			if(success == 1) {//조건이 참이면 sql문 성공적으로 실행
				out.println("회원 가입 성공!!->"+success);
			} else {
				out.println("회원 가입 실패!!->"+success);
			}
			
		} catch(Exception e) {
			e.printStackTrace();//에러 발생시 에러내용 출력
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
	
</body>
</html>