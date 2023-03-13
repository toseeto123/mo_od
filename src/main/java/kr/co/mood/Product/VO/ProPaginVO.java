package kr.co.mood.Product.VO;

import org.springframework.stereotype.Repository;

@Repository
public class ProPaginVO {
	private int startNo;
	private int endNo;
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
}
