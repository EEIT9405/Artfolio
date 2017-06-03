package model.mail;

import java.util.List;

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

}