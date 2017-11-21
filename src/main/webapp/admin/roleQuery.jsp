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
    
    <title>角色查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="${pageContext.request.contextPath }/admin/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".menu").click(function(){
				var menu = $(".menu").is(":checked"); //返回true,false
				alert(menu);
				if(!menu){
					$(".permission").removeAttr("checked");
					$(".permission").attr("disabled",true);
				}else{
					$(".permission").attr("disabled",false);
				}
			});
		});
	</script>

  </head>
  
  <body>
    <form action="${pageContext.request.contextPath }/role/queryPermissionByRoleID" method="post">
    	<select name="roleID">
    		<option value="0">--请选择--</option>
    		<c:forEach items="${roles }" var="role">
    			<option value="${role.id }" 
    				<c:if test="${role.id == roleID }">selected="selected"</c:if>>
    				${role.name }
    			</option>
    		</c:forEach>
    	</select>
    	<input type="submit" value="查询"/>
    	<br/>
    	<c:forEach items="${permissions }" var="permission">
	  	    <c:if test="${permission.type == 'menu' }">
	   			<strong>${permission.name }</strong>
	   			<br/>
	   			<input type="checkbox" value="${permission.id }" name="permissionID" class="menu"/>显示菜单
	   		</c:if>
   			<c:if test="${permission.type == 'permission' }">
				<input type="checkbox" value="${permission.id }" name="permissionID" class="permission"
					<c:if test="${fn:contains(rolePermissions,permission) }">checked="checked"</c:if>/>
				${permission.name }
			</c:if>
			<br/>
    	</c:forEach>
    	<input type="button" value="修改"/>
    </form>
  </body>
</html>
