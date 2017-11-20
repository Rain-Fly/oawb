<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>编辑公司信息</title>
    
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
    <form action="${pageContext.request.contextPath }/company/updateCompany" method="post">
    	公司ID：<input type="text" name="id" value="${company.id }"/>
    	<br/>
    	公司名称：<input type="text" name="name" value="${company.name }">
    	<br/>
    	公司地址：<input type="text" name="address" value="${company.address }"/>
    	<br/>
    	联系人：
    	<select name="linkMan">
    	<c:forEach items="${users }" var="user">
    		<option value="${user.account }" 
    			<c:if test="${ user.account.equals(company.linkMan)}">selected="selected"</c:if>>
    			${user.realName }
    		</option>
    	</c:forEach>
    	</select>
    	<br/>
    	联系电话：<input type="text" name="tel" value="${company.tel }"/>
    	<br/>
    	<input type="reset" value="重置"/> &nbsp;&nbsp;
    	<input type="submit" value="提交"/>
    </form>
  </body>
</html>
