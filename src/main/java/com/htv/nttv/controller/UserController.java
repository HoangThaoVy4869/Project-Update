/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.htv.nttv.controller;

import com.htv.nttv.pojo.Team;
import com.htv.nttv.pojo.User;
import com.htv.nttv.service.TeamService;
import com.htv.nttv.service.UserGroupService;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author USER
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserGroupService userGroupService;

    @Autowired
    private TeamService teamService;

    @GetMapping("/list")
    public String listUser(Model model, @RequestParam Map<String, String> params) {

        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("user", this.userGroupService.getUser(params, page));
        model.addAttribute("team", new Team());
        return "listUserGroup";
    }

    @GetMapping("/team")
    public String listTeam(Model model) {
        model.addAttribute("team", new Team());
        return "listUserGroup";
    }

    @PostMapping("/team")
    public String addTeam(Model model, @ModelAttribute(value = "team") @Valid Team t,
            BindingResult r) {
        if (!r.hasErrors()) {
            if (this.teamService.addTeam(t) == true) {
                return "redirect:/user/list";
            } else {
                model.addAttribute("errMsg", "Error!!!!!");
            }
        }
        return "listUserGroup";
    }
    
//    @PostMapping("/addUserToGroup")
//    public String addUserToGroup (Model model, @ModelAttribute(value = "userTeam") User u, Team t,
//            BindingResult r){
//        if (!r.hasErrors()) {
//            if (this.userGroupService.addUserToGroup(u, t) == true) {
//                return "redirect:/user/list";
//            } else {
//                model.addAttribute("errMsg", "Error!!!!!");
//            }
//        }
//        return "listUserGroup";
//    }
}
