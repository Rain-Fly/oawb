<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户角色</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script src="${pageContext.request.contextPath }/admin/js/jquery-3.2.1.min.js"></script> 
  <script>
  	$(function(){
  		$("input[type='button']").click(function(){
  			var account = $("select").val();
  			var roleIDs = "";
  			$("input[name='roleID']").each(function(index,element){
  				if($(element).is(":checked")){
  					var roleID = $(element).val();
  					if(roleID!=null && roleID!=""){
  						roleIDs = roleIDs + roleID +",";
  					}
  				}
  			});
  			window.location.href = "${pageContext.request.contextPath }/user/updateUserRole?account="+account+"&roleIDs="+roleIDs;
  		});
  	});
  </script>
  
  <body>
  	<form action="${pageContext.request.contextPath }/user/queryRoleByAccount" method="post">
  		<select name="account">
  			<option value="0">--请选择--</option>
  			<c:forEach items="${users }" var="user">
  				<option value="${user.account }" 
  					<c:if test="${user.account == account }">selected="selected"</c:if>>
  				${user.account }${user.realName }</option>
  			</c:forEach>
  		</select>
	  	<input type="submit" value="查询"/>
		<br/>
		<strong>角色</strong>
		<br/>
		<c:forEach items="${roles }" var="role">
			<input type="checkbox" name="roleID" value="${role.id }" 
				<c:if test="${fn:contains(userRoles,role) }">checked="checked"</c:if>/>
			${role.name }
			<br/>
		</c:forEach>
		<input type="button" value="修改"/>
  	</form>
  </body>
</html>
