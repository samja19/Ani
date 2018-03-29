package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ani.dto.IBFileAttach;
import com.ani.dto.InfoBoard;
import com.ani.dto.InfoCategory;

public interface InfoBoardMapper {

	void insertInfoBoard(InfoBoard board);

	List<InfoBoard> selectInfoBoardList();

	public void insertIBFileAttach(IBFileAttach attachment);

	InfoBoard selectBoardByBoardNo(int ib_num);

	public List<IBFileAttach> selectBoardAttachByBoardNo(int boardNo);

	void updateinfoboardBoard(InfoBoard board);
	
	IBFileAttach selectIBFileAttachByAttachNo(int ibf_num);

	InfoCategory selectInfoCategoryByCategoryNo(int in_cat_num);

	InfoBoard selectInfoBoardByIBNum(int ib_num);

	void updateIBoard(InfoBoard board);

	void deleteInfoBoard(HashMap<String, Object> params);

	String selectIdByMemberNo(int mn);
}
