package com.sibo.api.aop;

// import org.apache.commons.lang.StringUtils;

import com.sibo.api.entity.UserTokenDtoEntity;
import com.sibo.api.utils.LocalUtil;
import com.sibo.common.exception.ApiException;
import com.sibo.common.utils.DateUtils;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import java.util.Arrays;
import java.util.Enumeration;

public abstract class BaseAspect {

    private final static Logger logger = LoggerFactory.getLogger(BaseAspect.class);

    /**
     * 当前激活的配置文件
     */
    @Value("${spring.profiles.active}")
    protected String env;

    /**
     * 密钥
     */
    @Value("${application.api.secret}")
    protected String SECRET;

    @Autowired(required = false)
    protected HttpServletRequest request;

    @Autowired(required = false)
    protected HttpServletResponse response;

    /**
     * 打印请求参数
     */
    protected void logRequestInfo(ProceedingJoinPoint joinPoint) {
        // 记录下请求内容
        logger.info("URL : {}", request.getRequestURL().toString());
        logger.info("URI : {}", request.getServletPath());
        logger.info("HTTP_METHOD : {}", request.getMethod());
        logger.info("QUERY_STRING : {}", request.getQueryString());
        logger.info("IP : {}", request.getRemoteAddr());
        logger.info("CLASS_METHOD : {}.{}", joinPoint.getSignature().getDeclaringTypeName(), joinPoint.getSignature().getName());
        logger.info("ARGS : {}", Arrays.toString(joinPoint.getArgs()));
        //--------------------------
        Enumeration<String> allHeader = request.getHeaderNames();
        Enumeration<String> allPara = request.getParameterNames();

        String msgHeader = "";
        String msgPara = "";
        while (allHeader.hasMoreElements()) {
            String value = allHeader.nextElement();
            msgHeader += value + "=" + request.getHeader(value) + ", ";
        }

        while (allPara.hasMoreElements()) {
            String value = allPara.nextElement();
            msgPara += value + "=" + request.getParameter(value) + ", ";
        }
        //---------------------------
        logger.info("-------------------------");
        logger.info("HEADER : {}", msgHeader);
        logger.info("PARAMETER : ", msgPara);
        logger.info("-------------------------");
        //---------------------------
    }

    /**
     * 签名认证
     *
     * @return void, 验证不通过直接抛出异常
     */
    protected void checkAuthorizationOrToken() throws Exception {

        String requestAuthorizationOrToken = getAuthorizationOrToken();
        logger.debug("Authorization/token=" + requestAuthorizationOrToken);

        if (isCheckAuthorizationOrToken()) {
            //-----------------------
            if (StringUtils.isEmpty(requestAuthorizationOrToken)) {
                LocalUtil.setLocalUser(null);
                throw new ApiException("Authorization/token无效");
            } else {
                try {

                    //This line will throw an exception if it is not a signed JWS (as expected)
                    Claims claims = Jwts.parser()
                            .setSigningKey(DatatypeConverter.parseBase64Binary(SECRET))
                            .parseClaimsJws(requestAuthorizationOrToken).getBody();
                    //----------------Custom Claims-----------------
                    logger.debug("Custom Claims(1): {}", claims.get("user_uuid"));
                    //----------------------------------
                    logger.debug("ID: {}", claims.getId());
                    logger.debug("Subject: {}", claims.getSubject());
                    logger.debug("Expiration: {}", claims.getExpiration());
                    logger.debug("Expiration(Str): {}", DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD_HH_MM_SS, claims.getExpiration()));

                    if (claims.getExpiration().getTime() < System.currentTimeMillis()) {
                        throw new ApiException(4100, "Authorization/token令牌已过期,请重新获取!");
                    }
                    //--------
                    //--------
                    Long userId = Long.parseLong(claims.getId());
                    //--------------------
                    UserTokenDtoEntity dtoEntity = new UserTokenDtoEntity();
                    dtoEntity.setUserid(userId);
                    dtoEntity.setAuthorization(requestAuthorizationOrToken);

                    LocalUtil.setLocalUser(dtoEntity);

                } catch (io.jsonwebtoken.JwtException ex) {
                    logger.debug(ex.getMessage());
                    throw new ApiException(4001, "Authorization/token无效,请重新登陆");
                }
            }

            //-----------------------
        }

    }

    /**
     * 获取请求的Authorization
     */
    protected String getAuthorizationOrToken() {
        String authorization = getRequestHeadOrPara("Authorization");
        if (StringUtils.isEmpty(authorization)) {
            authorization = getRequestHeadOrPara("token");
        }
        return authorization;
    }

    protected String getRequestHeadOrPara(String key) {
        String value = request.getHeader(key);
        if (StringUtils.isEmpty(value)) {
            value = request.getParameter(key);
        }
        return value;
    }

    /**
     * 是否启用签名认证
     * 子类自定义具体验证的url
     *
     * @return true, 验证签名;false,不验证
     */
    protected abstract boolean isCheckAuthorizationOrToken();

}
