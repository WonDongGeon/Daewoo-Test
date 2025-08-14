package post;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.client.RestTemplate;

public class Scehdule01 {

	@Autowired
    private PostService postService;
	
	@Scheduled(cron = "0/5 * * * * ?")
	public void work1() {
		String apiUrl = "https://jsonplaceholder.typicode.com/users";
		RestTemplate restTemplate = new RestTemplate();
		
		//Person[] 배열로 변환(필드명이 완전히 같다고 가정)
		Post[] postArray = restTemplate.getForObject(apiUrl, Post[].class);
		
		if(postArray != null) {
			List<Post> postList = Arrays.asList(postArray); 
			
			//DB에 저장
			postService.saveAll(postList);
			
			System.out.println("[Scheduled] 외부 데이터 " + postList.size() + "명 저장 완료");	
		} else {
			System.out.println("[Scheduled] 외부 데이터 없음");
		}
	}
}
