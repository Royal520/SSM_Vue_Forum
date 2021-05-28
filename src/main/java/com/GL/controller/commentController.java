package com.GL.controller;

import com.GL.domin.comment;
import com.GL.domin.user;
import com.GL.service.IcommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@CrossOrigin
@Controller
@ResponseBody
@RequestMapping("/comment")
public class commentController {
    @Autowired
    private IcommentService icommentService;

    @RequestMapping(value = "/submit",method = RequestMethod.POST)
    public boolean submit(@RequestParam String content,@RequestParam Integer articleid,@RequestParam Integer fatherid, HttpSession session){
        user user = (user) session.getAttribute("user");
        comment comment=new comment();
        comment.setUserid(user.getId());
        comment.setContent(content);
        comment.setArticleid(articleid);
        comment.setFatherid(fatherid);
        return icommentService.insertComment(comment);
    }

    @RequestMapping(value="/getComment",method=RequestMethod.POST)
    public List<comment> getComment(@RequestParam Integer articleid, @RequestParam Integer fatherid){
        return icommentService.findComment(-1,0,articleid,fatherid,null,null,null);
    }
}
