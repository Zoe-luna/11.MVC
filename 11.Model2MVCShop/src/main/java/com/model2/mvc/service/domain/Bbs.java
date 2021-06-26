package com.model2.mvc.service.domain;

import java.sql.Date;

public class Bbs {

		private int bbsID;
		private String bbsTitle;
		private String userId;
		private Date bbsDate;
		private String bbsContent;
		
		public int getBbsID() {
			return bbsID;
		}
		
		public void setBbsID(int bbsID) {
			this.bbsID = bbsID;
		}
		public String getBbsTitle() {
			return bbsTitle;
		}
		public void setBbsTitle(String bbsTitle) {
			this.bbsTitle = bbsTitle;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public Date getBbsDate() {
			return bbsDate;
		}
		public void setBbsDate(Date bbsDate) {
			this.bbsDate = bbsDate;
		}
		public String getBbsContent() {
			return bbsContent;
		}
		public void setBbsContent(String bbsContent) {
			this.bbsContent = bbsContent;
		}
		
}
