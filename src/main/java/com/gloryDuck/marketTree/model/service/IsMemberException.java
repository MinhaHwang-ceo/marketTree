package com.gloryDuck.marketTree.model.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IsMemberException extends Exception {// 에러 코드 값을 저장하기 위한 필드를 추가 했다.

	private final int ERR_CODE;// 생성자를 통해 초기화 한다.

	IsMemberException(String msg, int errCode, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // 생성자
		super(msg);
		ERR_CODE = errCode;
	}

	public IsMemberException(String msg, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {// 생성자
		this(msg, 100, request,response);// ERR_CODE를 100(기본값)으로 초기화한다.
	} 

	public int getErrCode() {// 에러 코드를 얻을 수 있는 메서드도 추가한다.
		return ERR_CODE;// 이 메서드는 주로 getMessage()와 함께 사용될 것이다.
	}

}