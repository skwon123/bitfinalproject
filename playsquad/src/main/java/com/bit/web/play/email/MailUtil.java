package com.bit.web.play.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	public static void naverMailSend(String receiver, String subject, String text) {
        final String host = "smtp.naver.com"; // ���̹��� ��� ���̹� ����, gmail��� gmail ����
        final String user = "hwfrzy@naver.com"; // �н�����
        final String password = "GR7HSMPKRJ6T";

        // SMTP ���� ������ �����Ѵ�.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress("hwfrzy@naver.com"));

            // ���� ����
            message.setSubject(subject);

            // ���� ����
            message.setText(text);

            // send the message
            Transport.send(message);
            System.out.println("Success Message Send");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
