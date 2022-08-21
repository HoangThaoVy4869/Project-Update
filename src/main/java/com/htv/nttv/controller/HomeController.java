/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.htv.nttv.controller;

import com.htv.nttv.service.CategoryService;
import com.htv.nttv.service.ExpenseService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.htv.nttv.service.TeamService;

/**
 *
 * @author USER
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ExpenseService expenseService;


    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
    }
    
    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
      
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("expense", this.expenseService.getExpense(params, page));
        model.addAttribute("counter", this.expenseService.countExpense());
        return "index";
    }
}
