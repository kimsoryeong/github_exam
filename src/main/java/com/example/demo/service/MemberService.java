package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Member;

@Service
public class MemberService {

	private MemberDao memberDao;
	
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	// 개인회원 가입
	public void joinPersonalMember(String loginId, String loginPw, String nickname) {
		memberDao.joinPersonalMember(loginId, loginPw, nickname);
	}

	 public int joinCompanyMember(String loginId, String loginPw, String companyName, String companyNumber) {
	        Member member = new Member();
	        member.setLoginId(loginId);
	        member.setLoginPw(loginPw);
	        member.setCompanyName(companyName);
	        member.setCompanyNumber(companyNumber);
	        member.setAuthLevel(2);

	        memberDao.joinCompanyMember(member);

	        return member.getId();  // insert 후 자동으로 id가 채워짐
	    }


	public Member getMemberByLoginId(String loginId) {
		return this.memberDao.getMemberByLoginId(loginId);
	}


	public Member getMemberBynickname(String nickname) {
		return this.memberDao.getMemberBynickname(nickname);
	}

}