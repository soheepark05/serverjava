package com.kh.mvc.member.model.service;

import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();

	public Member login(String id, String password) {
		Member member = dao.findMemberById(id);
		
		if(member != null && member.getPassword().equals(password)) {
			return member;			
		} else {
			return null;
		}
	}
}
