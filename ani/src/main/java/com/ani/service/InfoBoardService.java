package com.ani.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.InfoBoardDao;
import com.ani.dto.IBFileAttach;
import com.ani.dto.InfoBoard;
 

@Service(value="infoBoardService")
public class InfoBoardService {

	@Autowired
	@Qualifier("infoBoardDao")
	private InfoBoardDao dao;


	public void ibwrite(InfoBoard board) {
		dao.insertInfoBoard(board);
		
	}
	 
	public void ibwrite2(InfoBoard board) {
		dao.insertInfoBoard(board);
		List<IBFileAttach> attachments = board.getAttachments();
		for (IBFileAttach attachment : attachments) {
			attachment.setIb_num(board.getIb_num());
			dao.insertIBFileAttach(attachment);
		}
		
	}
	
	public List<InfoBoard> getInfoboardBoardList(int start, int last) {
		List<InfoBoard> infoboards =dao.seelctInfoBoardList(start ,last);
		return infoboards;
	}

	public int getInfoBoardCount() {
		int countInfoBoard = dao.countInfoBoard();
		return countInfoBoard;
	}
	
	public InfoBoard findBoardByBoardNo(Integer ib_num) {
		InfoBoard board =dao.selectBoardByBoardNo(ib_num);
		
		List<IBFileAttach> attachments = dao.selectBoardAttachByBoardNo(ib_num);
		board.setAttachments(attachments);
		
		return board;
	}

	public IBFileAttach findIBFileAttachByAttachNo(Integer ibf_num) {
		IBFileAttach attach = dao.selectIBFileAttachByAttachNo(ibf_num);
		
		IBFileAttach attachment = dao.selectIBFileAttachByAttachNo(ibf_num);
		attach.setIbf_num(ibf_num);
		return attach;
	}

	
	
}
