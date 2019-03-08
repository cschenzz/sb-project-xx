package com.sibo.api.aop;

import com.sibo.api.entity.UserTokenDtoEntity;
import com.sibo.api.utils.LocalUtil;
import com.sibo.framework.web.entity.R;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.xml.bind.DatatypeConverter;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-04-28 16:18:21
 */

@Aspect
@Component
public class ApiAspect extends BaseAspect {

    private final static Logger logger = LoggerFactory.getLogger(ApiAspect.class);

    @Pointcut("@within(org.springframework.web.bind.annotation.RestController) && within(com.sibo.api.controller..*)")
    public void apiPointcut() {
    }

    @Around("apiPointcut()")
    public Object requestAround(ProceedingJoinPoint joinPoint) throws Throwable {

        long startMs = System.currentTimeMillis();

        //--------------------
        String requestToken = getRequestToken(request);

        if (checkToken()) {
            //-----------------------
            if (StringUtils.isEmpty(requestToken)) {
                LocalUtil.setLocalUser(null);
                return R.error("Authorization无效");
            } else {
                try {

                    //This line will throw an exception if it is not a signed JWS (as expected)
                    Claims claims = Jwts.parser()
                            .setSigningKey(DatatypeConverter.parseBase64Binary(SECRET))
                            .parseClaimsJws(requestToken).getBody();
                    System.out.println("userid: " + claims.getId());
                    System.out.println("Expiration: " + claims.getExpiration());

                    if (claims.getExpiration().getTime() < System.currentTimeMillis()) {
                        return R.error(4100, "Authorization令牌已过期,请重新获取!");
                    }
                    //--------
                    Long userId = Long.parseLong(claims.getId());
                    //--------------------
                    UserTokenDtoEntity dtoEntity = new UserTokenDtoEntity();
                    dtoEntity.setUserid(userId);
                    dtoEntity.setAuthorization(requestToken);

                    LocalUtil.setLocalUser(dtoEntity);

                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                    return R.error(4001, "Authorization无效,请重新登陆");
                }
            }

        }


        try {
            //Object resultObj = joinPoint.proceed();
            Object resultObj = joinPoint.proceed(joinPoint.getArgs());
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            return R.error(e.getMessage());
        } finally {
            long executiveMs = System.currentTimeMillis() - startMs;
            logger.debug("call " + joinPoint.toLongString() + " spend times : "
                    + executiveMs + " ms");
        }
    }


    /**
     * 是否启用签名认证
     *
     * @return true, 验证签名;false,不验证
     */
    private boolean checkToken() {

        if (!"dev-xxx".equals(env)) {
            //非开发模式启用签名认证
            String uri = request.getRequestURI();

            //白名单模式,以下接口不验证签名
            if (uri.indexOf("/user/login") > -1) {
                return false;
            } else if (uri.indexOf("/register") > -1) {
                return false;
            } else if (uri.indexOf("/getcode") > -1) {
                return false;
            } else if (uri.indexOf("/api/test1") > -1) {
                return false;
            }
            //---------------------
            return true;
        }

        return false;
    }


}
