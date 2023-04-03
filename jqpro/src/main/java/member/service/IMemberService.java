package member.service;

import java.util.List;

import member.vo.MemberVO;
import member.vo.ZipVO;

public interface IMemberService {
	
	
	//member List
	public List<MemberVO> getAllMember();
	
	//가입(저장하기)
	public int insertMember(MemberVO vo);
	
	//id중복검사
	public String idCheck(String id);
	
	//우편번호찾기
	public List<ZipVO> selectByDong(String dong);

	
}
