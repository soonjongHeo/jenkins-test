package com.example.spring01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring01.model.dao.AdminDAO;
import com.example.spring01.model.dto.AdminDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDao;
	
	@Override
	public List<AdminDTO> adminList() {
		return adminDao.adminList();
	}

	@Override
	public void insertAdmin(AdminDTO dto) {
		adminDao.insertAdmin(dto);
	}

	@Override
	public AdminDTO viewAdmin(String adminId) {
		return adminDao.viewAdmin(adminId);
	}

	@Override
	public void deleteAdmin(String adminId) {
		adminDao.deleteAdmin(adminId);
	}

	@Override
	public void updateAdmin(AdminDTO dto) {
		adminDao.updateAdmin(dto);
	}

	@Override
	public boolean adminCheckPw(String adminId, String passwd) {
		return adminDao.adminCheckPw(adminId, passwd);
	}

	@Override
	public String adminLoginCheck(AdminDTO dto) {
		return adminDao.adminLoginCheck(dto);
	}

}
