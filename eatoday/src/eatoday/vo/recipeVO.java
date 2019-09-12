package eatoday.vo;

public class recipeVO {
	
	private String cate; //카테고리
	private String cnum; //글번호(시퀀스아님)
	private String main_name; //사진파일이름
	private String title; //메뉴명
	private String mate; //재료
	private String pro; //조리법
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getMain_name() {
		return main_name;
	}
	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMate() {
		return mate;
	}
	public void setMate(String mate) {
		this.mate = mate;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}

	
}
