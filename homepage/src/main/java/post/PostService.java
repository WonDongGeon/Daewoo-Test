package post;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import member.Member;
import member.MemberMapper;
import member.Registerform;

@Service
public class PostService {

	@Autowired
	PostMapper mapper;
	
	public void fetchAndSaveUsers() {
        RestTemplate restTemplate = new RestTemplate();
        String url = "https://jsonplaceholder.typicode.com/users";
        Post[] users = restTemplate.getForObject(url, Post[].class);
        if(users != null) {
        	mapper.saveAll(Arrays.asList(users));
        }
    }

	public void saveAll(List<Post> postList) {
		// TODO Auto-generated method stub
		
	}

	public List<Post> getPosts() {
		// TODO Auto-generated method stub
		return null;
	}

}
