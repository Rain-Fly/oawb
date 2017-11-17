package com.feicui.oawb.po;

import java.util.Date;

/**
 * 公司
 * @author 李琳茹
 *
 */
public class Company {
	private int id;
	private String name;//公司名称
	private String address;//公司地址
	private String linkMan;//联系人
	private String tel;//联系人电话
	private String author;//创建者账号
	private String updater;//最后一次修改者账号
	private Date createTime;//创建时间
	private Date updateTime;//最后一次修改时间
	private Date createDate;//创建日期
	private Date updateDate;//最后一次修改日期
	private int isDeleted;//是否删除,0:未删除,1:删除
	
	public Company(){}

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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
	
	public int getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", name=" + name + ", address=" + address + ", linkMan=" + linkMan + ", tel=" + tel
				+ ", author=" + author + ", updater=" + updater + ", createTime=" + createTime + ", updateTime="
				+ updateTime + ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
}
