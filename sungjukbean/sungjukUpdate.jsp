<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdate.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
	<h3>* 성적 수정 *</h3>
    <p>
    	<a href="sungjukForm.jsp">[성적쓰기]</a>
    	<a href="sungjukList.jsp">[성적목록]</a>
    </p>
<%
	int sno=Integer.parseInt(request.getParameter("sno"));	
	dto=dao.read(sno);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
%>		
		<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
		    <input type="hidden" name="sno" value="<%=sno%>"> <!-- 수정하고자 하는 글번호 -->
			<table class="table">
			<tr>
			  <th class="info">이름</th>
			  <td><input type="text" name="uname" value="<%=dto.getUname()%>" maxlength="20" required autofocus class="form-control"></td>
			</tr> 
			<tr>
			  <th class="info">국어</th>
			  <td><input type="number" name="kor" value="<%=dto.getKor()%>" size="5" min="0" max="100" placeholder="숫자입력" class="form-control"></td>
			</tr> 
			<tr>
			  <th class="info">영어</th>
			  <td><input type="number" name="eng" value="<%=dto.getEng()%>" size="5" min="0" max="100" placeholder="숫자입력" class="form-control"></td>
			</tr> 
			<tr>
			  <th class="info">수학</th>
			  <td><input type="number" name="mat" value="<%=dto.getMat()%>" size="5" min="0" max="100" placeholder="숫자입력" class="form-control"></td>
			</tr> 
			<tr>
			  <th class="info">주소</th>
			  <td>
			  	  <% String addr=dto.getAddr(); %>
			      <select name="addr" class="form-control">
		              <option value="Seoul" <%if (addr.equals("Seoul")) {out.print("selected");}%>>서울</option>
		              <option value="Jeju"  <%if (addr.equals("Jeju"))  {out.print("selected");}%>>제주</option>
		              <option value="Suwon" <%if (addr.equals("Suwon")) {out.print("selected");}%>>수원</option>
		              <option value="Busan" <%if (addr.equals("Busan")) {out.print("selected");}%>>부산</option>
			      </select> 
			  </td>
			</tr> 
			<tr>
			  <td colspan="2" align="center">
			     <input type="submit" value="수정" class="btn btn-success">
			     <input type="reset"  value="취소" class="btn btn-danger">
			  </td>
			</tr>
			</table>
		</form>	
<%	
	}
%>	
  </div>
</body>
</html>