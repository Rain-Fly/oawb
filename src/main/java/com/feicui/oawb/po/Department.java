package com.feicui.oawb.po;

import java.util.Date;
/**
 * 部门
 * @author 李琳茹
 *
 */
public class Department {
	private int id;
	private String name;//部门名称
	private String author;//创建者账号
	private String updater;//最后一次修改者账号
	private Date createTime;//创建时间
	private Date updateTime;//最后一次修改时间
	private Date createDate;//创建日期
	private Date updateDate;//最后一次修改日期 
	
	public Department(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", author=" + author + ", updater=" + updater
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + "]";
	}
}
