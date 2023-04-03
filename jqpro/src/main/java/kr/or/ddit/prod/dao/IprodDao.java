package kr.or.ddit.prod.dao;

import java.util.List;

import kr.or.ddit.prod.vo.ProdVO;

public interface IprodDao {

	
	public List<ProdVO> selectIdName(String lgu);
	
	public ProdVO selectDetail(String prod_id);	
	
}
