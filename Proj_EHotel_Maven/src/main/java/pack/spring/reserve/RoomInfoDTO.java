package pack.spring.reserve;

public class RoomInfoDTO {
	
	private int rNum;
	private String hCode;
	private String rName;
	private String rCode;
	private int rPeople;
	private int rCnt;
	private int rPrice;
	
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String gethCode() {
		return hCode;
	}
	public void sethCode(String hCode) {
		this.hCode = hCode;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrCode() {
		return rCode;
	}
	public void setrCode(String rCode) {
		this.rCode = rCode;
	}
	public int getrPeople() {
		return rPeople;
	}
	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}
	public int getrCnt() {
		return rCnt;
	}
	public void setrCnt(int rCnt) {
		this.rCnt = rCnt;
	}
	public int getrPrice() {
		return rPrice;
	}
	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
	}

	
}
