package cn.mvapi.xiaobao.common.system.service;


import cn.mvapi.xiaobao.common.system.entity.SysUser;

public interface SysLoginService {
    SysUser getUserByName(String username);
}
