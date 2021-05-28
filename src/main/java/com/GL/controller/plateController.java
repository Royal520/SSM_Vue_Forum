package com.GL.controller;

import com.GL.domin.article;
import com.GL.domin.plate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.GL.service.impl.plateServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@CrossOrigin
@Controller
@ResponseBody
@RequestMapping("/plate")
public class plateController {

    @Autowired
    private plateServiceImpl plateService;

    @RequestMapping(value = "/all",method = RequestMethod.GET)
    public List<plate>  findAll(HttpServletResponse response, HttpServletRequest request){
        List<plate> all = plateService.findAll(-1, 100);
        System.out.println(all.toString());
        return all;
    }

    @RequestMapping("getArticlesByPlateId")
    public List<article> getArticlesByPlateId(@RequestParam Integer id){
        return plateService.getArticlesByplateid(id).getArticles();
    }


}
