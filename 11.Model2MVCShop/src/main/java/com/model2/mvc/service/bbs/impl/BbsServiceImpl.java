package com.model2.mvc.service.bbs.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.bbs.BbsDao;
import com.model2.mvc.service.bbs.BbsService;
import com.model2.mvc.service.domain.Bbs;

@Service("bbsServiceImpl")
public class BbsServiceImpl implements BbsService {

	@Autowired
	@Qualifier("bbsDaoImpl")
	private BbsDao bbsDao;
	public void setBbsDao(BbsDao bbsDao) {
		this.bbsDao = bbsDao;
	}
	
	public BbsServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	
	@Override
	public void addBbs(Bbs bbs) throws Exception {
		// TODO Auto-generated method stub
		bbsDao.addBbs(bbs);
	}

	@Override
	public Bbs getBbs(String userId) throws Exception {
		// TODO Auto-generated method stub
		return bbsDao.getBbs(userId);
	}

}
