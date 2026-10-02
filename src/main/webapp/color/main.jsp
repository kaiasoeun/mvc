<%@page import="com.hexagon.mvc.model.ColorManager"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%! %>
<%
//클라이언트가 전송한 색상 파라미터 받기
//지금부터 MVC로 철저히 나누어서 개발해야한다
//view(디자인)만을 담당해야하는 jsp 코드에 controller로의 코드가 섞여있으므로
//디자인을 버리고 다른 디자인 소스로 대체할 경우 controller가 함께 날아가버린다
//즉 완전히 분리시키지 못한 상태 == 모델 1 방식의 개발이라 함....


%>
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
			action: "/color",
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
				<select class="form-control" name="color">
					<!-- 전송파라미터 -->
					<!-- selectd 속성을 서버측에서 부여하여 브라우저에 보내야 하는데 이때 사용자가 선택한 색상과 일치하는 option에 대해서만 selecte를 부여하면 된다
					날아온 value를 select창에서 유지함 -->
					<option value="">원하시는 색상을 선택하세요</option>
					<option value="red">빨강</option>
					<!-- 각 값을 할당 -->
					<option value="blue" >파랑</option>
					<option value="green">초록</option>
					<option value="yellow">노랑</option>
				</select>
			</div>
			<button class="btn btn-info" id="bt">결과 보기</button>
			<!-- used: .btn-info  -->

		</form>

		<h3>
			선택 결과: <br>
		</h3>
		<h5>
		<!-- 개발자가 서버를 중지한 적이 없다면 msg는 언제나 꺼내쓸수있다 -->
			<%=request.getAttribute("msg") %>
		</h5>

	</div>
</body>
</html>