package cn.mvapi.xiaobao.common.system.service.impl;


import cn.mvapi.xiaobao.common.system.entity.*;
import cn.mvapi.xiaobao.common.system.service.SysLoginService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

//import org.checkerframework.checker.units.qual.A;

@Service
public class SysLoginServiceImpl implements SysLoginService {

    @Autowired
    private SysUserServiceImpl sysUserService;
    @Autowired
    private SysRoleServiceImpl sysRoleService;
    @Autowired
    private SysRoleMenuServiceImpl sysRoleMenuService;
    @Autowired
    private SysMenuServiceImpl sysMenuService;
    @Autowired
    private SysUserRoleServiceImpl sysUserRoleService;

    @Override
    public SysUser getUserByName(String username) {
        SysUser sysUser=sysUserService.getOne(new QueryWrapper<SysUser>().eq("username",username));
        if(sysUser!=null){
            List<SysUserRole> sysUserRoles=sysUserRoleService.list(new QueryWrapper<SysUserRole>().eq("user_id",sysUser.getUserId()));
            List<SysRole> sysRoles=new ArrayList<>();
            for(SysUserRole sysUserRole:sysUserRoles){
                SysRole sysRole=sysRoleService.getById(sysUserRole.getRoleId());
                List<SysMenu> sysMenuList=new ArrayList<>();
                List<SysRoleMenu> roleMenuList=sysRoleMenuService.list(new QueryWrapper<SysRoleMenu>().eq("role_id",sysUserRole.getRoleId()));
                for(SysRoleMenu sysRoleMenu:roleMenuList){
                    sysMenuList.add(sysMenuService.getById(sysRoleMenu.getMenuId()));
                }
                sysRole.setSysMenus(sysMenuList);
                sysRoles.add(sysRole);
            }
            sysUser.setRoles(sysRoles);
        }
        return sysUser;
    }
}
