<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body><%@ page contentType="text/html; charset=UTF-8"%>
<%
//클라이언트가 전송한 색상 파라미터 받기
String type = request.getParameter("type");
if (type == null)
	type = ""; //최초에는 전송된 파라미터가 없으므로 디폴트값을 강제로 부여하자
out.print("유저가 전송한 혈액형은 " + type);

String msg = null; //지역변수니까
String pick = null;
switch (type) {
	case "A" :
		pick = "A형";
		msg = "배려심 넘치는 완벽주의자";
		break;

	case "B" :
		pick = "B형";
		msg = "솔직하고 자유로운 마이웨이";
		break;

	case "O" :
		pick = "O형";
		msg = "에너지 넘치는 분위기 메이커";
		break;
	case "AB" :
		pick = "AB형";
		msg = "예측 불허의 반전 매력가";
		break;
	default :
		msg = "혈액형을 아직 선택하지 않았네요";

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
			선택 결과: <%=pick %><br>
		</h3>
		<h5>
			<%=msg%>
		</h5>

	</div>
</body>
</html>
</html>