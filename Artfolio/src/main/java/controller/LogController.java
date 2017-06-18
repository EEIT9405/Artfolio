package controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import model.log.LogBean;
import model.log.LogService;
import model.mail.MailBean;
import model.mail.MailService;
import model.member.LoginService;
import model.member.MemberBean;

@Controller
public class LogController {
	@Autowired
	private LogService logService;
	@Autowired
	private MailService mailService;
	@Autowired
	private ServletContext application;
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/mail/replyAdminMail.controller", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String replyMailAndLog(@SessionAttribute("loginOK") MemberBean admin, MailBean mail,
			BindingResult bindingResult) {
		if (admin != null && (admin.getMid().equals(1) || admin.getMid().equals(2)) && mail != null
				&& !bindingResult.hasErrors()) {
			// 取得完整有mailId的Bean
			MailBean mb = mailService.selectByPrimaryKey(mail);
			// 將預設管理員id(1)更改為讀信處理的管理員id
			mb.setToId(admin.getMid());
			mailService.update(mb);

			// 回信給會員
			mail.setMemberBean(admin);
			mail.setToId(mb.getMemberBean().getMid());
			mail.setReid(mail.getMailid());
			mail.setMailtitle("Re:" + mb.getMailtitle());
			mail.setMailid(null);
			// mail.setToId(mb.getMemberBean().getMid());
			MailBean result = mailService.insert(mail);
			// 新增日誌
			WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(application);
			LogBean lb = (LogBean) context.getBean("logBean");
			MemberBean targetBean = loginService.selectById(mail.getToId());
			lb.setAdminBean(admin);
			lb.setLogcontent(mail.getMailcontent());
			lb.setTargetBean(targetBean);
			if (((int) mail.getMstatus()) == 2) {
				lb.setLogtype(true);
			}
			if (((int) mail.getMstatus()) == 3) {
				lb.setLogtype(false);
			}
			lb.setLstatus(false);
			logService.createLog(lb);
			if (result != null) {
				return "寄送成功";
			}
		}
		return "失敗，請重新寄送";
	}

	@RequestMapping(value = "/updateLogStatus.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public LogBean updateLogStatus(Integer logid) {
		if (logid != null) {
			LogBean bean = logService.getLogBean(logid);
			bean.setLstatus(true);
			return logService.updateLog(bean);
		}
		return null;
	}

	@RequestMapping(value = "/selectAllLog.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<LogBean> getAllLog(@SessionAttribute("loginOK") MemberBean admin) {
		if (admin != null && admin.getMid().equals(1) || admin.getMid().equals(2)) {
			return logService.getAllLog(true, true);
		}
		return null;
	}

	@RequestMapping(value = "/sendToAdminMail.controller", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String sendToAdmin(@SessionAttribute("loginOK") MemberBean user, MailBean mail,
			BindingResult bindingResult) {
		if (user != null && mail != null && !bindingResult.hasErrors()) {
			mail.setMemberBean(user);
			if (mailService.insert(mail) != null) {
				return "感謝您的意見，客服將於24小時內回覆";
			}
		}
		return "失敗，請登入後重新寄送";
	}
	
	@RequestMapping(value = "/sendToAuthorMail.controller", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String sendToAuthor(@SessionAttribute("loginOK") MemberBean user, MailBean mail,
			BindingResult bindingResult) {
		if (user != null && mail != null && !bindingResult.hasErrors()) {
			mail.setMemberBean(user);
			if (mailService.insert(mail) != null) {
				return "已成功寄出";
			}
		}
		return "失敗，請登入後重新寄送";
	}

	@RequestMapping(value = "/mail/showAdminMails.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MailBean> selectAdminMails(@SessionAttribute("loginOK") MemberBean admin, int reportOrService) {
		if (admin != null && (admin.getMid().equals(1) || admin.getMid().equals(2))) {
			if (reportOrService == 1)
				return mailService.getAdminMails(admin, true);
			else if (reportOrService == 0)
				return mailService.getAdminMails(admin, false);
			else
				return mailService.getAdminMails(admin, null);
		}
		return null;
	}

	@RequestMapping(value = "/mail/showReIdMails.controller", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MailBean> selectReIdMails(@SessionAttribute("loginOK") MemberBean admin, int mailid) {
		if (admin != null && (admin.getMid().equals(1) || admin.getMid().equals(2))) {
			List<MailBean> mailList = mailService.selectByReId(mailid);
			return mailList;
		}
		return null;
	}
}
