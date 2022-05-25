package com.gloryDuck.marketTree.model.mappers;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.gloryDuck.marketTree.model.vo.MemberEntity;

@Mapper
public interface MemberMapper {

	void failCntUpdate(String userId);
	
	MemberEntity getIsEnable(String userId);
	
	int getFailCnt(String userId);
	
	void changeEnabled(String userId);
	
	void failEnabled(String userId);
	
	void lastLogin(String lastLogin, String userId);
	
	boolean getIsUser(String userId);
	
	boolean getIsSnsUser(String userId);
	
	boolean getIsLinkedUser(String userId);

	boolean getPhone(String phone, String phone2);

	boolean getIsSaveSnsNaver(String userId);
	
	boolean getIsSaveSnsKakao(String userId);

	int uploadSellerFiles(HashMap<String, Object> sellerData);

	void updateMyPass(String uid, String pw);
	
}
