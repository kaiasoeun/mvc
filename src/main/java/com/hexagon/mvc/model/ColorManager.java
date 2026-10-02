package com.hexagon.mvc.model;

public class ColorManager {

	public String getAdvice(String color) {
		

		String msg = null; // 지역변수니까
		switch (color) {
		case "red":
			msg = "일단 저지르고 보는 열정파! '일단 출발하고 길은 가서 생각하자' 타입이라 행동력은 최고지만, 가끔 자기 열정에 주변 사람들까지 싹 다 태워버리곤 합니다.";
			break;

		case "blue":
			msg = "차가울 정도로 침착하고 이성적인 완벽주의자. 약속 시간에 5분 일찍 와서 '너 3분 늦었어'라고 말할 것 같은 느낌이지만, 막상 큰 문제 생기면 제일 믿음직하게 해결해 주는 츤데레입니다.";
			break;

		case "green":
			msg = "'좋은 게 좋은 거지~'를 입에 달고 사는 평화주의자. 남의 말 잘 들어주고 공감도 잘하지만, 주말에 집 밖에 나가자고 하면 갑자기 영혼이 탈곡되는 전형적인 집돌이,집순이입니다.";
			break;
		case "yellow":
			msg = "어디서나 스포트라이트를 받는 4차원 에너자이저! 호기심이 넘쳐서 온갖 일을 다 벌이고 다니지만, 마무리는 항상 다른 색깔 친구들의 몫이 되는 귀여운 사고뭉치입니다.";
			break;
		default:
			msg = "색상을 아직 선택하지 않았네요";

		}
		return msg;

	}

}
