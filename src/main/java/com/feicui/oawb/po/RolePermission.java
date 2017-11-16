package com.feicui.oawb.po;

import java.util.Date;

/**
 * 角色-权限
 * @author 李琳茹
 *
 */
public class RolePermission {
	private int id;
	private int roleID;//角色ID
	private int permissionID;//资源权限ID
	private String author;//创建者账号
	private String updater;//最后一次修改者账号
	private Date createTime;//创建时间
	private Date updateTime;//最后一次修改时间
	private Date createDate;//创建日期
	private Date updateDate;//最后一次修改日期
	
	public RolePermission(){}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	public int getPermissionID() {
		return permissionID;
	}
	public void setPermissionID(int permissionID) {
		this.permissionID = permissionID;
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
		return "RolePermission [id=" + id + ", roleID=" + roleID + ", permissionID=" + permissionID + ", author="
				+ author + ", updater=" + updater + ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + "]";
	}
}
