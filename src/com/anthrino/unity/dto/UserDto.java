package com.anthrino.unity.dto;

import java.io.Serializable;

public class UserDto implements Serializable
{
	private static final long serialVersionUID = 1L;
	private int user_id;
	private String password;
	private String email;
	private String f_name,l_name;
	private String m_no, address;
	private boolean prime;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int isPrime() {
		if(prime==false)
			return 0;
		return 1;
	}
	public void setPrime(boolean prime) {
		this.prime = prime;
	} 

}
