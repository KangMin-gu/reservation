package com.soccer.rv.field.dto;

import org.springframework.web.multipart.MultipartFile;

public class FieldDto {
	private int num;
	private String field_name;
	private String field_addr;
	private String field_morning;
	private String field_afternoon;
	private String field_night;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private MultipartFile file; //Spring 에서 파일 업로드 처리하기 위해
	private int viewCount;
	private int startRowNum;
	private int endRowNum;
	private float lat;
	private float lng;

	public FieldDto() {}

	public FieldDto(int num, String field_name, String field_addr, String field_morning, String field_afternoon,
			String field_night, String orgFileName, String saveFileName, long fileSize, MultipartFile file,
			int viewCount, int startRowNum, int endRowNum, float lat, float lng) {
		super();
		this.num = num;
		this.field_name = field_name;
		this.field_addr = field_addr;
		this.field_morning = field_morning;
		this.field_afternoon = field_afternoon;
		this.field_night = field_night;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.file = file;
		this.viewCount = viewCount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.lat = lat;
		this.lng = lng;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public String getField_addr() {
		return field_addr;
	}

	public void setField_addr(String field_addr) {
		this.field_addr = field_addr;
	}

	public String getField_morning() {
		return field_morning;
	}

	public void setField_morning(String field_morning) {
		this.field_morning = field_morning;
	}

	public String getField_afternoon() {
		return field_afternoon;
	}

	public void setField_afternoon(String field_afternoon) {
		this.field_afternoon = field_afternoon;
	}

	public String getField_night() {
		return field_night;
	}

	public void setField_night(String field_night) {
		this.field_night = field_night;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
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