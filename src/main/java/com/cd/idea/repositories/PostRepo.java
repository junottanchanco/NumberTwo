package com.cd.idea.repositories;

import org.springframework.data.repository.CrudRepository;

import com.cd.idea.models.Post;

public interface PostRepo extends CrudRepository<Post, Long>{

}
