package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public BoardDAO() {
		try{
			Context init = new InitialContext();
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//글의 개수 구하기
	public int getListCount() {
		String sql = "select count(*) from mvcboard";
		int count = 0;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount 에러: " + ex);			
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	//글 목록 보기
	public List<BoardDTO> getBoardList(int page,int limit){
	
		// 
		String sql =
				"select * from "+
				"(select rownum rnum,boardNum,boardName,boardSubject,"+
				"boardContent,boardFile,boardReplyRef,boardReplyLev,"+
				"boardReplySeq,boardReadcount,boardDate from "+
				"(select * from mvcboard order by boardReplyRef desc,boardReplySeq asc)) "+
				"where rnum>=? and rnum<=?";
		
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		int startrow = (page-1)*10+1; //읽기 시작할 row 번호.
		int endrow = startrow+limit-1; //읽을 마지막 row 번호.	
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardDTO board = new BoardDTO();
				board.setBoardNum(rs.getInt("boardNum"));
				board.setBoardName(rs.getString("boardName"));
				System.out.println("보드이름"+rs.getString("boardName"));
				board.setBoardSubject(rs.getString("boardSubject"));
				board.setBoardContent(rs.getString("boardContent"));
				board.setBoardFile(rs.getString("boardFile"));
				board.setBoardReplyRef(rs.getInt("boardReplyRef"));
				board.setBoardReplyLev(rs.getInt("boardReplyLev"));
				board.setBoardReplySeq(rs.getInt("boardReplySeq"));
				board.setBoardReadcount(rs.getInt("boardReadcount"));
				board.setBoardDate(rs.getDate("boardDate"));
				
				list.add(board);
			}
			
			return list;
			
		}catch(Exception ex){
			System.out.println("getBoardList 에러 : " + ex);
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
		}
		
		return null;
	}
	
	//글 내용 보기.
	public BoardDTO getDetail(int num) throws Exception{
		String sql = "select * from mvcboard where boardNum = ?";
		BoardDTO board = null;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				board = new BoardDTO();
				
				board.setBoardNum(rs.getInt("boardNum"));
				board.setBoardName(rs.getString("boardName"));
				board.setBoardSubject(rs.getString("boardSubject"));
				board.setBoardContent(rs.getString("boardContent"));
				board.setBoardFile(rs.getString("boardFile"));
				board.setBoardReplyRef(rs.getInt("boardReplyRef"));
				board.setBoardReplyLev(rs.getInt("boardReplyLev"));
				board.setBoardReplySeq(rs.getInt("boardReplySeq"));
				board.setBoardReadcount(rs.getInt("boardReadcount"));
				board.setBoardDate(rs.getDate("boardDate"));
			}
			
			return board;
			
		}catch(Exception ex){
			System.out.println("getDetail 에러 : " + ex);
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	//글 등록
	public boolean boardInsert(BoardDTO board){
		int num = 0;
		String sql = "select max(boardNum) from mvcboard";
		int result = 0;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num = rs.getInt(1)+1;
			else
				num = 1;
			
			sql = "insert into mvcboard values (?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoardName());
			pstmt.setString(3, board.getBoardPass());
			pstmt.setString(4, board.getBoardSubject());
			pstmt.setString(5, board.getBoardContent());
			pstmt.setString(6, board.getBoardFile());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			result = pstmt.executeUpdate();
			
			if(result == 0 )return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("boardInsert 에러 : "+ex);
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	// 답변 글 저장
	public int boardReply(BoardDTO board){
		
		String sql = "select max(boardNum) from mvcboard";
		int num = 0;
		int result = 0;
		
		int re_ref = board.getBoardReplyRef(); //
		int re_lev = board.getBoardReplyLev();
		int re_seq = board.getBoardReplySeq();
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())num = rs.getInt(1)+1;
			else num=1;
			
			// 
			sql = "update mvcboard set boardReplySeq = boardReplySeq+1 "
					+"where boardReplyRef = ? "
					+"and boardReplySeq > ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,re_ref);
			pstmt.setInt(2,re_seq);
			result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("답글 수정 실패");
			}
			
			re_seq++;
			re_lev++;
			
			sql = "insert into mvcboard (boardNum,boardName,boardPass,boardSubject,"
					+"boardContent, boardFile,boardReplyRef,boardReplyLev,boardReplySeq,"
					+"boardReadcount,boardDate) values (?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoardName());
			pstmt.setString(3, board.getBoardPass());
			pstmt.setString(4, board.getBoardSubject());
			pstmt.setString(5, board.getBoardContent());
			pstmt.setString(6, ""); //답장에는 파일을 업로드하지 않음.
			pstmt.setInt(7, re_ref);
			pstmt.setInt(8, re_lev);
			pstmt.setInt(9, re_seq);
			pstmt.setInt(10, 0);
			result = pstmt.executeUpdate();
			
			if(result == 0) {
				System.out.println("답글 저장 실패");
			}
			
			return num;
			
		}catch(SQLException ex){
			System.out.println("boardReply 에러 : "+ex);
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
		}
		return 0;
	}
	
	//글 수정
	public boolean boardModify(BoardDTO modifyboard) throws Exception{
		
		String sql="update mvcboard set boardSubject=?, boardContent=? where boardNum=?";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getBoardSubject());
			pstmt.setString(2, modifyboard.getBoardContent());
			pstmt.setInt(3, modifyboard.getBoardNum());
			pstmt.executeUpdate();
			return true;
		}catch(Exception ex){
			System.out.println("boardModify 에러 : " + ex);
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(con != null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	//글 삭제
	public boolean boardDelete(int num){
		
		String sql = "delete from mvcboard where boardNum=?";
		
		int result=0;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result == 0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("boardDelete 에러 : "+ex);
		}finally{
			try{
				if(pstmt != null)pstmt.close();
				if(con != null) con.close();
			}catch(Exception ex){}
		}
		
		return false;
	}
	
	//조회수 업데이트
	public void setReadCountUpdate(int num) throws Exception{
		
		String sql="update mvcboard set boardReadcount = "
					 +"boardReadcount+1 where boardNum = "+num;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch(SQLException ex) {
			System.out.println("setReadCountUpdate 에러 : "+ex);
		} finally{
			try{
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch(Exception ex){}
		}
	}
	
	//글쓴이인지 확인
	public boolean isBoardWriter(int num, String pass){
		
		String sql = "select * from mvcboard where boardNum=?";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next(); // 
			
			if(pass.equals(rs.getString("boardPass"))){
				return true;
			}
		}catch(SQLException ex){
			System.out.println("isBoardWriter 에러 : "+ex);
		}finally{
			try{
				if(pstmt != null)pstmt.close();
				if(con != null) con.close();
			}catch(Exception ex){}
		}
		
		return false;
	}
}
	