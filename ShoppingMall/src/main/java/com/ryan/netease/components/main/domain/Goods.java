package com.ryan.netease.components.main.domain;

public class Goods {
	//商品id
	private int id;
	//标题
	private String title;
	//摘要
	private String summary;
	//正文
	private String content;
	//单价
	private int price;
	//图片来源   1：上传  2：网络
	private int pic;
	//图片地址
	private String picsrc;
	//卖家id
	private int sellerId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPic() {
		return pic;
	}

	public void setPic(int pic) {
		this.pic = pic;
	}

	public String getPicsrc() {
		return picsrc;
	}

	public void setPicsrc(String picsrc) {
		this.picsrc = picsrc;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	
	

}
