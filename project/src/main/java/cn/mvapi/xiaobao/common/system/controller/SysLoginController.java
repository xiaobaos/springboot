package cn.mvapi.xiaobao.common.system.controller;


import cn.mvapi.xiaobao.common.system.entity.ReturnData;
import cn.mvapi.xiaobao.common.system.entity.SysUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import com.sun.jndi.toolkit.url.UrlUtil;
//import org.apache.commons.codec.net.URLCodec;

@Controller
public class SysLoginController {
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ReturnData login(SysUser user) {
        //添加用户认证信息
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(
                user.getUsername(),
                user.getPassword()
        );
        String error="";
        try {
            //进行验证，这里可以捕获异常，然后返回对应信息
            subject.login(usernamePasswordToken);
//            subject.checkRole("admin");
 //           subject.checkPermissions("query", "add");
        } catch (AuthenticationException e) {
            //e.printStackTrace();
           // return "账号或密码错误！";
           return new ReturnData(201,"账号或密码错误！",null);
        } catch (AuthorizationException e) {
           // e.printStackTrace();
            return new ReturnData(202,"您没有权限！",null);
            // return "没有权限";
        }
        return new ReturnData(200,"登录成功！",null);
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login/index.html";
    }

}
