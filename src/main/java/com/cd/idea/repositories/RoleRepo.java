package com.cd.idea.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.cd.idea.models.Role;

public interface RoleRepo extends CrudRepository<Role, Long>{
	List<Role> findAll();
	List<Role> findByName(String name);
}
