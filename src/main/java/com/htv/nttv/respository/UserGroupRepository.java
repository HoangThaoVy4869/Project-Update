/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.htv.nttv.respository;

import com.htv.nttv.pojo.Team;
import com.htv.nttv.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author USER
 */
public interface UserGroupRepository {
    List<Object[]> getUser(Map<String, String> params, int page);
    boolean addUserToGroup(User u, Team t);
    public User getUserById(int id);
    public Team getTeamById(int id);
}
