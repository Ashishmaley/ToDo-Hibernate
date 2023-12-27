package com.entity;

import java.util.Date;
import java.util.Random;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "Note")
public class Note {
	@Id
	private int id;
	private String title;
	private String content;
	private Date time;
	
	public Note() {}

	public Note( String title, String content, Date time) {
		super();
		this.id = new Random().nextInt(10000);
		this.title = title;
		this.content = content;
		this.time = time;
	}
	
	public int getId() {
		return id;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Note [id=" + id + ", title=" + title + ", content=" + content + ", time=" + time + "]";
	}

	
	
}
