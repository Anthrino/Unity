package com.anthrino.unity.dto;

import java.io.Serializable;

public class SoftwareDto implements Serializable
{
	private static final long serialVersionUID = 1L;
	private int software_id;
	private String title;
	private String category = "software";
	private int price;
	private String description;
	private String platform, company;
	private int launch_year;
	private float rating;
	private String cover_dir;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getLaunch_year() {
		return launch_year;
	}
	public void setLaunch_year(int launch_year) {
		this.launch_year = launch_year;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public String getCover_dir() {
		return cover_dir;
	}
	public void setCover_dir(String cover_dir) {
		this.cover_dir = cover_dir;
	}
	public int getSoftware_id() {
		return software_id;
	}
	public void setSoftware_id(int software_id) {
		this.software_id = software_id;
	}
	
}
