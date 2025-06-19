package com.example.techstore.controller;

import com.example.techstore.model.User;
import com.example.techstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String showRegistrationPage() {
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(User user) {
        userService.registerUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "/login";
    }

    @PostMapping("/login")
    public String loginUser(String username, String password, Model model) {
        User user = userService.authenticate(username, password);
        if (user != null) {
            model.addAttribute("user", user);
            return "home"; // Redirect to home page or dashboard
        }
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }
}


