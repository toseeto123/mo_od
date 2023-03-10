package kr.co.mood.module;

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
		int getPage = Integer.parseInt(page);//여기서 page는 restful방식으로 가져온 페이지
		int startPage = (getPage / 10) * 10 + 1;// 말그대로 시작 페이지 1,11 이거
		int count = 10;// 말 그대로 갯수
		if (getPage % 10 == 0) {
			startPage = startPage - count;//만약 10 20 30 일케 떨어질 때였ㅇㅆ고
		}
		paginVO.setStartNo(getPage * count - count);//이건 진짜 가져올 거 입력 값이고요
		paginVO.setEndNo(count);// 이건 말그대로 숫자고요
		int endPage = startPage + 9; //말그대로 끝 자리고요
		int allPage = allList.size()/count;
		if(allList.size()%10 > 0) {
			allPage = allPage+1;//말그대로 모든 페이지고요
		}
		if(allPage < endPage) {
			endPage = allPage;
		}
		
		System.out.println("restful방식으로 가져온 page값" + page);
		
		model.addAttribute("startPage", startPage);
		System.out.println("시작페이지" + startPage);
		System.out.println("끝페이지" + endPage);
		System.out.println("전체 페이지" + allPage);

	}
}
