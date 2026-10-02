package com.hexagon.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hexagon.mvc.model.BloodManager;

public class BloodController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * javaEE에서의 컨트롤러의 5대 역할
		 * 1) 요청을 받는다
		 * 2) 요청을 분석한다(클라이언트가 무엇을 원하는지 분석, 그리고 적절한 모델 객체를 선택)
		 * 우리의 경우 BloodController가 Blood 관련된 것만 처리하기 때문에 여기서의 분석은 필요없다
		 * 3) 일 시킨다(컨트롤러는 로직을 수행하는 영역이 아니기 때문에 언제나 모델 영역에 일을 시킨다)
		 * 4) 결과 페이지에서 보여줄 것이 있다면 결과를 저장(request(o), session(x), aplication(x)
		 * 5) 결과 페이지를 보여준다
		 * */
		
		BloodManager bloodManager = new BloodManager(); 
		String type = request.getParameter("type");
				
		if (type == null)
			type = ""; 
		String msg = bloodManager.getAdvice(type); 
		
		request.setAttribute("msg", msg);

		RequestDispatcher dis =request.getRequestDispatcher("/bloodtype/main.jsp");
		dis.forward(request, response); //포워딩시 새로운 request, response를 만드는게 아니라 현재 요청에 사용된 request, response가 그래도 살아서 전달된다
	}
	
}
