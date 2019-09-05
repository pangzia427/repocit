package com.bgs.reception.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bgs.reception.pojo.User;
import com.bgs.reception.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MrPan
 * @since 2019-08-28
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(User user, String gouxuan, HttpSession session){

        Map<String,Object> map=new HashMap<>();

        QueryWrapper<User> queryWrapper=new QueryWrapper<>();

        queryWrapper.eq("codename",user.getCodename()).eq("password",user.getPassword());

        User user1=userService.getOne(queryWrapper);

        session.setAttribute("user",user1);

        if(user1!=null){

           if(gouxuan!=null){

               session.setAttribute("codename",user1.getCodename());

               session.setAttribute("password",user1.getPassword());
           }

           map.put("flag", true);

        }else {

           map.put("flag", false);

        }

        return map;

     }


    @RequestMapping("/logout")
    @ResponseBody
    public boolean logout(HttpSession session){
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
            return true;
        }
        return false;
    }

    @RequestMapping("findAll")
    @ResponseBody
    public List<User> findAll(Integer address){

        QueryWrapper<User> queryWrapper=new QueryWrapper<>();

        queryWrapper.eq("address",address);

        List<User> list = userService.list(queryWrapper);

        return list;

    }

    @RequestMapping("addNewUser")
    @ResponseBody
    public Boolean addNewUser(User user){

        Boolean b=userService.save(user);

        return b;

    }




 }