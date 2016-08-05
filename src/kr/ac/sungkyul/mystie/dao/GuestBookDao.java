package kr.ac.sungkyul.mystie.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.sungkyul.mystie.vo.GuestBookVo;

public class GuestBookDao {

	private Connection getConnection() throws SQLException {
		Connection conn = null ;
		try {
			Class.forName( "oracle.jdbc.driver.OracleDriver" );
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "webdb", "webdb");
		} catch( ClassNotFoundException e ) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void insert(GuestBookVo vo){
		
		PreparedStatement pstmt = null;
		Connection conn = null;

		try{
			
			conn = getConnection();
			String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getContent());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if( pstmt != null ){
					pstmt.close();
				}
				if( conn != null){
					conn.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	
	
	//getList()
		public List<GuestBookVo> getList(){
			List<GuestBookVo> list = new ArrayList<GuestBookVo>();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try{
		
				conn = getConnection();
				stmt = conn.createStatement();
				String sql = "select no,name,content,to_char(reg_date,'yyyy-mm-dd pm hh:mm:dd')" 
						+ " from guestbook"
						+ " order by reg_date desc";
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					Long no = rs.getLong(1);
					String name = rs.getString(2);
					String content = rs.getString(3);
					String regDate = rs.getString(4);
					
					GuestBookVo vo = new GuestBookVo();
					vo.setNo(no);
					vo.setName(name);
					vo.setContent(content);
					vo.setRegDate(regDate);
					
					list.add(vo);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (stmt != null) {
						stmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return list;

		}
}
