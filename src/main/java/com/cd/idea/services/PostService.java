package com.cd.idea.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cd.idea.models.Post;
import com.cd.idea.models.User;
import com.cd.idea.repositories.PostRepo;

@Service
public class PostService {
	private PostRepo postRepo;
	
	public PostService(PostRepo postRepo) {
		this.postRepo = postRepo;
	}
	
	public void addPost(String idea, User user) {
		Post post = new Post(idea, user);
		postRepo.save(post);
	}
	
	public List<Post> getAllPosts() {
		return (List<Post>) postRepo.findAll();
	}
	
	public Post findPostById(Long id) {
		return postRepo.findOne(id);
	} 
	
	public void deletePostById(Long id) {
		postRepo.delete(id);
	}
}
