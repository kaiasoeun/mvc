package com.hexagon.mvc.model;

public class BloodManager {
	
	public String getAdvice(String type) {
		
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
		return msg;
	}

}
