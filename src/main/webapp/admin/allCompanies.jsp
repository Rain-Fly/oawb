<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公司管理</title>
    
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
  <table border="1px solid #0f0" width="100%">
  <caption>公司管理</caption>
  	<tr>
  		<th>公司ID</th>
  		<th>公司名称</th>
  		<th>公司地址</th>
  		<th>联系人</th>
  		<th>联系电话</th>
  		<th>创建者</th>
  		<th>修改者</th>
  		<th>创建时间</th>
  		<th>修改时间</th>
  		<th>创建日期</th>
  		<th>修改日期</th>
  		<th>操作</th>
  	</tr>
  	<c:forEach items="${companies }" var="company">
    	<tr>
    		<td>${company.id }</td>
    		<td>${company.name }</td>
    		<td>${company.address }</td>
    		<td>${company.linkMan }</td>
    		<td>${company.tel }</td>
    		<td>${company.author }</td>
    		<td>${company.updater }</td>
    		<td>
    			<fmt:formatDate value="${company.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${company.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${company.createDate }" pattern="yyyy-MM-dd"/>
    		</td>
    		<td>
    			<fmt:formatDate value="${company.updateDate }" pattern="yyyy-MM-dd"/>
    		</td>
    		<td>
    			<a href="${pageContext.request.contextPath }/company/toUpdateCompany?id=${company.id}">修改</a>
    			&nbsp;&nbsp;
    			<a href="${pageContext.request.contextPath }/company/deleteCompany?id=${company.id}" onclick="return confirm('是否确定删除?')">删除</a>
    		</td>
    	</tr>
    </c:forEach>
  </table>

  </body>
</html>
