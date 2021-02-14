package com.example.spring01.model.dao;

import java.util.List;

import com.example.spring01.model.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> memberList();
	public void insertMember(MemberDTO dto);
	public MemberDTO viewMember(String userId);
	public void deleteMember(String userId);
	public void updateMember(MemberDTO dto);
	public boolean checkPw(String userid, String passwd);
	public String loginCheck(MemberDTO dto);
}
