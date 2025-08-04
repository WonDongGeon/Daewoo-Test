package restapi;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ApiService {

    private final RestTemplate restTemplate;

    public ApiService(RestTemplateBuilder builder) {
        this.restTemplate = builder.build();
    }

    public Post[] fetchPosts() {
    	// GET ������� ��û�Ͽ� JSON �����͸� Post[] Ÿ������ ����
        return restTemplate.getForObject("https://jsonplaceholder.typicode.com/posts", Post[].class);
    }
}
