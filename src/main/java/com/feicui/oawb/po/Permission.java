package com.feicui.oawb.po;

import java.util.Date;
/**
 * 权限
 * @author 李琳茹
 *
 */
public class Permission {
	private int id;
	private String name;//资源名称
	private String type;//资源类型
	private String url;//访问URL地址
	private String percode;//权限代码字符串,eg:user:create
	private int parentID;//父结点id
	private String parentIDs;//父结点id列表串
	private int sort;//排序号
	private String isAvailable;//是否可用
	private String author;//创建者账号
	private String updater;//最后一次修改者账号
	private Date createTime;//创建时间
	private Date updateTime;//最后一次修改时间
	private Date createDate;//创建日期
	private Date updateDate;//最后一次修改日期 
	
	public Permission(){}

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPercode() {
		return percode;
	}

	public void setPercode(String percode) {
		this.percode = percode;
	}

	public int getParentID() {
		return parentID;
	}

	public void setParentID(int parentID) {
		this.parentID = parentID;
	}

	public String getParentIDs() {
		return parentIDs;
	}

	public void setParentIDs(String parentIDs) {
		this.parentIDs = parentIDs;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
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
		return "Permission [id=" + id + ", name=" + name + ", type=" + type + ", url=" + url + ", percode=" + percode
				+ ", parentID=" + parentID + ", parentIDs=" + parentIDs + ", sort=" + sort + ", isAvailable="
				+ isAvailable + ", author=" + author + ", updater=" + updater + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
}
