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
      int count = 7;
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
      

      List<Integer> pagingNo = new ArrayList<Integer>();
      for(int i = startPage; i <= endPage; i++) {
         pagingNo.add(i);
      }
      model.addAttribute("pagingNo", pagingNo);
   }
}