package kr.co.mood.module;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;



@Component
public class ModuleCommon {

	@Autowired
	ViewPagingVO viewVO;

	private int showCount;
	private int indexNo;

	public ViewPagingVO pagingModule(Model model, ModuleVO ModuleVO, List allList, String page, int showCount) {

		this.showCount = showCount;
		pagingModuleMain(model, page, allList);
		ModuleVO.setStartNo(indexNo);
		ModuleVO.setEndNo(showCount);
		return this.viewVO;

	}

	public int[] pagingModuleToAdminPayment(Model model, ModuleVO ModuleVO, List allList, String page, int showCount) {

		this.showCount = showCount;
		pagingModuleMain(model, page, allList);
		int[] toSqlNo = {indexNo, showCount};
		return toSqlNo;

	}

	public void pagingModuleMain(Model model, String page, List allList) {

		int pageCount = 10;
		int quotient = Integer.parseInt(page) / pageCount;
		int remainder = Integer.parseInt(page) % pageCount;
		indexNo = (Integer.parseInt(page) - 1) * showCount;
		int startPageNo = (quotient * pageCount) + 1;
		int realEndPageNo = allList.size() / showCount;
		int endPageNo = quotient * pageCount + pageCount;
		int preStartPageNo = startPageNo - pageCount;
		int nextStartPageNo = startPageNo + pageCount;

		if (allList.size() % showCount > 0) {
			realEndPageNo = realEndPageNo + 1;
		}

		if (remainder == 0) {
			startPageNo = startPageNo - pageCount;
			endPageNo = endPageNo - pageCount;
			nextStartPageNo = nextStartPageNo - pageCount;
			preStartPageNo = preStartPageNo - pageCount;
		}

		if (endPageNo > realEndPageNo) {
			endPageNo = realEndPageNo;
		}

		List<Integer> allPagingList = new ArrayList<Integer>();

		for (int i = startPageNo; i <= endPageNo; i++) {
			allPagingList.add(i);
		}

		if (nextStartPageNo < realEndPageNo) {
			model.addAttribute("nextPage", nextStartPageNo);
			System.out.println(nextStartPageNo);
			viewVO.setNextPage(nextStartPageNo);
		}else {
			viewVO.setNextPage(0);
		}

		if (startPageNo > 1) {
			model.addAttribute("prePage", preStartPageNo);
			viewVO.setPrePage(preStartPageNo);
		}else {
			viewVO.setPrePage(0);
		}

		model.addAttribute("pagingNo", allPagingList);
		viewVO.setPagingNo(allPagingList);

		model.addAttribute("selectPage", page);
		viewVO.setPage(page);

	}
}