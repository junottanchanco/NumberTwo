package com.cd.idea.repositories;
import org.springframework.data.repository.CrudRepository;

import com.cd.idea.models.User;

public interface UserRepo extends CrudRepository<User, Long>{
	User findByEmail(String email);
}
