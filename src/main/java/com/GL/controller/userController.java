package com.GL.controller;

import com.GL.domin.user;
import com.GL.service.IuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@CrossOrigin
@RequestMapping("/user")
@ResponseBody
public class userController {
    @Autowired
    IuserService userService;


    @RequestMapping(value = "/Login",method = RequestMethod.POST)
    public String Login(@RequestParam String username, @RequestParam String password, HttpSession session){
        user loginUser = userService.findByCondition(null, username);
        if(loginUser==null)
            return "error";
        else if(loginUser.getPassword().equals(password)){
            session.setAttribute("user",loginUser);
            return "success";
        }
        else return "error";
    }

    @RequestMapping(value="/checkName",method = RequestMethod.POST)
    public String checkName(@RequestParam String username){
        user loginUser = userService.findByCondition(null, username);
        if(loginUser==null)
            return "success";
        else return "error";
    }

    @RequestMapping(value="/register",method = RequestMethod.POST)
    public boolean Register(@RequestParam String username,@RequestParam String password,HttpSession session){
        user registerUser = new user();
        registerUser.setUsername(username);
        registerUser.setPassword(password);
        registerUser.setStateid(1);
        registerUser.setLevelid(1);
        boolean registerok= userService.Insert(registerUser);
        if(registerok)
            session.setAttribute("user",registerUser);
        return registerok;
    }

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public user detail(HttpSession session){
        System.out.println("hello");
        user user =(user) session.getAttribute("user");
        if(user!=null){
            user.setPassword("");
            return user;
        }else return null;
    }

    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public boolean updateUser(@RequestParam String username,@RequestParam String password,@RequestParam String phone,@RequestParam String mail,HttpSession session){
        user user = (user)session.getAttribute("user");
        user.setPassword(password);
        user.setPhone(phone);
        user.setMail(mail);
        user.setUsername(username);
        return userService.update(user);
    }

    @RequestMapping(value="/logout",method = RequestMethod.GET)
    public boolean logout(HttpSession session){
        user user = (user)session.getAttribute("user");
        if(user!=null){
            session.removeAttribute("user");
            return true;
        }
        return false;
    }
}
