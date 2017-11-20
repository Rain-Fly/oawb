<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
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
    <form action="${pageContext.request.contextPath }/user/insertUser" method="post">
    	账号：<input type="text" name="account"/>
    	<br/>
    	初始密码：<input type="text" name="password" value="111111"/>
    	<br/>
    	用户名：<input type="text" name="realName"/>
    	<br/>
    	联系电话：<input type="text" name="tel"/>
    	<br/>
    	邮箱：<input type="text" name="email"/>
    	<br/>
    	性别：<input type="radio" name="sex" value="男" checked="checked"/>男
    		  <input type="radio" name="sex" value="女"/>女
    	<br/>
    	所在部门：
    	<select name="deptID">
    	<c:forEach items="${departments }" var="department">
    		<option value="${department.id }">${department.name }</option>
    	</c:forEach>
    	</select>
    	<br/>
    	所在公司：
    	<select name="companyID">
    	<c:forEach items="${companies }" var="company">
    		<option value="${company.id }">${company.name }</option>
    	</c:forEach>
    	</select>
    	<br/>
    	<input type="reset" value="重置"/> &nbsp;&nbsp;
    	<input type="submit" value="添加"/>
    </form>
  </body>
</html>
