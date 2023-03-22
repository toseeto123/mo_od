package kr.co.mood.Payment.DAO;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.mood.Payment.VO.AdminChartVO;
import kr.co.mood.Payment.VO.AdminPaymentVO;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.module.ModuleVO;
import kr.co.mood.module.ViewPagingVO;
import kr.co.mood.user.dao.UserVO;

@Service
public class AdminPaymentService {
	@Autowired
	AdminPaymentDAO dao;
	@Autowired
	ModuleCommon module;
	
	public void getCategoryChart(Model model) {
		String year =LocalDate.now().toString().split("-")[0];
		List<AdminChartVO> chart1 = dao.getCategoryChart1();
		List<AdminChartVO> chart2 = dao.getCategoryChart2();
		List<AdminChartVO> chart3 = dao.getCategoryChart3(year);
		List<AdminChartVO> chart4 = dao.getCategoryChart4(year);
		model.addAttribute("chart1", chart1);
		model.addAttribute("chart2", chart2);
		model.addAttribute("chart3", chart3);
		model.addAttribute("chart4", chart4);		
	}
	
	public void adminPaymentList(Model model, String num) {
		List<AdminPaymentVO> allMemberList = dao.adminPaymentMemberList(0,0);
		int[] no = module.pagingModuleToAdminPayment(model, allMemberList, num, 1);
		List<AdminPaymentVO> showMemberList = dao.adminPaymentMemberList(no[0], no[1]);
		List<AdminPaymentVO> payList = dao.adminPaymentList();
		Map<Integer, List<AdminPaymentVO>> map = new HashMap<Integer, List<AdminPaymentVO>>();
		for(AdminPaymentVO memberVO : showMemberList) {
			List<AdminPaymentVO> list = new ArrayList<AdminPaymentVO>();
			for(AdminPaymentVO payVO : payList) {
				if(memberVO.getOrderNo() == payVO.getOrderNo()) {
					list.add(payVO);
				}
			}
			map.put(memberVO.getOrderNo(), list);
		}
		model.addAttribute("member", showMemberList);
		model.addAttribute("map", map);
	
		}
	
	public Map<String, Object> adminPaymentSearchingList(Model model, String paging, String searchWhat, String search) {
		   ModuleVO moduleVO = new ModuleVO();
		   Map<String, Object> map = new HashMap<String, Object>();
		   if(search.equals("(none)")) {
			   search = null;		   
		   }else {
			   if(searchWhat.equals("name")) {
				   moduleVO.setSearchName(search);
			   }else if(searchWhat.equals("orderNo")) {
				   moduleVO.setOrderNo(search);
			   }else if(searchWhat.equals("payDate")) {
				   moduleVO.setDate(search);
			   }else if(searchWhat.equals("phone")) {
				   moduleVO.setPhone(search);
			   }
		   }
		   System.out.println();
		   List<AdminPaymentVO> memberSearchingAllList = dao.adminPaymentSearchingList(moduleVO);
		   ViewPagingVO viewVO = module.pagingModule(model, moduleVO, memberSearchingAllList, paging, 1);
		   List<AdminPaymentVO> memberSearchingShowList = dao.adminPaymentSearchingList(moduleVO);
		   List<AdminPaymentVO> productList = dao.adminPaymentList();
		   System.out.println(memberSearchingShowList);
		   map.put("list", memberSearchingShowList);
		   map.put("vo", viewVO);
		   map.put("productList", productList);
		   return map;
	}
	
	
}
