package DB;

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.*;

public class DBConnection {

	public DBConnection() {
	}

	public static Connection getConnection() throws Exception{
  
  Connection conn = null;
  
  try{
	  //1단계  - oracle driver 로딩
	  Class.forName("oracle.jdbc.driver.OracleDriver"); //대소문자 구분

	  //2단계 - Connection 객체 생성
	  conn = DriverManager.getConnection("jdbc:oracle:thin:@210.123.254.10:1521:XE","scott","tiger");



   }catch(Exception e){}

  return conn;
 }

}

