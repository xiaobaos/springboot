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
import org.springframework.web.bind.annotation.ResponseBody;

//import com.sun.jndi.toolkit.url.UrlUtil;
//import org.apache.commons.codec.net.URLCodec;

@Controller
public class SysLoginController {
    @ResponseBody
    @RequestMapping("/login")
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
    //注解验角色和权限
    @RequiresPermissions("sys:role:delete")
    @RequestMapping("/delete")
    @ResponseBody
    public String index() {
        return "delete";
    }


    @RequiresPermissions("sys:user:save")
    @RequestMapping("/save")
    @ResponseBody
    public String save() {
        return "save";
    }

    //@RequiresPermissions("sys:user:save")
    @RequiresRoles("管理员")
    @RequestMapping("/role")
    @ResponseBody
    public String role() {
        return "role";
    }

    @RequiresPermissions("sys:role:otherpermission")
    @RequestMapping("/otherPermission")
    @ResponseBody
    public String others() {
        return "用户不存在的权限";
    }

    @RequiresRoles("otherRoles")
    @RequestMapping("/otherRoles")
    @ResponseBody
    public String otherRoles() {
        return "用户不存在的角色";
    }
}
