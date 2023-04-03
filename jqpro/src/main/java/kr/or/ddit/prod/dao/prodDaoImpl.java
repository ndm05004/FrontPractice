package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.prod.vo.ProdVO;
import mybatis.config.MybatisSqlSessionFactory;

public class prodDaoImpl implements IprodDao {

	private static IprodDao dao;
	
	private prodDaoImpl() {
		
	}
	
	public static IprodDao getInstance() {
		if (dao==null) dao = new prodDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<ProdVO> selectIdName(String lgu) {
		SqlSession session = null; 
		
		List<ProdVO> list = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			list = session.selectList("prod.selectIdName", lgu);
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}



	@Override
	public ProdVO selectDetail(String prod_id) {
		SqlSession session = null; 
		
		ProdVO vo = null;
		try {
			session = MybatisSqlSessionFactory.getSqlSession();
			vo = session.selectOne("prod.selectDetail", prod_id);
		} finally {
			session.close();
		}
		return vo;
	}

}

