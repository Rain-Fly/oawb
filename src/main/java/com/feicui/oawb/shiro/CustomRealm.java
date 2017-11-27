package com.feicui.oawb.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.feicui.oawb.po.ActiveUser;
import com.feicui.oawb.po.Permission;
import com.feicui.oawb.po.User;
import com.feicui.oawb.service.UserService;

/**
 * 自定义realm
 * @author 李琳茹
 *
 */
public class CustomRealm extends AuthorizingRealm{

	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//从principals获取主身份信息
		ActiveUser activeUser = (ActiveUser) principals.getPrimaryPrincipal();
		//根据主身份信息获取权限信息
		List<Permission> permissionList = null;
		try {
			permissionList = userService.queryPermissionListByAccount(activeUser.getAccount());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<String> permissions = new ArrayList<String>();
		for(Permission permission:permissionList){
			permissions.add(permission.getPercode());
		}
		
		//返回授权信息
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions(permissions);
		
		return simpleAuthorizationInfo;
	}

	//认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String account = (String) token.getPrincipal();
		User user = null;
		try {
			user = userService.queryUserByAccount(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(user == null){
			return null;
		}
		
		String password = user.getPassword();
		String salt = user.getSalt();
		
		List<Permission> menus = null;
		try {
			menus = userService.queryMenuListByAccount(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Permission> permissions = null;
		try {
			permissions = userService.queryPermissionListByAccount(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActiveUser activeUser = new ActiveUser(account, user.getRealName(), menus, permissions);
		SimpleAuthenticationInfo authenticationInfo = 
				new SimpleAuthenticationInfo(activeUser, password, ByteSource.Util.bytes(salt), this.getName());
	
		return authenticationInfo;
	}
	
	//清除缓存
	public void clearCached(){
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}
}
