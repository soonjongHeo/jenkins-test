package com.example.spring01.model.dao;

import java.util.List;

import com.example.spring01.model.dto.AdminDTO;

public interface AdminDAO {
	public List<AdminDTO> adminList();
	public void insertAdmin(AdminDTO dto);
	public AdminDTO viewAdmin(String adminId);
	public void deleteAdmin(String adminId);
	public void updateAdmin(AdminDTO dto);
	public boolean adminCheckPw(String adminId, String passwd);
	public String adminLoginCheck(AdminDTO dto);
}
