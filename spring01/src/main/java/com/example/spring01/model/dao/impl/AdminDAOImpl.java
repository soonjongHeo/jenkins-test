package com.example.spring01.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.spring01.model.dao.AdminDAO;
import com.example.spring01.model.dto.AdminDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	private static final Logger logger = 
			LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<AdminDTO> adminList() {
		logger.info("adminList called");
		return sqlSession.selectList("admin.adminList");
	}

	@Override
	public void insertAdmin(AdminDTO dto) {
		logger.info("insertAdmin called");
		sqlSession.insert("admin.insertAdmin", dto);
	}

	@Override
	public AdminDTO viewAdmin(String adminId) {
		logger.info("viewAdmin called");
		return sqlSession.selectOne("admin.viewAdmin", adminId);
	}

	@Override
	public void deleteAdmin(String adminId) {
		logger.info("deleteAdmin called");
		sqlSession.insert("admin.deleteAdmin", adminId);
	}

	@Override
	public void updateAdmin(AdminDTO dto) {
		logger.info("updateAdmin called");
		sqlSession.insert("admin.updateAdmin", dto);
	}

	@Override
	public boolean adminCheckPw(String adminId, String passwd) {
		logger.info("adminCheckPw called");
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("adminId", adminId);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("admin.adminCheckPw", map);
		if(count == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public String adminLoginCheck(AdminDTO dto) {
		logger.info("adminLoginCheck called");
		return sqlSession.selectOne("admin.adminLoginCheck", dto);
	}

}
