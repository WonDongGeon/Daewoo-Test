package post;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PostMapper {
	void saveAll(List<Post> postList);
	List<Post> findAll();
}
