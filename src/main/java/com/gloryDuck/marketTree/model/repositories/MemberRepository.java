package com.gloryDuck.marketTree.model.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.gloryDuck.marketTree.model.vo.MemberEntity;

@EnableJpaRepositories
public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
    Optional<MemberEntity> findByUserId(String userId);
    MemberEntity findByEmail(String email);
	MemberEntity findByUserCode(String code);
	MemberEntity findBySnsLoginKakaoMailAndOnlyParamNotNull(String string);
	MemberEntity findByOnlyParam(String onlyParam);
	MemberEntity findBySnsLoginNaverMailAndOnlyParamNotNull(String string);
	MemberEntity findByEmailAndOnlyParamNotNull(String name);
}
