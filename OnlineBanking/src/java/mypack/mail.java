/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mail {
    public static void sendMail(String rec,String sub,String msg) throws Exception
    {
        System.out.println("Preparing!!!!!...");
        Properties pro=new Properties();
         pro.put("mail.smtp.auth","true");
         pro.put("mail.smtp.starttls.enable","true");
         pro.put("mail.smtp.host","smtp.gmail.com");
         pro.put("mail.smtp.port","587");
         pro.put("mail.smtp.ssl.trust","*");
         
         String myaccount="happybank202@gmail.com";
         String password="asarbwlsagggcnkp";    //ndhdkfoiluuxuant
         
         Session session=Session.getInstance(pro,new Authenticator()
         {
            @Override
            protected PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(myaccount,password);
            }
         });
         Message message=prepareMessage(session,myaccount,rec,sub,msg);
         
        Transport.send(message);
        System.out.println("Message sent successfully");
    }
    
    private static Message prepareMessage(Session session,String myaccount,String rec,String sub,String msg)
    {
        try{
            Message message=new MimeMessage(session);
            message.setFrom(new InternetAddress(myaccount));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(rec));
            message.setSubject(sub);
            message.setText(msg);
//            String html="<h1>we love JAVA</h1><br/><h2>Yoo booisssss</h2>";
//            message.setContent(html,"text/html");
            return message;
        }catch(Exception ex)
        {
            Logger.getLogger(mail.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }
}
