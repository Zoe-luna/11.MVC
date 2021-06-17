<%@page import="com.model2.mvc.service.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
	
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#confirm" ).on("click" , function() {
					self.location = "/product/listProduct?menu=search"
				});
		});
		
		
	</script>

<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
<br/><br/><br/><br/>
<h1 style="font-family:a옛날사진관4;">상품 상세 조회</h1>
<br/>
	<table class="table">	
		<!-- On rows -->
		<tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;상품명</b></td>
			<td width="825">&nbsp;&nbsp;${product.prodName}</td>
		</tr>
		<tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;상품상세정보</b></td>
			<td width="825">&nbsp;&nbsp;${product.prodDetail}</td>
		</tr>
			<tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;상품종류</b></td>
			
			<td class="ct_write01">
				<c:if test="${product.category == '1'}">
					식음료품
				</c:if>
				<c:if test="${product.category == '2'}">
					가전제품
				</c:if>
				<c:if test="${product.category == '3'}">
					취미생활
				</c:if>
				<c:if test="${product.category == '4'}">
					운동기구
				</c:if>
			</td>
			
		</tr>
		<tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;제조일자</b></td>
			<%-- <td width="825">&nbsp;&nbsp;${product.manuDate}</td> --%>
			<fmt:parseDate value="${product.manuDate }" var="date" pattern="yyyyMMdd" />
			<td width="825">&nbsp;&nbsp;s<fmt:formatDate value="${date }" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;가격</b></td>
			<%-- <td width="825">&nbsp;&nbsp;${product.price} 원</td> --%>
			<td width="825">&nbsp;&nbsp;<fmt:formatNumber value="${product.price }" pattern="#,###" />원</td>
		</tr>	
		<tr>
			<td class="success" width="135"><b>&nbsp;&nbsp;이미지</b></td>
			<img src = "/images/uploadFiles/${ product.fileName }"/>
			<td width="825">&nbsp;&nbsp;${product.fileName }</td>
		</tr>		
		
		<tr>
			<td width="135"></td>
			<td width="825"></td>
		</tr>	
	</table>
	

	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-success" id="confirm" >확 &nbsp;인</button>
		    </div>
	</div>

</body>
</html>