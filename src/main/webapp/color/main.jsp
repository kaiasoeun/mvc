<%@ page contentType="text/html; charset=UTF-8"%>
<%
//클라이언트가 전송한 색상 파라미터 받기
String color = request.getParameter("color");
if (color == null)
	color = ""; //최초에는 전송된 파라미터가 없으므로 디폴트값을 강제로 부여하자
out.print("유저가 전송한 색상은 " + color);

String msg = null; //지역변수니까
switch (color) {
	case "red" :
		msg = "일단 저지르고 보는 열정파! '일단 출발하고 길은 가서 생각하자' 타입이라 행동력은 최고지만, 가끔 자기 열정에 주변 사람들까지 싹 다 태워버리곤 합니다.";
		break;

	case "blue" :
		msg = "차가울 정도로 침착하고 이성적인 완벽주의자. 약속 시간에 5분 일찍 와서 '너 3분 늦었어'라고 말할 것 같은 느낌이지만, 막상 큰 문제 생기면 제일 믿음직하게 해결해 주는 츤데레입니다.";
		break;

	case "green" :
		msg = "'좋은 게 좋은 거지~'를 입에 달고 사는 평화주의자. 남의 말 잘 들어주고 공감도 잘하지만, 주말에 집 밖에 나가자고 하면 갑자기 영혼이 탈곡되는 전형적인 집돌이,집순이입니다.";
		break;
	case "yellow" :
		msg = "어디서나 스포트라이트를 받는 4차원 에너자이저! 호기심이 넘쳐서 온갖 일을 다 벌이고 다니지만, 마무리는 항상 다른 색깔 친구들의 몫이 되는 귀여운 사고뭉치입니다.";
		break;
	default :
		msg = "색상을 아직 선택하지 않았네요";

}
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
			action: "/color/main.jsp",
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
					<option value="red" <%if(color.equals("red")){%>selected<%}  %> >빨강</option>
					<!-- 각 값을 할당 -->
					<option value="blue" <%if(color.equals("blue")){%>selected<%}  %>>파랑</option>
					<option value="green" <%if(color.equals("green")){%>selected<%}  %>>초록</option>
					<option value="yellow" <%if(color.equals("yellow")){%>selected<%}  %>>노랑</option>
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