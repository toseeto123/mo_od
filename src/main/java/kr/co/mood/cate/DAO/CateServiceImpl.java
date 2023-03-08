package kr.co.mood.cate.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

@Service
public class CateServiceImpl implements CateService{

	@Autowired CateDAO catedao;
	
	public List<CateVO> selectCateList(UserVO vo) {
		return catedao.cateselect(vo);
	}

	public CateVO check(CateVO vo) {
		return null;
	}

	public void addcate(CateVO cvo, UserVO uvo, ProVO pvo) {
		catedao.addcate(cvo, uvo, pvo);
	}

}
