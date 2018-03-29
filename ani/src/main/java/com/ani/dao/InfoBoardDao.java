package com.ani.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.ani.dto.IBFileAttach;
import com.ani.dto.InfoBoard;
import com.ani.dto.InfoCategory;
import com.ani.mapper.InfoBoardMapper;
 

@Repository(value="infoBoardDao")
public class InfoBoardDao {
//	
	@Autowired
	@Qualifier("infoboardMapper")
	private InfoBoardMapper infoBoardMapper;

	public void insertInfoBoard(InfoBoard board) {
		infoBoardMapper.insertInfoBoard(board);
	}
	
	public List<InfoBoard> selectInfoBoardList(int start, int last) {
		
		
	
		
		
		
		List<InfoBoard> boards = infoBoardMapper.selectInfoBoardList();
		for (InfoBoard board : boards) {
			InfoCategory c = infoBoardMapper.selectInfoCategoryByCategoryNo(board.getIn_cat_num());
	
			board.setCategory(c);
		}
		
		return boards;
	}
	
	public int countInfoBoard() {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countIB = 0;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@210.16.214.202:1521:xe",
						"ani", "ani");
			
			String sql = 
			"SELECT COUNT(*) FROM INFO_BOARD";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				countIB = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
			if (rs != null) try { rs.close(); } catch (Exception ex) {}
		}
		return countIB;
	}
		
	public void insertIBFileAttach(IBFileAttach attachment) {
		infoBoardMapper.insertIBFileAttach(attachment);
	}
	
	public InfoBoard selectBoardByBoardNo(int ib_num) {
		return infoBoardMapper.selectBoardByBoardNo(ib_num);
	}

	public void updateinfoboardHits(InfoBoard board) {
		infoBoardMapper.updateinfoboardBoard(board);
	}
	
	public List<IBFileAttach> selectBoardAttachByBoardNo(int ib_num) {
		
		return infoBoardMapper.selectBoardAttachByBoardNo(ib_num);
	}

	public IBFileAttach selectIBFileAttachByAttachNo(int ibf_num) {
		return infoBoardMapper.selectIBFileAttachByAttachNo(ibf_num);
	}

	public InfoBoard selectInfoBoardByIBNum(int ib_num) {
		InfoBoard infoboard = infoBoardMapper.selectInfoBoardByIBNum(ib_num);
		return infoboard;
	}

	public void updateInfoBoard(InfoBoard board) {
		infoBoardMapper.updateIBoard(board);
		
	}

	public void deleteInfoBoard(int ib_Num, int type) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("infoNum", ib_Num);
		params.put("type", type);
		infoBoardMapper.deleteInfoBoard(params);
	}

	public String selectIdByMemberNo(int mn) {
		return infoBoardMapper.selectIdByMemberNo(mn);
	}
	 	
}
