package com.soccer.rv.users.dto;

public class UsersDto {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private String post;
	private String addr;
	private String detailaddr;
	private String findQuestion;
	private String findAnswer;
	private String regdate;
	private float lat;
	private float lng;
	
	public UsersDto(){}

	public UsersDto(String id, String name, String pwd, String email, String phone, String post, String addr,
			String detailaddr, String findQuestion, String findAnswer, String regdate, float lat, float lng) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.post = post;
		this.addr = addr;
		this.detailaddr = detailaddr;
		this.findQuestion = findQuestion;
		this.findAnswer = findAnswer;
		this.regdate = regdate;
		this.lat = lat;
		this.lng = lng;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailaddr() {
		return detailaddr;
	}

	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}

	public String getFindQuestion() {
		return findQuestion;
	}

	public void setFindQuestion(String findQuestion) {
		this.findQuestion = findQuestion;
	}

	public String getFindAnswer() {
		return findAnswer;
	}

	public void setFindAnswer(String findAnswer) {
		this.findAnswer = findAnswer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public float getLat() {
		return lat;
	}

	public void setLat(float lat) {
		this.lat = lat;
	}

	public float getLng() {
		return lng;
	}

	public void setLng(float lng) {
		this.lng = lng;
	}

	
}