package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("20171310@vision.hoseo.edu", "andtlf0302"); // ����ڿ��� ������ ������ �̸��� 
	}
	
	
}
