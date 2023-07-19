package com.korea.k2.openApi;

import java.util.List;

public interface CompanyService {
	void insert(CompanyVO vo);
	void insertEv(EvSearchVO vo);
	
	List<CompanyVO> list(CompanyVO vo);
	List<EvSearchVO> listEv(EvSearchVO vo);
	
	CompanyVO selectOne(CompanyVO vo);
	EvSearchVO selectOneEv(EvSearchVO vo);
}
