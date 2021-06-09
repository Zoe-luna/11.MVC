<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>

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
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>


<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

function fncGetList(currentPage){
   	$("#currentPage").val(currentPage)
	$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${ param.menu }").submit();
}

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp" />

<div style="width:98%; margin-left:10px;">
 
 <form name="detailForm">
 
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
							
							<c:if test="${ param.menu == 'manage' }">
								��ǰ ����
							</c:if>
							<c:if test="${ param.menu == 'search' }">
								��ǰ �����ȸ
							</c:if>
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>	

		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
				<option value="3"  ${ ! empty search.searchCondition && search.searchCondition==3 ? "selected" : "" }>��ǰ�з�</option>
			</select>
			<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : "" }"
					 class="ct_input_g" style="width:200px; height:19px" />
		</td>
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetList(1);">�˻�</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td/>
		<td/>
		<td/>
		<td colspan="11" >
			<a href="/product/listProduct?searchCondition=3&searchKeyword=1&menu=search">������ǰ</a>
			
			<a href="/product/listProduct?searchCondition=3&searchKeyword=2&menu=search">������ǰ</a>
			
			<a href="/product/listProduct?searchCondition=3&searchKeyword=3&menu=search">��̻�Ȱ</a>
			
			<a href="/product/listProduct?searchCondition=3&searchKeyword=4&menu=search">��ⱸ</a>
		</td>
	</tr>
	
	<tr>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�з�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">	
				<c:if test="${ param.menu == 'manage' }">
					<a href="/product/updateProduct?prodNo=${ product.prodNo }&menu=manage">${ product.prodName }</a>
				</c:if>
				<c:if test="${ param.menu == 'search' }">
					<a href="/product/getProduct?prodNo=${ product.prodNo }&menu=search">${ product.prodName }</a>
				</c:if>
			
			</td>
			<td></td>
			<td align="left">${product.price }</td>
			<td></td>
			<td align="left">
				<c:if test="${product.category == '1'}">
					������ǰ
				</c:if>
				<c:if test="${product.category == '2'}">
					������ǰ
				</c:if>
				<c:if test="${product.category == '3'}">
					��̻�Ȱ
				</c:if>
				<c:if test="${product.category == '4'}">
					��ⱸ
				</c:if>
			</td>
			<td></td>
			<td align="left">${product.regDate }
			</td>
			<td></td>
			<td align="left">
				<c:if test="${product.proTranCode == null}">
					�Ǹ���
				</c:if>
				<c:if test="${product.proTranCode == '1'}">
					���ſϷ�
				</c:if>
				<c:if test="${product.proTranCode == '2'}">
					�����
				</c:if>
				<c:if test="${product.proTranCode == '3'}">
					��ۿϷ�
				</c:if>
			
			</td>
			
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>


</table>

<!-- PageNavigation Start... -->

			<jsp:include page="../common/pageNavigator_new.jsp"/>	

<!-- PageNavigation End... -->

</form>

</div>
</body>
</html>
