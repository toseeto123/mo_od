package kr.co.mood.cate.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.mood.cate.vo.CateVO;

public class CateServiceImpl implements CateService{

	@Autowired CateDAO catedao;
	
	public List<CateVO> selectCateList(List<CateVO> vo) {
		return catedao.cateselect(vo);
	}

}
