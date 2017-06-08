package model.mail;

import java.util.List;

import model.member.MemberBean;

public interface MailDAO {

	//  insert 
	MailBean insert(MailBean bean);
	
	// update
	MailBean update(MailBean bean);

	//選取
	MailBean getMailByPrimaryKey(MailBean bean);
	List<MailBean> getUnDeleteMails(MailBean bean);
	List<MailBean> getDeleteMails(MailBean bean);
	List<MailBean> getMails();
	List<MailBean> getReplyMails(Integer reid);
	List<MailBean> getUnReadMails(MailBean bean);
	List<MailBean> getReadMails(MailBean bean);
	//create method by Lin Teiu
	public List<MailBean> selectReportMails(MemberBean admin);
	//create method by Lin Teiu
	public List<MailBean> selectServiceMails(MemberBean admin);
	//create method by Lin Teiu
	public List<MailBean> selectJunkMails(MemberBean admin);
}