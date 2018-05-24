package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import DB.DBConnection;
 
 
/* Data Access Object
 * 테이블 당 한개의 DAO를 작성한다.
 * 
 * JSP_MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */
public class MemberDAO 
{
    private static MemberDAO instance;
    
    // 싱글톤 패턴
    private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }
    
  
    // 회원정보를 member 테이블에 저장하는 메서드
    public void insertMember(MemberBean member) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 커넥션을 가져온다.
            conn = DBConnection.getConnection();
            
            // 자동 커밋을 false로 한다.
           // conn.setAutoCommit(false);
            
            // 쿼리 생성한다.
            String sql = "insert into member values(?, ?, ?, ?)";
              
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getMail());
 
            
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // 오류시 롤백
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
    } // end insertMember()
    
    
    //id 중복체크
    public int confirmId(String id) throws Exception{
    	int x = -1;
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try{
    		conn = DBConnection.getConnection();
    		pstmt = conn.prepareStatement("select id from member where id = ?");
    		pstmt.setString(1, id);
    		
    		rs = pstmt.executeQuery();
    		
    		if(rs.next())
    			x = 1;
    		
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}finally{
    		if(rs != null) try {rs.close();}catch(SQLException ex){}
    		if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
    		if(conn != null) try {conn.close();}catch(SQLException ex){}
    	}
    	return x;
    }
    
    
    //로그인 체크
    public boolean loginCheck(String id, String pw){
    	boolean result = false;
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	try{
    		conn = DBConnection.getConnection();
    		String sql = "select * from member where id=? and password=?";
    		pstmt = conn.prepareStatement(sql);
    		
    		pstmt.setString(1, id);
    		pstmt.setString(2, pw);
    		
    		rs=pstmt.executeQuery();
    		if(rs.next()){
    			result=true;
    		}
    		
    	}catch(Exception ex){
    		ex.printStackTrace();
    	}finally{
    		if(rs != null) try {rs.close();}catch(SQLException ex){}
    		if(pstmt != null) try {pstmt.close();}catch(SQLException ex){}
    		if(conn != null) try {conn.close();}catch(SQLException ex){}
    	}
    	return result;
    }
    
    
}
