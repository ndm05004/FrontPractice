package kr.or.ddit.lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.lprod.vo.LprodVO;
import mybatis.config.MybatisSqlSessionFactory;

public class LprodDaoImpl implements ILprodDao {

	
	private static ILprodDao dao;
	
	
	private LprodDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public static ILprodDao getInstance() {
		if(dao==null) dao = new LprodDaoImpl();
		
		return dao;
	} 
	
	
	@Override
	public List<LprodVO> selectAll() {
		
		SqlSession session = null; 
		
		List<LprodVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("lprod.selectAll");
			
		} finally {
			session.close();
		}
		
		return list;
		
	}

}
