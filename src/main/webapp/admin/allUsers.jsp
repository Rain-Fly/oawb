<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    
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
    <table border="1px solid red" width="100%">
    	<caption>用户管理</caption>
    	<tr>
    		<th>账号</th>
    		<th>使用者姓名</th>
    		<th>账号是否锁定</th>
    		<th>创建者</th>
    		<th>修改者</th>
    		<th>创建时间</th>
    		<th>修改时间</th>
    		<th>创建日期</th>
    		<th>修改日期</th>
    		<th>联系电话</th>
    		<th>邮箱</th>
    		<th>性别</th>
    		<th>所在部门</th>
    		<th>所在公司</th>
    		<th>操作</th>
    	</tr>
    	<c:forEach items="${users }" var="user">
    	<tr>
    		<td>${user.account }</td>
    		<td>${user.realName }</td>
    		<td>${user.locked }</td>
    		<td>${user.author }</td>
    		<td>${user.updater }</td>
    		<td>
    			<fmt:formatDate value="${user.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${user.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${user.updateDate }" pattern="yyyy-MM-dd"/>
    		</td>
    		<td>${user.tel }</td>
    		<td>${user.email }</td>
    		<td>${user.sex }</td>
    		<td>${user.deptID }</td>
    		<td>${user.companyID }</td>
    		<td>
    			<a href="${pageContext.request.contextPath }/user/toUpdateUser?account=${user.account}">修改</a> &nbsp;&nbsp;
    			<a href="${pageContext.request.contextPath }/user/deleteUser?account=${user.account}" onclick="return confirm('是否确定删除？')">删除</a>
    		</td>
    	</tr>
    	</c:forEach>
    </table>
  </body>
</html>
