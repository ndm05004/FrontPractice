package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import member.vo.MemberVO;
import member.vo.ZipVO;
import mybatis.config.MybatisSqlSessionFactory;

/*
 * 자신의 객체를 생성해서 리턴하는 매소드
 * mapper에 접근하여 sql문을 실행 - SqlSession 객체가 필요 SqlSessionFactory 생성
 */

public class MemberDaoImpl implements IMemberDao {

	
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
	}
	
	public static IMemberDao getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<MemberVO> getAllMember() {
		// SqlSession 객체 필요
		
		SqlSession session = null;
				
		List<MemberVO> list =null;
		try {	
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.getAllMember");	
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int insertMember(MemberVO vo) {
		
		int cnt = 0;
		
		SqlSession session = null;
				
		try {	
			session = MybatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("member.insertMember", vo);	
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public String idCheck(String id) {
		
		SqlSession session = null;
		
		String res ="";
		try {	
			session = MybatisSqlSessionFactory.getSqlSession();
			res = session.selectOne("member.idCheck", id);	
		} finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		
		SqlSession session = null;
		
		List<ZipVO> list =null;
		try {	
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("member.selectByDong", dong);	
		} finally {
			session.close();
		}
		
		return list;
	}

	/*
	public int insertMember(MemberVO vo) {
		int a =0;
		
		SqlSession session = sessionFactory.openSession(true);
		try {
			a = session.insert("namespace이름.sql의 id이름",vo);
		} finally {
			session.close();
		}
		
		return a;
	}
	*/
}