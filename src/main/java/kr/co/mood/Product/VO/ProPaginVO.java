package kr.co.mood.Product.VO;

import org.springframework.stereotype.Repository;

@Repository
public class ProPaginVO {
	private int StartNo;
	private int endNo;
	public int getStartNo() {
		return StartNo;
	}
	public void setStartNo(int startNo) {
		StartNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
}
