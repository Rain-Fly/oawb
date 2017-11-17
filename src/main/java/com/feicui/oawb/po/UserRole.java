package com.feicui.oawb.po;

import java.util.Date;

/**
 * 用户-角色
 * @author 李琳茹
 *
 */
public class UserRole {
	private int id;
	private String account;//用户账号
	private int roleID;//角色ID
	private String author;//创建者账号
	private String updater;//最后一次修改者账号
	private Date createTime;//创建时间
	private Date updateTime;//最后一次修改时间
	private Date createDate;//创建日期
	private Date updateDate;//最后一次修改日期
	private int isDeleted;//是否删除,0:未删除,1:删除
	
	public UserRole(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getRoleID() {
		return roleID;
	}

	public void setRoleID(int roleID) {
		this.roleID = roleID;
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
		return "UserRole [id=" + id + ", account=" + account + ", roleID=" + roleID + ", author=" + author
				+ ", updater=" + updater + ", createTime=" + createTime + ", updateTime=" + updateTime + ", createDate="
				+ createDate + ", updateDate=" + updateDate + "]";
	}
}
