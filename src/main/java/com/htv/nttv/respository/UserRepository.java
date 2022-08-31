/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.htv.nttv.respository;

import com.htv.nttv.pojo.User;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface UserRepository {
    boolean addUser(User u);
    User findByUser(String username);
}
