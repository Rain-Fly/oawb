<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <title>角色列表</title>
    
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
  <script type="text/javascript">
  	$(function(){
  		$("input[type='button']").click(function(){
  			var id = $(this).attr("text");
  			var isChecked = $("#isAvailable"+id).is(":checked");
  			var isAvailable = isChecked?0:1;
  			window.location.href = "${pageContext.request.contextPath }/role/updateRoleAvailable?id="+id+"&isAvailable="+isAvailable;
  		});
  	});
  </script>
  
  <body>
  	<table border="1px solid red" width="100%">
  		<caption>角色列表</caption>
  		<tr>
  			<th>角色名称</th>
  			<th>创建者</th>
  			<th>修改者</th>
  			<th>创建时间</th>
  			<th>修改时间</th>
  			<th>创建日期</th>
  			<th>修改日期</th>
  			<th>是否可用</th>
  			<shiro:hasPermission name="role:updateIsAvailable">
  				<th>修改</th>
  			</shiro:hasPermission>
  		</tr>
  		<c:forEach items="${roles }" var="role">
  		<tr>
  			<td>${role.name }</td>
  			<td>${role.author }</td>
  			<td>${role.updater }</td>
  			<td>
  				<fmt:formatDate value="${role.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
  			</td>
  			<td>
  				<fmt:formatDate value="${role.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
  			</td>
  			<td>
  				<fmt:formatDate value="${role.createDate }" pattern="yyyy-MM-dd"/>
  			</td>
  			<td>
  				<fmt:formatDate value="${role.updateDate }" pattern="yyyy-MM-dd"/>
  			</td>
  			<td>
  				<input type="checkbox" name="isAvailable" id="isAvailable${role.id}"
  					<c:if test="${role.isAvailable == '是' }">checked="checked"</c:if>/>是
  			</td>
  			<shiro:hasPermission name="role:updateIsAvailable">
	  			<td>
	  				<input type="button" value="修改" text="${role.id}" />
	  			</td>
  			</shiro:hasPermission>
  		</tr>
  		</c:forEach>
  	</table>
  </body>
</html>
