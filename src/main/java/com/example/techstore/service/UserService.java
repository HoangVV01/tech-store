package com.example.techstore.service;

import com.example.techstore.model.User;
import com.example.techstore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    public void registerUser(User user) {
        userRepository.save(user);
    }
    public User authenticate(String username, String password)
    { User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) { return user; }
        return null;
    }
}
