package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("20171310@vision.hoseo.edu", "andtlf0302"); // 사용자에게 메일을 전송할 이메일 
	}
	
	
}
