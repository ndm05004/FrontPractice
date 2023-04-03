package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.IprodDao;
import kr.or.ddit.prod.dao.prodDaoImpl;
import kr.or.ddit.prod.vo.ProdVO;

public class ProdServiceImpl implements IProdService {

	private static IProdService service;
	private IprodDao dao;
	
	private ProdServiceImpl() {
		dao = prodDaoImpl.getInstance();
	}
	
	public static IProdService getInstance() {
		if(service==null) service = new ProdServiceImpl();
		return service;
	}
	
	
	@Override
	public List<ProdVO> selectIdName(String lgu) {
		return dao.selectIdName(lgu);
	}

	@Override
	public ProdVO selectDetail(String prod_id) {
		// TODO Auto-generated method stub
		return dao.selectDetail(prod_id);
	}

}
