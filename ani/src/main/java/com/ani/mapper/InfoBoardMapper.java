package com.ani.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ani.dto.IBFileAttach;
import com.ani.dto.InfoBoard;

public interface InfoBoardMapper {

	void insertInfoBoard(InfoBoard board);

	List<InfoBoard> selectInfoBoardList(HashMap<String, Object> params);

	public void insertIBFileAttach(IBFileAttach attachment);

	InfoBoard selectBoardByBoardNo(int ib_num);

	public List<IBFileAttach> selectBoardAttachByBoardNo(int boardNo);

	void updateinfoboardBoard(InfoBoard board);
	
	IBFileAttach selectIBFileAttachByAttachNo(int ibf_num);
}
