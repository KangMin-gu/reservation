package com.soccer.rv.reser.orderdto;

public class ResDto {
	private String field_name;
	private String field_date;
	
	public ResDto(){}

	public ResDto(String field_name, String field_date) {
		super();
		this.field_name = field_name;
		this.field_date = field_date;
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
	
	
}
