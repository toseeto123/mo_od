package kr.co.mood.module;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class ViewPagingVO {
	private int nextPage;
	private int prePage;
	private List<Integer> pagingNo;
	private String page;
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public List<Integer> getPagingNo() {
		return pagingNo;
	}
	public void setPagingNo(List<Integer> pagingNo) {
		this.pagingNo = pagingNo;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	
}
