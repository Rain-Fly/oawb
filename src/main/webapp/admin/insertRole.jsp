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
    
    <title>添加角色</title>
    
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
			$("input[type='button']").click(function(){
				var name = $("#name").val();
				var permissionIDs = "";
				$("input[name='permissionID']").each(function(index,element){
					if($(element).is(":checked")){
						var permissionID = $(element).val();
						if(permissionID!=null && permissionID!=""){
							permissionIDs = permissionIDs + permissionID + ",";
						}
					}
				});
				
				$(location).attr("href","${pageContext.request.contextPath }/role/insertRole?permissionIDs="+permissionIDs+"&name="+name);
			});
		});
	</script>
  </head>
  
  <body>
    <c:if test="${roleMsg != null }">
  		<strong>警告：</strong><font style="color:red">${roleMsg }</font>
  	</c:if>
    <form action="#" method="post">
    	角色名称：<input type="text" name="name" id="name"/>
    	<br/>
    	<c:forEach items="${permissions }" var="permission">
    		<c:if test="${permission.type == 'menu' }">
    			<strong>${permission.name }</strong>
    			<br/>
    			<input type="checkbox" value="${permission.id }" name="permissionID" class="menu" />
    			显示菜单
    		</c:if>
    		<c:if test="${permission.type == 'permission' }">
    			<input type="checkbox" value="${permission.id }" name="permissionID" class="permission" />
    			${permission.name }
    		</c:if>
    		<br/>
    	</c:forEach>
    	<input type="button" value="添加"/>
    </form>
  </body>
</html>
