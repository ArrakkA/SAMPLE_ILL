package cc.greenit.sample.interceptor;
import cc.greenit.sample.global.Globals;
import cc.greenit.sample.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
public class AuthenticationInterceptor implements HandlerInterceptor {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    MemberService memberService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute(Globals.SESSION_NAME);
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        logger.info("client ip is " + ip);

        if(obj == null){
            HashMap<String, Object> params = new HashMap<>();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if(loginCookie != null){
                params.put("sessionId",loginCookie.getValue());
                HashMap<String,Object> member = memberService.checkUserSessionKey(params);
                if(member != null){
                    session.setAttribute(Globals.SESSION_NAME , member);
                    return true;
                }
            }
            response.sendRedirect("/sample/login");
            return false;
        }
        return true;
    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
}
