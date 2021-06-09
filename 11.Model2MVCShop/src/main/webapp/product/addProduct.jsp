<%@page import="org.springframework.ui.Model"%>
<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
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
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Odibee+Sans&display=swap" rel="stylesheet">
   
   <style>

   
   tr,	td {
   		font-size: 20px;
   		margin-bottom: 50;
   	}
	
.button {
  border-radius: 4px;
  background-color: pink;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 15px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
	
	
	</style>
   
   
   
	
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#confirm" ).on("click" , function() {
					self.location = "/product/listProduct?menu=manage"
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#reset" ).on("click" , function() {
					self.location = "/product/addProduct"
				});
			});	

		
	</script>
	
</head>	

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
<br/><br/><br/><br/>
<h1>��ǰ���</h1>
<br/>
	<table class="table">	
		<!-- On rows -->
		<tr>
			<td width="135">��ǰ��</td>
			<td width="825">${product.prodName}</td>
		</tr>
		<tr>
			<td width="135">��ǰ������</td>
			<td width="825">${product.prodDetail}</td>
		</tr>
		<tr>
			<td width="135">��������</td>
			<td width="825">${product.manuDate}</td>
		</tr>
		<tr>
			<td width="135">����</td>
			<td width="825">${product.price} ��</td>
		</tr>	
		<tr>
			<td width="135">��ǰ����</td>
			
			<td>
			<select 	name="category"	class="form-control"
							style="width: 150px; height: 50px" maxLength="20">
				<option value="1" selected="selected">������ǰ</option>
				<option value="2">������ǰ</option>
				<option value="3">��̻�Ȱ</option>
				<option value="4">��ⱸ</option>
			</select>
			
			</td>
		</tr>	
		<tr>
			<td width="135">�̹���</td>
			<td width="825">${product.fileName}</td>
		</tr>		
		
		<tr>
			<td width="135"></td>
			<td width="825"></td>
		</tr>	
	</table>
	

	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="button" id="confirm" ><span>Ȯ &nbsp;��</span></button>
			  <button type="button" class="button" id="reset" ><span>�߰����</span></button>
		    </div>
	</div>


</body>
</html>