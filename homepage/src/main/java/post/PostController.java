package post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {

	 	@Autowired
	    private PostService postService;

	    // DB에서 사용자 리스트 가져오기
	 	@GetMapping("/posts")
	    public List<Post> getUsers() {
	        return postService.getPosts();
	    }
}
