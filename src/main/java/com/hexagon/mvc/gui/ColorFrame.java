package com.hexagon.mvc.gui;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;

import com.hexagon.mvc.model.ColorManager;

//웹 아닌 스탠다드 개발 (웹기반으로 제작했던 color 선택 앱을 javase의 GUI으로 구현해보자
public class ColorFrame extends JFrame {
	JComboBox<String> box; //String 타입만 넣을것이라는 걸 명시
	JButton bt;
	JLabel la_msg;
	ColorManager colorManager; 

	
	
	public ColorFrame() {
		box = new JComboBox<String>();
		bt = new JButton("결과보기");
		la_msg = new JLabel();
		colorManager = new ColorManager();
		
		
		box.addItem("원하시는 색상을 선택하세요");
		box.addItem("red");
		box.addItem("blue");
		box.addItem("green");
		box.addItem("yellow");
		
		//스타일 지정
		
		//조립
		setLayout(new FlowLayout());
		add(box);
		add(bt);
		add(la_msg);
		
		//리스너 연결
		//리스너 구현체를 내부 익명 클래스로 구현하면 그나마 코드량을 줄일 수 잇지만 
		// 여전히 다른 언어 등에 비해 이벤트 연결 코드 거창하다..이 문제를 해결하려면?
		// 함수형 프로그래밍 방법인 익명함수로 처리.. 하지만 JAVA에서는 람다라고 함
		//js의 화살표함수같은 역할
		bt.addActionListener((e)->{
			//System.out.println("나 눌렀어?");
			String color = (String) box.getSelectedItem();
			String msg = colorManager.getAdvice(color);
			la_msg.setText(msg);
		});
		
		setSize(300, 250);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	public static void main(String[] args) {
		new ColorFrame();
	}

}
