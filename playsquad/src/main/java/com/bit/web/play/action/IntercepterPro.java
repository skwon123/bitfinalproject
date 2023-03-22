package com.bit.web.play.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Slf4j
public class IntercepterPro extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.debug("preHandle");
		//or
		log.debug("preHandle : {}", request.getParameter("user_id"));
		log.debug("preHandle : {}", request.getParameter("user_passwd"));

		String user_id=request.getParameter("user_id");
		String user_passwd=request.getParameter("user_passwd");		
		if(!(user_id.equals("Admin")&& user_passwd.equals("1234"))) {
			response.sendRedirect("intercepterMvc/adminLogin.jsp");
			return false; 
		}
		return true;
		
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle");
		System.out.println(modelAndView.getModel().get("message"));
		modelAndView.getModel().put("message", "ModifyMessage");

			
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ex="+ex);
		System.out.println("afterCompletion");

		
	}	

}



















//package com.bit.web.play.action;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
//
//public class IntercepterPro extends HandlerInterceptorAdapter{
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("preHandle");
//		String user_id=request.getParameter("user_id");
//		String user_passwd=request.getParameter("user_passwd");		
//		if(!(user_id.equals("Admin")&& user_passwd.equals("1234"))) {
//			response.sendRedirect("intercepterMvc/adminLogin.jsp");
//			return false;
//		}
//		return true;
//		
//	}
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("postHandle");
//		System.out.println(modelAndView.getModel().get("message"));
//		modelAndView.getModel().put("message", "ModifyMessage");
//		//int rs=10/0; error afterCompletion으로 Exception객체 전달 
//		/***
//         * View를 렌더링하기 전에 
//         * postHandle 메소드가 호출된다.        
//         * modelAndView 정보를 알 수 있다.
//         * 특정 View에 modelAndView 값을 수정해야할 필요가 있다면
//         * postHandle 메소드에서 작업이 이뤄지면 된다.
//         */
//			
//	}
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		// TODO Auto-generated method stub
//		System.out.println("ex="+ex);
//		System.out.println("afterCompletion");
//		/***
//         * 클라이언트에게 
//         * 최종적으로 Response를 전달하기 전에
//         * 호출되는 afterCompletion 메소드에는
//         * Exception 정보가 담겨온다.       
//         * afterCompletion 메소드에서는
//         * response의 값을 Control 하거나
//         * Exception 값에 따른 핸들링을 하면 된다.
//         */
//		
//	}	
//
//}
