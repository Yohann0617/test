package com.controller;

import com.dao.UserDao;
import com.github.pagehelper.PageInfo;
import com.po.LoginUser;
import com.po.MyUser;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserDao userDao;

    @Autowired
    private UserService userService;

    //跳转到修改页面
    @RequestMapping("/toUpdateUser")
    public String toUpdatePaper(Model model, int uid) {
        MyUser user = userService.queryUserById(uid);
//        System.out.println(user);
        model.addAttribute("user", user);
        return "updateUser";
    }

    @RequestMapping("/edit")
    public String updateUser(Model model, MyUser user) {
//        System.out.println("updateBook=>" + book);
        int i = userService.updateUser(user);
        if (i > 0) {
            System.out.println("修改users成功" + user);
        }
        MyUser user1 = userService.queryUserById(user.getUid());
        model.addAttribute("user", user1);
        return "redirect:/findAllUser.do";
    }

    @RequestMapping("/toAddUser")
    public String toaddUser(Model model){
        return "addUser";
    }

    @RequestMapping("/addUser")
    public String addUser(MyUser user){
        userService.addUser(user);
        return "redirect:/findAllUser.do";
    }
    //删除书籍
    @RequestMapping("/del/{uid}")
    public String deleteUser(@PathVariable("uid") int uid) {
        userService.deleteUserById(uid);
        return "redirect:/findAllUser.do";
    }

    @RequestMapping("/select")
    public String select(MyUser user, Model model) {
        List<MyUser> list = userDao.selectUserByUname(user);
        model.addAttribute("userList", list);
        return "userList";
    }


    @RequestMapping("/findAllUser.do")
    public ModelAndView findAllUser(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size) {
        //调用Service方法，得到查询结果
        List<MyUser> userList = userService.findAllUser(page, size);

        //2数据传到分页
        PageInfo pageInfo = new PageInfo(userList);

        //为了进行返回值传递，需要把返回值封装到SpringMVC内置对象ModelAndView
        ModelAndView mv = new ModelAndView();
        mv.addObject("userList", userList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("test");


        return mv;
    }

    @RequestMapping("/tologin")
    public String tologin(Model model){
        model.addAttribute("msg","请登录！");
        return "login";
    }

    @RequestMapping(value = "/login")
    public String login(LoginUser loginUser, HttpServletRequest request,
                        HttpServletResponse response,Model model) throws Exception {
        //接收serviceDao的login方法返回的boolean值
        boolean flag = userService.login(loginUser);
        HttpSession session = request.getSession();
        // 将查询到的user对象放入session域中
        session.setAttribute("loginuser", loginUser);
        LoginUser loginuser1 = (LoginUser) session.getAttribute("loginuser");
        System.out.println(loginuser1);

        if (flag == true) {
            // 由于视图解析器已经配置，这里只需要填写jsp文件名字，不需要带后缀
            return "forward:/findAllUser.do";
        } else {
            model.addAttribute("msg","账号或密码错误！");
            return "forward:/WEB-INF/jsp/login.jsp";
        }
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest request){
        request.getSession().invalidate();
        return "login";
    }

}
