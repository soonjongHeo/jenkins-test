package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring01.model.dto.AdminDTO;
import com.example.spring01.service.AdminService;

@Controller
public class AdminController {

	private static final Logger logger = 
			LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@RequestMapping("admin/list.do")
	public String list(Model model) {
		logger.info("관리자 목록");
		List<AdminDTO> list = adminService.adminList();
		model.addAttribute("list", list);
		return "admin/list";
	}
	
	@RequestMapping("admin/write.do")
	public String write() {
		logger.info("관리자 등록페이지");
		return "admin/write";
	}
	
	@RequestMapping("admin/insert.do")
	public String insert(@ModelAttribute AdminDTO dto) {
		logger.info("관리자 등록");
		adminService.insertAdmin(dto);
		return "redirect:/admin/list.do";
	}
	
	@RequestMapping("admin/view.do")
	public String view(@RequestParam String adminId, Model model) {
		logger.info("관리자 상세");
		AdminDTO viewAdmin = adminService.viewAdmin(adminId);
		model.addAttribute("viewAdmin", viewAdmin);
		return "admin/view";
	}
	
	@RequestMapping("admin/update.do")
	public String update(@ModelAttribute AdminDTO dto, Model model) {
		logger.info("관리자 수정");
		boolean result = adminService.adminCheckPw(dto.getAdminId(), dto.getPasswd());
		if(result) {
			adminService.updateAdmin(dto);
			return "redirect:/admin/list.do";
		}else {
			AdminDTO viewAdmin = adminService.viewAdmin(dto.getAdminId());
			dto.setJoinDate(viewAdmin.getJoinDate());
			model.addAttribute("viewAdmin", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "admin/view";
		} 
	}
	
	@RequestMapping("admin/delete.do")
	public String delete(@RequestParam String adminId, @RequestParam String passwd,
			Model model) {
		logger.info("관리자 삭제");
		boolean result = adminService.adminCheckPw(adminId, passwd);
		if(result) {
			adminService.deleteAdmin(adminId);
			return "redirect:/admin/list.do";
		}else {
			model.addAttribute("viewAdmin", adminService.viewAdmin(adminId));
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "admin/view";
		} 
	}
	
	@RequestMapping("admin/login.do")
	public String login(Model model) {
		logger.info("관리자로그인 페이지");
		return "admin/login";
	}
	
	@RequestMapping("admin/loginCheck.do")
	public ModelAndView loginCheck(AdminDTO dto, HttpSession session, ModelAndView mav) {
		logger.info("관리자로그인check");
		String name = adminService.adminLoginCheck(dto);
		if(name != null) {
			session.setAttribute("adminId", dto.getAdminId());
			session.setAttribute("name", name);
			mav.setViewName("admin/admin");
			mav.addObject("message", "success");
		}else {
			System.out.println("message: error");
			mav.setViewName("admin/login");
			mav.addObject("message", "error");
			
		}
		return mav;
	}
	
	@RequestMapping("admin/logout.do")
	public String logout(HttpSession session) {
		logger.info("관리자로그아웃");
		session.invalidate();
		return "redirect:/admin/login.do";
	}
}
