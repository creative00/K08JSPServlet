package real.project;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NaverSearchAPI.do")
public class NaverSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String clientId = "N65vr6XGlZF0O4vKhBxU"; //애플리케이션 클라이언트 아이디값
		String clientSecret = "GcK1vRzxKq"; //애플리케이션 클라이언트 시크릿값
		
		String keyword = req.getParameter("keyword");
		String startNum = req.getParameter("startNum");
		//int startNum = Integer.parseInt(req.getParameter("startNum")); 원본인데 인트타입이라 여기서 에러남
		
		
		
		String text = null;
		try {
			//text = URLEncoder.encode(keyword, "UTF-8");
			text = URLEncoder.encode("종각역맛집", "UTF-8");
		}
		catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		//검색요청URL에 파라미터를 추가한다
		String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text; 
		//String apiURL = "https://openapi.naver.com/v1/search/blog?query="+text+"&display=20&start="+startNum;//json결과
		//String upiURL = "https://openapi1.naver.com/v1/search/blog.xml?query="+text; //xml결과
		
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL,requestHeaders);


		System.out.println(responseBody);
		
		//서블릿에서 검색결과 JSON을 직접 출력한다. 
		resp.setContentType("text/html; charset=utf-8");
		resp.getWriter().write(responseBody);
	}
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	
		try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }	
	}
	
	private static HttpURLConnection connect(String apiUrl) {
		try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
	}
	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		
		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
        }
	}
}
