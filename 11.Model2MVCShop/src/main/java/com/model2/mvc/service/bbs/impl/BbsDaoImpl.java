package com.model2.mvc.service.bbs.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.bbs.BbsDao;
import com.model2.mvc.service.domain.Bbs;

@Repository("bbsDaoImpl")
public class BbsDaoImpl implements BbsDao {
	
	///Field
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		
		public BbsDaoImpl() {
			System.out.println(this.getClass());
		}

	@Override
	public void addBbs(Bbs bbs) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("BbsMapper.addBbs", bbs);
	}

	@Override
	public Bbs getBbs(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BbsMapper.getBbs", userId);
	}

}
