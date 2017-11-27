<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>welcome</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    welcome  ${activeUser.account }号员工,${activeUser.realName }<br>
    <a href="${pageContext.request.contextPath }/logout">退出</a> <br><br>
    <shiro:hasPermission name="department">
    <strong>部门管理</strong>
    <ul>
    	<li>
    		<shiro:hasPermission name="department:insert">
    			<a href="${pageContext.request.contextPath }/admin/insertDepartment.jsp">添加部门</a>
    		</shiro:hasPermission>
    	</li>
    	<li>
    		<shiro:hasPermission name="department:query">
    			<a href="${pageContext.request.contextPath }/department/queryAllDepartments">部门管理</a>
    		</shiro:hasPermission>
    	</li>
    </ul>
    </shiro:hasPermission>
    <shiro:hasPermission name="company">
    <strong>公司管理</strong>
    <ul>
    	<li>
    		<shiro:hasPermission name="company:insert">
    			<a href="${pageContext.request.contextPath }/company/toInsertCompany">添加公司</a>
    		</shiro:hasPermission>
    	</li>
    	<li>
    		<shiro:hasPermission name="company:query">
    			<a href="${pageContext.request.contextPath }/company/queryAllCompanies">管理公司</a>
    		</shiro:hasPermission>
    	</li>
    </ul>
    </shiro:hasPermission>
    <shiro:hasPermission name="user">
    <strong>用户管理</strong>
    <ul>
    	<li>
    		<shiro:hasPermission name="user:insert">
    			<a href="${pageContext.request.contextPath }/user/toInsertUser">添加用户</a>
    		</shiro:hasPermission>
    	</li>
    	<li>
    		<shiro:hasPermission name="user:query">
    			<a href="${pageContext.request.contextPath }/user/queryAllUsers">管理用户</a>
    		</shiro:hasPermission>
    	</li>
    	<li>
    		<shiro:hasPermission name="user:queryRole">
    			<a href="${pageContext.request.contextPath }/user/toUserRole">用户角色管理</a>
    		</shiro:hasPermission>
    	</li>
    </ul>
    </shiro:hasPermission>
    <shiro:hasPermission name="me">
    <strong>个人中心</strong>
    <ul>
    	<li>
    		<shiro:hasPermission name="password:reset">
    			<a href="${pageContext.request.contextPath }/admin/resetPassword.jsp">重置密码</a>
    		</shiro:hasPermission>
    	</li>
    </ul>
    </shiro:hasPermission>
    <shiro:hasPermission name="role">
    <strong>角色管理</strong>
    <ul>
    	<li>
    		<shiro:hasPermission name="role:insert">
    			<a href="${pageContext.request.contextPath }/role/toInsertRole">添加角色</a>
    		</shiro:hasPermission>
    	</li>
    	<li>
    		<shiro:hasPermission name="role:queryPermission">
    			<a href="${pageContext.request.contextPath }/role/toRoleQuery">角色权限管理</a>
    		</shiro:hasPermission>
    	</li>
    	<li>
    		<shiro:hasPermission name="role:query">
    			<a href="${pageContext.request.contextPath }/role/queryAllRoles">角色列表</a>
    		</shiro:hasPermission>
    	</li>
    </ul>
    </shiro:hasPermission>
  </body>
</html>
