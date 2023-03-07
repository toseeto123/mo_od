package kr.co.mood.cate.DAO;

import java.util.List;

import kr.co.mood.cate.vo.CateVO;

public interface CateService {

	public List<CateVO> selectCateList(List<CateVO> vo);
}
