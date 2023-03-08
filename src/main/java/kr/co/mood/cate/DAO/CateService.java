package kr.co.mood.cate.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

public interface CateService {

	public List<CateVO> selectCateList(UserVO vo);
	
	public void addcate(CateVO cvo , UserVO uvo , ProVO pvo);
	
}
