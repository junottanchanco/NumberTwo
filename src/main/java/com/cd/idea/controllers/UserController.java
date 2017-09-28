package com.cd.idea.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cd.idea.models.Post;
import com.cd.idea.models.User;
import com.cd.idea.services.PostService;
import com.cd.idea.services.UserService;
import com.cd.idea.validator.UserValidator;

@Controller
public class UserController {
	private UserService userService;
	private UserValidator userValidator;
	private PostService postService;
	
	public UserController(UserService userService, UserValidator userValidator, PostService postService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.postService = postService;
	}
	
	@RequestMapping("/login")
	public String login(@Valid @ModelAttribute("user") User user, @RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
		if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successfull!");
        }
		return "loginReg.jsp";
	}
	
	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
		userValidator.validate(user, result);

        if (result.hasErrors()) {
            return "loginReg.jsp";
        }
        userService.saveWithUserRole(user);
        return "redirect:/login"; 
    }
	
	@RequestMapping(value = {"/", "/home"})
	public String home(Principal principal, Model model, HttpSession session) {
		
		String email = principal.getName();
		User user = userService.findByEmail(email);
		userService.updateUserDate(user.getId(), user);
		model.addAttribute("currentUser",  user);
		model.addAttribute("users", userService.findAll());
		model.addAttribute("posts", postService.getAllPosts());
		return "ideaPage.jsp";
	}
	
	@RequestMapping("/new")
	public String newIdea(@RequestParam("user_id") Long id, @RequestParam("idea") String idea) {
		postService.addPost(idea, userService.findUserById(id));
		return "redirect:/";
	}
	
	@RequestMapping("/like/{user_id}/{post_id}")
	public String like(@PathVariable("user_id") Long user_id, @PathVariable("post_id") Long post_id) {
		User user = userService.findUserById(user_id);
		Post post = postService.findPostById(post_id);
		
		List<Post> liked_posts = user.getLiked_posts();
		
		for(int i = 0; i < liked_posts.size(); i++) {
			if(liked_posts.get(i).getId() == post.getId()) {
				return "redirect:/";
			}
		}
		liked_posts.add(post);
		user.setLiked_posts(liked_posts);
		userService.updateUser(user);
		return "redirect:/";
	}
	
	@RequestMapping("/likers/{post_id}")
	public String likeStatus(@PathVariable("post_id") Long post_id, Model model) {
		model.addAttribute("post", postService.findPostById(post_id));
		return "likeStatus.jsp";
	}
	
	@RequestMapping("/delete/{id}")
	public String deletePost(@PathVariable("id") Long id) {
		postService.deletePostById(id);
		return "redirect:/";
	}
	
	@RequestMapping("/users/{id}")
	public String userProfile(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.findUserById(id));
		return "userProfile.jsp";
	}
	
	@RequestMapping("/makeUser/{id}")
	public String makeUser(@PathVariable("id") Long id) {
		User user = userService.findUserById(id);
		userService.updateUserWithUserRole(user);
		return "redirect:/admin";
	}
}
