package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AddForm {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int formid;
	private String title;
	private String imagename;
	private String schedule;
	@Column(length = 15000)
	private String content;
	private int slots;
	private int capacity;
	private int grp;

	public AddForm(int slots, int capacity, String title, String content, int grp, String imagename, String schedule) {
		super();
		this.title = title;
		this.content = content;
		this.slots = slots;
		this.capacity = capacity;
		this.grp = grp;
		this.imagename = imagename;
		this.schedule = schedule;
	}

	public AddForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSlots() {
		return slots;
	}

	public void setSlots(int slots) {
		this.slots = slots;
	}

	public int getFormid() {
		return formid;
	}

	public void setFormid(int formid) {
		this.formid = formid;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public String getImagename() {
		return imagename;
	}

	public void setImagename(String imagename) {
		this.imagename = imagename;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

}
