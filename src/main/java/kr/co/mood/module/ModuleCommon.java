package kr.co.mood.module;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.co.mood.Product.VO.ProPaginVO;

@Component
public class ModuleCommon {
	
	@Autowired
	ProPaginVO paginVO;
	
	public void pagingModule(Model model, String page, ProPaginVO paginVO, List allList) {
		int getPage = Integer.parseInt(page);
		int startPage = (getPage / 10) * 10 + 1;
		int count = 10;
		if (getPage % 10 == 0) {
			startPage = startPage - count;
		}
		paginVO.setStartNo(getPage * count - count);
		paginVO.setEndNo(count);
		int endPage = startPage + 9;
		int allPage = allList.size()/count;
		if(allList.size()%10 > 0) {
			allPage = allPage+1;
		}
		if(allPage < endPage) {
			endPage = allPage;
		}
		
		System.out.println("restful방식으로 가져온 page값" + page);
		List<Integer> pagingNo = new ArrayList<Integer>();
		for(int i = startPage; i <= endPage; i++) {
			pagingNo.add(i);
			System.out.println(pagingNo);
		}
		model.addAttribute("pagingNo", pagingNo);
		System.out.println("시작페이지" + startPage);
		System.out.println("끝페이지" + endPage);
		System.out.println("전체 페이지" + allPage);

	}
}
