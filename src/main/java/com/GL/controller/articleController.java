package com.GL.controller;

import com.GL.domin.article;
import com.GL.domin.user;
import com.GL.service.IarticleService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@CrossOrigin
@Controller
@ResponseBody
@RequestMapping("/article")
public class articleController {
    @Autowired
    private IarticleService articleService;

    @RequestMapping("/getArticleByArticleid")
    public article getArticleByArticleid(@RequestParam Integer id){
        return articleService.findById(id);
    }

    @RequestMapping("/getArticlesByUserid")
    public List<article> getArticlesByUserid(@RequestParam Integer authorid){
        return articleService.findByCondition(authorid,null);
    }

    @RequestMapping(value = "/write",method = RequestMethod.POST)
    public String write(@RequestParam String text,@RequestParam String label ,@RequestParam String title,@RequestParam Integer plateid, HttpSession session){
        System.out.println(session.getId());
        System.out.println(session.getAttribute("user"));
        if(session.getAttribute("user")!=null){
            article article=new article();
            user u=(user)session.getAttribute("user");
            article.setAuthorid(u.getId());
            article.setText(text);
            article.setTitle(title);
            article.setLabel(label);
            article.setPlateid(plateid);
            System.out.println(article);
            articleService.Insert(article);
            return "success";
        }else{
            return "error";
        }
    }
}
