package com.gloryDuck.marketTree.model.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gloryDuck.marketTree.model.mappers.MemberMapper;
import com.gloryDuck.marketTree.model.service.IsMemberException;
import com.gloryDuck.marketTree.model.service.MemberService;
import com.gloryDuck.marketTree.model.vo.MemberEntity;

@Service
@Transactional(rollbackFor = {RuntimeException.class, Exception.class, IsMemberException.class})
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void failCntUpdate(String userId) {
		memberMapper.failCntUpdate(userId);
	}
	
	@Override
	public void changeEnabled(String userId) {
		memberMapper.changeEnabled(userId);
	}
	
	@Override
	public void failEnabled(String userId) {
		memberMapper.failEnabled(userId);
	}
	
	@Override
	public void lastLogin(String lastLogin ,String userId) {
		memberMapper.lastLogin(lastLogin, userId);
	}
	
	@Override
	public void updateMyPass(String uid ,String pw) {
		memberMapper.updateMyPass(uid, pw);
	}
	
	
	@Override
	public int uploadSellerFiles(HashMap<String, Object> sellerData) {
		int result = memberMapper.uploadSellerFiles(sellerData);
		return result;
	}
	
	@Override
	public MemberEntity getIsEnable(String userId) {
		MemberEntity member = memberMapper.getIsEnable(userId);
		
		return member;
	}
	
	@Override
	public int getFailCnt(String userId) {
		int cnt = memberMapper.getFailCnt(userId);
		
		return cnt;
	}
	
	@Override
	public boolean getIsUser(String userId) {
		boolean isUser = memberMapper.getIsUser(userId);
		return isUser;
	}
	
	
	@Override
	public boolean getPhone(String phone, String phone2) {
		boolean isUser = memberMapper.getPhone(phone, phone2);
		return isUser;
	}
	
	@Override
	public boolean getIsSnsUser(String userId) {
		boolean isUser = memberMapper.getIsSnsUser(userId);
		return isUser;
	}
	
	@Override
	public boolean getIsLinkedUser(String userId) {
		boolean isUser = memberMapper.getIsLinkedUser(userId);
		return isUser;
	}
	
	@Override
	public boolean getIsSaveSnsNaver(String userId) {
		boolean isUser =false;
			isUser = memberMapper.getIsSaveSnsNaver(userId);
		
		return isUser;
	}
	
	@Override
	public boolean getIsSaveSnsKakao(String userId) {
		boolean isUser =false;
			isUser = memberMapper.getIsSaveSnsKakao(userId);
		
		return isUser;
	}
	
}
