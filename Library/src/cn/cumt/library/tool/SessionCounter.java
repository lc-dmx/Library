package cn.cumt.library.tool; 
import javax.servlet.http.*; 
;

public class SessionCounter implements HttpSessionListener { 

	private static int activesessions = 0; 

 public void sessionCreated(HttpSessionEvent se) { 
     activesessions++; 
 } 
 
 public void sessionDestroyed(HttpSessionEvent se) { 
  if(activesessions > 0) 
     activesessions--; 
 } 
 
 public static int getActivesessions() { 
    return activesessions; 
 } 
}