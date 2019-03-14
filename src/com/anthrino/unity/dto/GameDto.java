package com.anthrino.unity.dto;

import java.io.Serializable;

public class GameDto implements Serializable
{
	private static final long serialVersionUID = 1L;
	private int game_id;
	private String title;
	private String category = "game";
	private int price, rent;
	private String description;
	private String cover_dir;
	private String platform, company;
	private int launch_year;
	private String trailer_link;
	private float rating;
	
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String string) {
		this.description = string;
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

	public int getLaunch_Year() {
		return launch_year;
	}

	public void setLaunch_Year(int launch_year) {
		this.launch_year = launch_year;
	}

	public String getTrailer_link() {
		return trailer_link;
	}

	public void setTrailer_link(String trailer_link) {
		this.trailer_link = trailer_link;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public int getGame_id() {
		return game_id;
	}

	public void setGame_id(int game_id) {
		this.game_id = game_id;
	}

	public String getCover_dir() {
		return cover_dir;
	}

	public void setCover_dir(String cover_dir) {
		this.cover_dir = cover_dir;
	}
	
}
