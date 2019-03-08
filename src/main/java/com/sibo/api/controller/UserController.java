package com.sibo.api.controller;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.lang.Dict;
import com.sibo.api.utils.LocalUtil;
import com.sibo.common.validator.Assert;
import com.sibo.framework.web.entity.R;
import com.sibo.project.system.menu.entity.Menu;
import com.sibo.project.system.menu.service.IMenuService;
import com.sibo.project.system.user.entity.User;
import com.sibo.project.system.user.service.IUserService;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-04-28 16:18:21
 */
@RestController("apiUserController")
@RequestMapping("/api/v1/user")
public class UserController {

    @Autowired
    private IMenuService menuService;

    @Autowired
    private IUserService userService;

    /**
     * 通过username+密码登陆
     *
     * @param loginName 用户名
     * @param password  密码
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public R loginByPwd(@RequestParam(value = "name", required = false) String loginName, String password) {
        Assert.isBlank(loginName, "用户名不能为空!");
        Assert.isBlank(password, "密码不能为空!");

        User loginUser = userService.checkLogin(loginName, password);
        if (loginUser != null) {
            Map<String, Object> map = new HashMap<>(5);

            map.put("user", Dict.create()
                    .set("name", loginUser.getLoginName())
                    .set("email", loginUser.getEmail())
                    .set("mobile", loginUser.getPhonenumber())
                    .set("id", loginUser.getUserId())
                    .set("realname", "陈先生")
                    .set("userrank", 1)
                    .set("address", "广东深圳龙岗区")
                    .set("logintime", DateTime.now())
            );
            List<Menu> menus = menuService.selectMenusByUser(loginUser);
            Set<String> perms = menuService.selectPermsByUserId(loginUser.getUserId());
            // map.put("menus", menus);
            // map.put("perms", perms);
            map.put("isAdmin", loginUser.isAdmin());

            //---------------------
            StringBuilder permsSbStr = new StringBuilder();
            for (String s : perms) {
                permsSbStr.append(s).append(",");
            }
            String permsStr = permsSbStr.toString();
            if (permsStr.endsWith(",")) {
                permsStr = permsStr.substring(0, permsStr.length() - 1);
            }
            System.out.println("permsStr=" + permsStr);
            //生成Token(jwt)
            String jwtToken = getJwtToken(loginUser, permsStr);
            map.put("Authorization", jwtToken);

            return R.ok().data(map);
        }
        return R.error("用户名/密码错误!");
    }

    @RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
    public R modifyPwd(String originalPassword, String newPassword) {
        Assert.isBlank(originalPassword, "请提供原密码(originalPassword)");
        Assert.isBlank(newPassword, "请提供新密码(newPassword)");

        Long userid = LocalUtil.getLocalUserId();

        User currentUser = userService.getById(userid);

        if (currentUser == null) {
            return R.error("用户不存在");
        }
        if (!userService.checkPassword(userid, originalPassword)) {
            return R.error("原密码不正确");
        }


        boolean result = userService.modifyNewPassword(userid, newPassword);
        return result ? R.ok() : R.error("发生错误!");
    }

    //-----------------------------------------

    @Value("${application.api.secret}")
    private String SECRET;

    /**
     * 生成jwttoken
     *
     * @param user 用户
     * @return String
     */
    private String getJwtToken(User user, String permsStr) {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);

        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(SECRET);
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());

        JwtBuilder builder = Jwts.builder().setId(String.valueOf(user.getUserId()))
                .setIssuedAt(now)
                .setExpiration(Date.from(LocalDateTime.now().plusDays(10).atZone(ZoneId.systemDefault()).toInstant()))
                //--------Custom Claims--------
                //-----------------------------
                .claim("loginName", user.getLoginName())
                //-----------------------------
                .claim("isAdmin", user.isAdmin())
                .claim("permsStr", permsStr)
                .signWith(signingKey, signatureAlgorithm);

        return builder.compact();

    }

}
