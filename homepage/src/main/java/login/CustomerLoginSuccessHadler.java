package login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

public class CustomerLoginSuccessHadler implements AuthenticationSuccessHandler {

	private ObjectMapper objectMapper = new ObjectMapper();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("성공시 : " + authentication.getAuthorities());
		List<String> roleNames=new ArrayList<String>();
		authentication.getAuthorities().forEach(authoritie-> {
			roleNames.add(authoritie.getAuthority());
		});
		
		
		String targetUrl = "";
        if (roleNames.contains("ROLE_ADMIN")) {
            targetUrl = request.getContextPath() + "/admin/index?loginSuccess=true";
        } else if (roleNames.contains("ROLE_USER")) {
            targetUrl = request.getContextPath() + "/user/index?loginSuccess=true";
        } else {
            targetUrl = request.getContextPath() + "/login/accessError";
        }

        // JSON 응답 생성
        response.setStatus(HttpServletResponse.SC_OK);
        response.setContentType("application/json;charset=UTF-8");

        // JSON 형태로 응답 (예: { "targetUrl": "/user/index?loginSuccess=true" })
        objectMapper.writeValue(response.getWriter(), new LoginResponse(targetUrl));
	}
	
	public static class LoginResponse {
	    private String redirectUrl;  // 이름을 redirectUrl로 바꾸기

	    public LoginResponse(String redirectUrl) {
	        this.redirectUrl = redirectUrl;
	    }

	    public String getRedirectUrl() {
	        return redirectUrl;
	    }

	    public void setRedirectUrl(String redirectUrl) {
	        this.redirectUrl = redirectUrl;
	    }
	}

}
