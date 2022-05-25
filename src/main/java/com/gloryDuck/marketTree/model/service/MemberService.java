package com.gloryDuck.marketTree.model.service;

import java.util.HashMap;

import com.gloryDuck.marketTree.model.vo.MemberEntity;

public interface MemberService {
	
	void failCntUpdate(String userId);
	
	void changeEnabled(String userId);
	
	void failEnabled(String userId);
	
	void lastLogin(String lastLogin ,String userId);

	MemberEntity getIsEnable(String userId);
	
	int getFailCnt(String userId);
	
	boolean getIsUser(String userId);
	
	boolean getPhone(String phone, String phone2);

	boolean getIsSnsUser(String username);
	
	boolean getIsSaveSnsNaver(String username);
	
	boolean getIsSaveSnsKakao(String username);

	int uploadSellerFiles(HashMap<String, Object> sELLER_DATA);

	void updateMyPass(String uid, String pw);

	boolean getIsLinkedUser(String userId);
	

}
