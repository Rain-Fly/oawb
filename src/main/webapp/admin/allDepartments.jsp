<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门管理</title>
    
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
    <form action="" method="post">
    	<table border="1px solid #0f0" width="100%">
    	    <caption>部门管理</caption>
    		<tr>
    			<th>部门名称</th>
    			<th>创建者</th>
    			<th>修改者</th>
    			<th>创建时间</th>
    			<th>修改时间</th>
    			<th>创建日期</th>
    			<th>修改日期</th>
    			<th>操作</th>
    		</tr>
    		<c:forEach items="${departments }" var="department">
    			<tr>
    				<td>${department.name }</td>
    				<td>${department.author }</td>
    				<td>${department.updater }</td>
    				<td>
						<fmt:formatDate value="${department.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    				</td>
    				<td>
    					<fmt:formatDate value="${department.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    				</td>
    				<td>
    					<fmt:formatDate value="${department.createDate }" pattern="yyyy-MM-dd"/>
    				</td>
    				<td>
    					<fmt:formatDate value="${department.updateDate }" pattern="yyyy-MM-dd"/>
    				</td>
    				<td>
    					<shiro:hasPermission name="department:update">
    						<a href="${pageContext.request.contextPath }/department/toUpdateDepartment?id=${department.id }">修改</a> &nbsp;&nbsp;
    					</shiro:hasPermission>
    					<shiro:hasPermission name="department:delete">
    						<a href="${pageContext.request.contextPath }/department/deleteDepartment?id=${department.id }" onclick="return confirm('是否确定删除？')">删除</a>
    					</shiro:hasPermission>
    				</td>
    			</tr>
    		</c:forEach>
    	</table>
    </form>
  </body>
</html>
