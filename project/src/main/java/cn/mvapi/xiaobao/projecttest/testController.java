package cn.mvapi.xiaobao.projecttest;

import cn.mvapi.xiaobao.common.system.entity.SysMenu;
import cn.mvapi.xiaobao.common.system.service.SysMenuService;
import cn.mvapi.xiaobao.common.system.service.impl.SysMenuServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class testController {
    @Autowired
    private SysMenuServiceImpl sysMenuService;
    @ResponseBody
    @RequestMapping("dbtest")
    public List<SysMenu> dbtest(){
        return sysMenuService.list();
    }
}
