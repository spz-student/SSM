<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
  <head>
  	<base target="rightFrame" href="${basePath}">
    <title>北大青鸟办公自动化管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${css}/style.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
  	<jsp:include page="common/indexTop.jsp"></jsp:include>
		<div class="main">
			<div class="global-width">
				<jsp:include page="common/indexSidebar.jsp" />
				<jsp:include page="common/indexRightbar.jsp" />
			</div>
		</div>
	<jsp:include page="common/indexBottom.jsp"></jsp:include>
  </body>
</html>
