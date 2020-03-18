package cn.mvapi.xiaobao.common.shiro;



import cn.mvapi.xiaobao.common.system.entity.SysMenu;
import cn.mvapi.xiaobao.common.system.entity.SysRole;
import cn.mvapi.xiaobao.common.system.entity.SysUser;
import cn.mvapi.xiaobao.common.system.service.SysUserService;
import cn.mvapi.xiaobao.common.system.service.impl.SysLoginServiceImpl;
import cn.mvapi.xiaobao.common.system.service.impl.SysUserServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;


public class CustomRealm extends AuthorizingRealm {

    @Autowired
    private SysLoginServiceImpl sysLoginService;
    @Autowired
    private SysUserServiceImpl sysUserService;
    //进入角色授权 该方法是将用户的角色及权限全部查出来
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录用户名
        String username = (String) principalCollection.getPrimaryPrincipal();
        //根据用户名去数据库查询用户信息
        SysUser sysUser = sysLoginService.getUserByName(username);//new QueryWrapper<SysUser>().eq("username",username));
        //添加角色和权限
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        for (SysRole role : sysUser.getRoles()) {
            //添加角色
            simpleAuthorizationInfo.addRole(role.getRoleName());
            //添加权限
            for (SysMenu sysMenu : role.getSysMenus()) {
                if(sysMenu.getPerms()!=null&&!sysMenu.getPerms().trim().equals("")){
                    for(String str:sysMenu.getPerms().split(",")){
                        simpleAuthorizationInfo.addStringPermission(str);
                    }
                }
            }
        }
        return simpleAuthorizationInfo;
    }

    //主要用于账号密码校验，通过用户名查出数据库内的密码，交给shiro校验
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //加这一步的目的是在Post请求的时候会先进认证，然后在到请求
        if (authenticationToken.getPrincipal() == null) {
            return null;
        }
        //获取用户信息
        String name = authenticationToken.getPrincipal().toString();
        SysUser user =  sysUserService.getOne(new QueryWrapper<SysUser>().eq("username",name));

        if (user == null) {
            //这里返回后会报出对应异常
            return null;
        } else {
            //这里验证authenticationToken和simpleAuthenticationInfo的信息
            //用户名–此处传的是用户对象
            //密码—从数据库中获取的密码
            //getName() //当前的realm名
            SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(name, user.getPassword().toString(), getName());
            return simpleAuthenticationInfo;
        }
    }
}
