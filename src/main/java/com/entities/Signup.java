package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Signup 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userid;
    private String name;
    @Column(unique = true)
    private String email;
    private String password;
    private String city;
    private String type;
    private String status;
    private int point;
    
	public Signup(String name, String email, String password, String city, String type, int point, String status) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.city = city;
		this.type = type;
		this.point = point;
		this.status = status;
	}

	public Signup(int userid, String name, String email, String password, String gender, String city, String type) {
		super();
		this.userid = userid;
		this.name = name;
		this.email = email;
		this.password = password;
		this.city = city;
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Signup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}

