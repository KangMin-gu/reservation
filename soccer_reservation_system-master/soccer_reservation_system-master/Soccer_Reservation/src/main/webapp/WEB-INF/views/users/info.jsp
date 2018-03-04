<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="../include/header_script.jsp" %>
</head>
<body>
 <%@ include file="../include/header.jsp" %>
<!-- ===========소제목============ -->
<div class="container">
	<div class="row">
		<div class="divider col-sm-12 col-xs-12 col-md-12">
			<div class="header-text"> My <span>Information</span></div>
		</div>
	</div>
</div>

<!-- ============본문============== -->
    	<div class="container">
           <div class="row">
            	<div class="col-md-offset-2 col-md-8 text-center" >
                  <div class="panel">
                    <div class="panel-body">
 						<table id="infoTable" class="table table-hover">
 							<thead>
 								<tr>
 									<th class="cells" colspan="2"><h2>${dto.name }님의 회원 정보 입니다.</h2></th>
 								</tr>
 							</thead>	
 								<tbody>
 									<tr>
 										<td class="cell">아이디 :</td>
 										<td class="cell">${dto.id }</td>
 									</tr>									
 									<tr>
 										<td class="cell">전화번호 :</td> 								
 										<td class="cell">${dto.phone }</td>
 									</tr> 						
 									<tr>
 										<td class="cell">주소 :</td>								
 										<td class="cell">${dto.addr } &nbsp ${dto.detailaddr }</td>

 									</tr>
 									<tr>
 										<td class="cell">가입하신 날짜 :</td>									
 										<td class="cell">${dto.regdate }</td>
 									</tr>						
 								</tbody>
 						</table>
                            <div class="text-center">
                              <ul class="list-unstyled list-inline list-social-sq-primary">
                                <li><a class="btn btn-default" href="updateform.do">가입정보수정</a></li>
                                <li><a class="btn btn-default" href="${pageContext.request.contextPath}/reser/myreser.do">나의 예약정보 확인</a></li>
                                 <li><a class="btn btn-danger" href="delete.do">회원탈퇴</a></li>
                              </ul>
                          </div>
                        </div>
               		 </div>
             	</div>
             </div>
		</div>
		
<!-- ============FOOTER============= -->
<%@ include file="../include/footer.jsp" %>
<%@ include file="../include/footer_script.jsp" %>
</body>
</html>
	