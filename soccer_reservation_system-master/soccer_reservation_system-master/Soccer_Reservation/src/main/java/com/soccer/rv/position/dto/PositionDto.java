package com.soccer.rv.position.dto;

public class PositionDto {
	private int num;
	private String title;
	private float lat;
	private float lng;
	
	public PositionDto(){}

	public PositionDto(int num, String title, float lat, float lng) {
		super();
		this.num = num;
		this.title = title;
		this.lat = lat;
		this.lng = lng;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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