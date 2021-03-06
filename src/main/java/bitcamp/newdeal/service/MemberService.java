package bitcamp.newdeal.service;

import java.util.List;

import bitcamp.newdeal.domain.Member;

public interface MemberService {

	List<Member> list();

    Member getMember(String id, String password);

    int register(Member member);

    Member myInfo(int memberNo);

    int myInfoModify(Member member);

    String checkId(String id);

	Member checkGId(String id);

	Member getGMember(String id);

	 int dropID(String id);

}
