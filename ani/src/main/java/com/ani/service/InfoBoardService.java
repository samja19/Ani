package com.ani.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ani.dao.InfoBoardDao;
 

@Service(value="infoBoardService")
public class InfoBoardService {

	@Autowired
	@Qualifier("infoBoardDao")
	private InfoBoardDao dao;
	 

	
}
