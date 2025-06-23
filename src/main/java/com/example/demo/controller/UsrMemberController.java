package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dto.Article;
import com.example.demo.dto.FileDto;
import com.example.demo.dto.LoginedMember;
import com.example.demo.dto.Member;
import com.example.demo.dto.Reply;
import com.example.demo.dto.Req;
import com.example.demo.dto.ResultData;
import com.example.demo.service.ArticleService;
import com.example.demo.service.FileService;
import com.example.demo.service.MemberService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;


@Controller
public class UsrMemberController {
	
	private ArticleService articleService;
	private MemberService memberService;
	private final ReplyService replyService;
	private final Req req;
	private final FileService fileService;
	
	public UsrMemberController(ArticleService articleService, MemberService memberService,ReplyService replyService, Req req, FileService fileService) {
		this.articleService = articleService;
		this.memberService = memberService;
		this.replyService = replyService;
		this.fileService = fileService;
		this.req = req;
	}
	
	@GetMapping("/usr/member/join")
	public String mainJoin() {
		return "usr/member/mainJoin"; 
	}
	
	@GetMapping("/usr/member/personalJoin")
	public String personalJoin() {
		return "usr/member/personalJoin"; 
	}
	
	@GetMapping("/usr/member/institutionJoin")
	public String institutionJoin() {
		return "usr/member/institutionJoin";  
	}
	
	@PostMapping("/usr/member/doPersonalJoin")
	@ResponseBody
	public String doPersonalJoin(String loginId, String loginPw, String nickname) {
		memberService.joinPersonalMember(loginId, loginPw, nickname);
		return Util.jsReplace(String.format("[ %s ] 님의 개인회원 가입이 완료되었습니다", nickname), "/");
	}
	
	@PostMapping("/usr/member/doInstitutionJoin")
	@ResponseBody
	public String doInstitutionJoin(
	    String loginId, 
	    String loginPw, 
	    String nickname, 
	    String institutionNumber, 
	    MultipartFile bizFile
	) throws IOException {
	    int memberId = memberService.joinInstitutionMember(loginId, loginPw, nickname, institutionNumber);
	    
	    if (!bizFile.isEmpty()) {
	        String savedName = fileService.saveFile(bizFile, "member", memberId);
	        memberService.updateWorkChkFile(memberId, savedName); 
	    }

	    String msg = String.format("[ %s ] 님, 가입 신청이 완료되었습니다. 관리자의 승인은 로그인 후 마이페이지에서 확인할 수 있습니다.", nickname);
	    return Util.jsReplace(msg, "/usr/member/myPage");
	}



	
	@GetMapping("/usr/member/nicknameDupChk")
	@ResponseBody
	public ResultData nicknameDupChk(String nickname) {
		Member member = memberService.getMemberBynickname(nickname);
		if (member != null) {
			return ResultData.from("F-1", String.format("[ %s ] 은(는) 이미 사용중인 닉네임입니다", nickname));
		}
		return ResultData.from("S-1", String.format("[ %s ] 은(는) 사용가능한 닉네임입니다", nickname));
	}
	
	@GetMapping("/usr/member/loginIdDupChk")
	@ResponseBody
	public ResultData loginIdDupChk(String loginId) {
		Member member = memberService.getMemberByLoginId(loginId);
		if (member != null) {
			return ResultData.from("F-1", String.format("[ %s ] 은(는) 이미 사용중인 아이디입니다", loginId));
		}
		return ResultData.from("S-1", String.format("[ %s ] 은(는) 사용가능한 아이디입니다", loginId));
	}
	

	@GetMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@PostMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw) {
		
		Member member = this.memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return Util.jsReplace(String.format("[ %s ] 은(는) 존재하지 않는 회원입니다", loginId), "login");
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			return Util.jsReplace("비밀번호가 일치하지 않습니다", "login");
		}
		
		this.req.login(new LoginedMember(member.getId(), member.getAuthLevel(), member.getNickname(), member.getApproveStatus()));

		
		return Util.jsReplace(String.format("[ %s ] 님 환영합니다", member.getLoginId()), "/");
	}
	
	@GetMapping("/usr/member/logout")
	@ResponseBody
	public String logout() {
		
		this.req.logout();
		
		return Util.jsReplace("정상적으로 로그아웃 되었습니다", "/");
	}
	
	@GetMapping("/usr/member/myPage")
	public String showMyPage(Model model) {
	    LoginedMember loginedMember = req.getLoginedMember();

	    if (loginedMember == null || loginedMember.getId() == 0) {
	        return "redirect:/usr/member/login";
	    }

	    Member member = memberService.getMemberById(loginedMember.getId());

	    List<Article> myArticles = articleService.getArticlesByMemberId(member.getId());
	    List<Article> likedArticleList = articleService.getLikedArticlesByMemberId(member.getId());
	    List<Reply> myReplies = replyService.getReplyByMemberId(member.getId());
	    List<Article> pendingArticleList = articleService.getPendingArticlesByMemberId(member.getId());

	    FileDto workChkFile = null;
	    if (member.getWorkChkFileId() != null) {
	        workChkFile = fileService.getFileById(member.getWorkChkFileId());
	    }

	    model.addAttribute("workChkFile", workChkFile);

	    model.addAttribute("myArticles", myArticles);
	    model.addAttribute("member", member);
	    model.addAttribute("likedArticles", likedArticleList);
	    model.addAttribute("pendingArticles", pendingArticleList);
	    model.addAttribute("myReplies", myReplies);

	    return "usr/member/myPage";
	}
	
	@GetMapping("/usr/member/reupload")
	public String showReuploadForm(Model model) {
	    LoginedMember loginedMember = req.getLoginedMember();
	    if (loginedMember == null) {
	        return "redirect:/usr/member/login";
	    }

	    model.addAttribute("member", memberService.getMemberById(loginedMember.getId()));
	    return "usr/member/reupload"; 
	}

	@PostMapping("/usr/member/reupload")
	public String doReupload(@RequestParam("workCertFile") MultipartFile file) throws IOException {
	    LoginedMember loginedMember = req.getLoginedMember();
	    if (loginedMember == null) {
	        return "redirect:/usr/member/login";
	    }

	    memberService.saveWorkCertFile(loginedMember.getId(), file);
	    memberService.updateApproveStatus(loginedMember.getId(), 0); 
	    return "redirect:/usr/member/myPage"; 
	}

	



	
	




}