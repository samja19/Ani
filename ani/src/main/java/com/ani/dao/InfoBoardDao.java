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

import com.ani.mapper.InfoBoardMapper;
 

@Repository(value="infoBoardDao")
public class InfoBoardDao {
	
	@Autowired
	@Qualifier("infoBoardMapper")
	private InfoBoardMapper infoBoardMapper;
	 	
}
