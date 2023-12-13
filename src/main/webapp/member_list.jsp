<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>
	<h2>전체 회원 명단 목록</h2>
	<hr>
	<%
		String sql="SELECT * FROM members";//members 테이블의 모든 레크드 가져오기
		
		String driverName = "com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/memberdata";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		ResultSet rs = null;//select문 실행 시 DB에서 반한해 주는 데이털르 받기 위한 객체 준비
		
		try {
			Class.forName(driverName);//jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);//DB연동
			
			stmt = conn.createStatement();
			//int success = stmt.executeUpdate(sql);//SQL 문 실행 -> 성공하면 정수 1이 반환

			rs = stmt.executeQuery(sql);//select문 실행 ->executeQuery로 SQL문 실행
			//DB에서 보내주는 select문의 실행결과를 ResultSet 클래스로 만든 rs로 받음
			int count = 1;
			
			while(rs.next()) {
				String db_id = rs.getString("id");//레코드의 id필드 값 가져오기
				String db_pw = rs.getString("passwd");//레코드의 passwd필드 값 가져오기
				String db_email = rs.getString("email");//레코드의 email필드 값 가져오기
				String db_signuptime = rs.getString("signuptime");
				
				out.println(count + ") " + db_id + "/" + db_pw + "/" + db_email + "/" + db_signuptime + "<br>");
				count++;//반복될 때마다 1씩 증가
			}
			
		} catch(Exception e) {
			e.printStackTrace();//에러 발생시 에러내용 출력
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
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