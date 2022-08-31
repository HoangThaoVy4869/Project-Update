/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.htv.nttv.service.impl;

import com.htv.nttv.pojo.User;
import com.htv.nttv.respository.UserRepository;
import com.htv.nttv.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author DELL
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder PasswordEncoder;

    @Override
    public boolean addUser(User u) {
        String pass = u.getPassword(); 
        u.setPassword(this.PasswordEncoder.encode(pass));
        u.setUserRole("1");
        u.setActive(Boolean.TRUE);
        return this.userRepository.addUser(u);    
    }

//    @Override
//    public boolean isUser(String email, String password) {
////        User user = userRepository.findByUser(email);
////        if (user != null && user.getPassword().equals(password)) {
////            return true;
////        }
////        return false;
////        return this.userRepository.findByUser(email, password);
//    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.findByUser(username);
        
        if (u == null) {
            throw new UsernameNotFoundException("Invalid username!!!");
        }

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getUserRole()));

        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public User findByUser(String username) {
        return this.userRepository.findByUser(username);
    }


}