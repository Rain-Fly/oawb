<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>重置密码</title>
    
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
			$("input[type='submit']").click(function(){
				var newPassword = $("#newPassword").val();
				var rePassword = $("#rePassword").val();
				if($.trim(newPassword) != $.trim(rePassword)){
					alert("确认密码与新密码不一致！");
					return false;
				}
			});
		});
	</script>
  </head>
  
  <body>
  <c:if test="${pwdMsg != null }">
  <strong>警告：</strong><font style="color:red">${pwdMsg }</font>
  </c:if>
    <form action="${pageContext.request.contextPath }/user/resetPassword" method="post">
    	原密码：<input type="password" name="password" id="password"/>
    	<br/>
    	新密码：<input type="password" name="newPassword" id="newPassword"/>
    	<br/>
    	确认密码：<input type="password" name="rePassword" id="rePassword"/>
    	<br/>
    	<input type="reset" value="重置"/> &nbsp;&nbsp;
    	<input type="submit" value="提交"/>
    </form>
  </body>
</html>
