package com.CusTomSoft.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.CusTomSoft.demo.dto.MemberDto;
import com.CusTomSoft.demo.service.MemberService;

@Controller
@RequestMapping("/usr/member/")
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@GetMapping("login")
	public String showLogin() {
		return "/usr/member/login";
	}
	

	@GetMapping("join")
	public String showJoin() {
		return "/usr/member/join";
	}

	@GetMapping("main")
	public String index() {
		return "/usr/member/main";
	}

	// 아이디 중복체크
	@PostMapping("idcheck")
	@ResponseBody
	public int idcheck(String custom_user_nick) {
		int cnt = memberservice.idcheck(custom_user_nick);
		return cnt;

	}

	// 회원가입
	@PostMapping("doJoin")
	@ResponseBody

	public int doJoin(@RequestBody MemberDto memberdto) {
		System.out.println(memberdto);
		int success = memberservice.doJoin(memberdto);
		System.out.println("성공:" + success);
		return success;
	}

	// 로그인
	@PostMapping("doLogin")
	@ResponseBody
	public ModelAndView doLogin(@ModelAttribute("inputDto") MemberDto inputDto, HttpSession session,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirect) throws IOException {
		System.out.println("로그인");
		System.out.println("입력한 아이디와 비밀번호:" + inputDto.getCustom_user_nick() + "/" + inputDto.getCustom_user_pwsd());

		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		// MemberDto getDto = memberservice.doLogin(inputDto);

		List<Map<Object, Object>> result = memberservice.doLogin(inputDto);

		if (result != null) {

			String custom_user_nick = result.get(0).get("custom_user_nick").toString();
			String custom_user_pwsd = result.get(0).get("custom_user_pwsd").toString();

			session = request.getSession();
			session.setAttribute("custom_user_nick", custom_user_nick);
			session.setAttribute("custom_user_pwsd", custom_user_pwsd);

			System.out.println("아이디  : " + custom_user_nick);
			System.out.println("비밀번호  : " + custom_user_pwsd);
			mav.setViewName("redirect:main");
		} else {
			redirect.addAttribute("result", "loginFail");
			writer.println("<script type='text/javascript'>");
			writer.println("alert('회원정보가 없습니다.');");
			writer.println("</script>");
			writer.flush();
			mav.setViewName("login");
		}
		return mav;

	}

	
	@GetMapping("doLogout")
	@ResponseBody
	public ModelAndView logout(HttpSession session, HttpServletRequest request) {
		System.out.println("로그아웃");

		ModelAndView mav = new ModelAndView();
		session = request.getSession();
		session.removeAttribute("custom_user_nick");
		
		mav.setViewName("redirect:login");
		return mav;
	}
}
