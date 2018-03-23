package com.ani.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.ani.dto.MyPage;
import com.ani.mapper.MyPageMapper;

@Repository(value="mypageDao")
public class MyPageDao {

	@Autowired
	@Qualifier("mypageMapper")
	private MyPageMapper mypageMapper;
	
	public void insertMypage(MyPage mypage) {
		mypageMapper.insertmypage(mypage);
	}
	
	public ArrayList<MyPage> selectMyPageList(int first, int last) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", first);
		params.put("to", last);
		return (ArrayList)mypageMapper.selectMyPageList(params);
	}

	public int countMypage() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countMypage = 0;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@210.16.214.202:1521:xe",
						"ani", "ani");
			
			String sql = 
				"SELECT COUNT(*) FROM MYPAGE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				countMypage = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
			if (rs != null) try { rs.close(); } catch (Exception ex) {}
		}
		return countMypage;
	}

	public MyPage selectMypageBymypageNo(Integer mypageNo) {
		MyPage mypage = mypageMapper.selectMypageBymypageNo(mypageNo);
		return mypage;
	}

	public void updatemypage(MyPage mypage) {
		mypageMapper.updatemypage(mypage);
		
	}

	public void deletemypage(Integer mypageNo) {
		mypageMapper.deletemypage(mypageNo);
		
	}

	

}
