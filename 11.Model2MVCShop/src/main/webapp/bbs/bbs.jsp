
<%@page import="java.net.URLEncoder"%>
<%@page import="org.springframework.ui.Model"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <link href="/css/style.css" rel="stylesheet">  
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	

	</script>
	
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
   	 <!--  ///////////////////////// JavaScript ////////////////////////// -->
		<link href="/css/style.css" rel="stylesheet">

	</head>
	
  <body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<div class="row">
		
			<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd" >
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">��ȣ</th>
						<th style="background-color: #eeeeee; text-align: center;">����</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${bbs.bbsID }</td>
						<td>${bbs.bbsTitle }</td>
						<td>${bbs.userId }</td>
						<td>${bbs.bbsDate }</td>
					</tr>
				</tbody>
				
			</table>
				<a href="write.jsp" class="btn btn-primary pull-right">�۾���</a>
				
				<a href="chart.jsp" class="btn btn-primary pull-right">��Ʈ����</a>
		</div>
	  
 	</div>
  
</body>
</html>
    