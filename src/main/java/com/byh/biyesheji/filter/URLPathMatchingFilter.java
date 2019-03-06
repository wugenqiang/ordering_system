package com.byh.biyesheji.filter;

import com.byh.biyesheji.service.PermissionService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.Set;

/**
 * 后台登陆状态权限拦截验证 没有登陆挑战login 没有权限跳转unauthorized
 */
public class URLPathMatchingFilter extends PathMatchingFilter {
    @Autowired
    PermissionService permissionService;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue)
            throws Exception {
        String requestURI = getPathWithinApplication(request);

        System.out.println("requestURI:" + requestURI);

        Subject subject = SecurityUtils.getSubject();
        // 如果没有登录，就跳转到登录页面
        if (!subject.isAuthenticated()) {
            WebUtils.issueRedirect(request, response, "/login");
            return false;
        }

        // 看看这个路径权限里有没有维护，如果没有维护，一律放行(也可以改为一律不放行)
        boolean needInterceptor = permissionService.needInterceptor(requestURI); //查看是否有这个url的权限维护 有true 无false
        if (!needInterceptor) {
            return true;
        } else {//有维护
            boolean hasPermission = false;
            String userName = subject.getPrincipal().toString();
            //查询当前用户名拥有的权限
            Set<String> permissionUrls = permissionService.listPermissionURLs(userName);
            for (String url : permissionUrls) {
                // 这就表示当前用户有这个权限
                if (url.equals(requestURI)) {
                    hasPermission = true;
                    break;
                }
            }

            if (hasPermission)
                return true;
            else {
                UnauthorizedException ex = new UnauthorizedException("当前用户没有访问路径 " + requestURI + " 的权限");

                subject.getSession().setAttribute("ex", ex);

                WebUtils.issueRedirect(request, response, "/unauthorized");
                return false;
            }

        }

    }
}

