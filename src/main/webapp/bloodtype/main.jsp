<%@page import="com.hexagon.mvc.model.BloodManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!BloodManager bloodManager = new BloodManager(); %>
<!-- 느낌표가 없으면 지역변수나 마찬가지. 요청마다 매번 인스턴스를 호출하게된다
느낌표로 인해 한번만 만들어지게 되는것이다 -->
<% 
String type = request.getParameter("type");
if (type == null)
	type = ""; 
String msg = bloodManager.getAdvice(type); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body><%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap은 head 아래 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
// 위에 제이쿼리가 임포트 되어있으므로 제이쿼리가 사용가능하다!
	function getResult(){
	//유저가 선택한 색상에 대한 결과 메세지얻기
	//form 이라는 말이 들어가면 항상 POST로 간다
	//파일을 많이 안만들려는 스파게티 코드 예제. 이곳에 전부 쓴다
		$("#form1").attr({
			action: "/bloodtype/main.jsp",
			method: "POST"		
		});
		$("#form1").submit();
	
	
	}

	$(function(){
		$("#bt").click(()=>{
			getResult();
		});
		
	})

</script>

</head>
<body>
	<!-- bootstrap은 항상 전체와 그 단위마다 div로 감싸야한다(부트스트랩 클래스를 주기위해) -->
	<div class="container">
		<!-- DOM 으로 진행 -->
		<form id="form1">

			<div class="form-group">
				<select class="form-control" name="type">
					<!-- 전송파라미터 -->
					<!-- selectd 속성을 서버측에서 부여하여 브라우저에 보내야 하는데 이때 사용자가 선택한 색상과 일치하는 option에 대해서만 selecte를 부여하면 된다
					날아온 value를 select창에서 유지함 -->
					<option value="">원하시는 색상을 선택하세요</option>
					<option value="A" <%if(type.equals("A")){%>selected<%}  %> >A</option>
					<!-- 각 값을 할당 -->
					<option value="B" <%if(type.equals("B")){%>selected<%}  %>>B</option>
					<option value="O" <%if(type.equals("O")){%>selected<%}  %>>O</option>
					<option value="AB" <%if(type.equals("AB")){%>selected<%}  %>>AB</option>
				</select>
			</div>
			<button class="btn btn-info" id="bt">결과 보기</button>
			<!-- used: .btn-info  -->

		</form>

		<h3>
			선택 결과: <br>
		</h3>
		<h5>
			<%=msg%>
		</h5>

	</div>
</body>
</html>
</html>