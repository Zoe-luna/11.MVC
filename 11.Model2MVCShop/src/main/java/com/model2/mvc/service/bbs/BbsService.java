package com.model2.mvc.service.bbs;

import com.model2.mvc.service.domain.Bbs;

public interface BbsService {
	
	public void addBbs(Bbs bbs) throws Exception;
	
	public Bbs getBbs(String userId) throws Exception;

}
