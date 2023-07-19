package com.korea.k2.openApi;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDaoImpl implements CompanyDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CompanyVO vo) {
		mybatis.insert("OpenApi.INSERT", vo);
	}

	@Override
	public void insertEv(EvSearchVO vo) {
		mybatis.insert("OpenApi.EVINSERT", vo);
	}

	@Override
	public List<CompanyVO> list(CompanyVO vo) {

		return mybatis.selectList("OpenApi.SELECT", vo);
	}

	@Override
	public List<EvSearchVO> listEv(EvSearchVO vo) {
		
		return mybatis.selectList("OpenApi.EVSELECT", vo);
	}

	@Override
	public CompanyVO selectOne(CompanyVO vo) {

		return mybatis.selectOne("OpenApi.SELECTONE", vo);
	}

	@Override
	public EvSearchVO selectOneEv(EvSearchVO vo) {

		return mybatis.selectOne("OpenApi.EVSELECTONE", vo);
	}

}
