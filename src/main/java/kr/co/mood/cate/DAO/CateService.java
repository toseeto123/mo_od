package kr.co.mood.cate.DAO;

import java.util.List;

import kr.co.mood.Product.VO.ProVO;
import kr.co.mood.cate.vo.CateVO;
import kr.co.mood.user.dao.UserVO;

public interface CateService {

	public List<CateVO> selectCateList(int user_no);
	
	public void addcate(CateVO cvo , UserVO uvo , ProVO pvo);
	
	public int modifyflashamount(int cate_id);
	
	public int modifyminusamount(int cate_id);
	
	public int dupcate(int pro_number , int user_no);
	
	public int deletecate(int cate_id);
}
