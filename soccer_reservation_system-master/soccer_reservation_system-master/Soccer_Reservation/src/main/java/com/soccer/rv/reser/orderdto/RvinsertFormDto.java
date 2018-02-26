package com.soccer.rv.reser.orderdto;

public class RvinsertFormDto {
	
	private String field_name;
	private String field_date; 
	private String rv_time;
	private String id;
	private String team;
	private String phone;
	private int teamNP;
	private String etc;
	
	public RvinsertFormDto(){}

	public RvinsertFormDto(String field_name, String field_date, String rv_time, String id, String team, String phone,
			int teamNP, String etc) {
		super();
		this.field_name = field_name;
		this.field_date = field_date;
		this.rv_time = rv_time;
		this.id = id;
		this.team = team;
		this.phone = phone;
		this.teamNP = teamNP;
		this.etc = etc;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public String getField_date() {
		return field_date;
	}

	public void setField_date(String field_date) {
		this.field_date = field_date;
	}

	public String getRv_time() {
		return rv_time;
	}

	public void setRv_time(String rv_time) {
		this.rv_time = rv_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTeamNP() {
		return teamNP;
	}

	public void setTeamNP(int teamNP) {
		this.teamNP = teamNP;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	
}
