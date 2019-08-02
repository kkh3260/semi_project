package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberBillDAO {
	DataSource ds;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public MemberBillDAO() {
		try{
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("jdbc/OracleDB");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public boolean updateMemberBill(MemberBillBean mbb) {
		String sql=null;
		boolean result = false;
		try{
			con = ds.getConnection();
			sql="insert into MEMBER_BILL values "+
				"(?,?,sysdate)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mbb.getMEMBER_ID());
			pstmt.setInt(2, mbb.getMEMBER_BILL());
			pstmt.executeUpdate();		
			result = true;
			
		}catch(Exception e){
			e.printStackTrace();
		}	finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		
		return result;
	}
}
