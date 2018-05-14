package com.nbs.jiaxiao.wx;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.MessageFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
import java.util.function.Function;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.common.HttpUtil;
import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.component.Jedis;
import com.nbs.jiaxiao.component.JedisLock;
import com.nbs.jiaxiao.component.JedisLock.Lock;
import com.nbs.jiaxiao.constant.RedisKey;
import com.nbs.jiaxiao.exception.CheckToRuntimeException;
import com.nbs.jiaxiao.exception.RpcException;
import com.nbs.jiaxiao.wx.vo.BaseRes;
import com.nbs.jiaxiao.wx.vo.CommonRes;
import com.nbs.jiaxiao.wx.vo.UserInfo;

@Component
public class WxComponent {
	//private static final Logger LOGGER = LoggerFactory.getLogger(WxComponent.class);
	@Value("${wx.token}")
	private String token;
	@Value("${wx.appID}")
	private String appID;
	@Value("${wx.appsecret}")
	private String appsecret;
	
	@Resource
	private Jedis jedis;
 
	
	public boolean checkSign(String signature, String timestamp, String nonce) {
		try {
			String[] strs = new String[] { token, timestamp, nonce };
			Arrays.sort(strs);
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(StringUtils.join(strs).toString().getBytes());
			return NbsUtils.toHex(digest).equals(signature.toLowerCase());
		} catch (NoSuchAlgorithmException e) {
			throw new CheckToRuntimeException(e);
		}
	}
	
	public String getAccessToken() {
		return safeGet(RedisKey.LOCK_ACCESS_TOKEN, RedisKey.ACCESS_TOKEN, cacheKey -> {
			String resStr = HttpUtil.get(MessageFormat.format(WxConstant.ACCESS_TOKEN_URL, appID, appsecret));
			CommonRes commonRes = JSON.parseObject(resStr, CommonRes.class);
			if(BaseRes.SUCCESS != commonRes.getErrcode()) {
				throw new RpcException("get access_token error,res:" + resStr);
			}
			return new Object[] {commonRes.getAccess_token(), commonRes.getExpires_in() - 30};
		});
	}
	
	public CommonRes getLoginAccessToken(String code) {
		String res = HttpUtil.get(MessageFormat.format(WxConstant.LOGIN_ACCESS_TOKEN_URL, appID, appsecret, code));
		CommonRes commonRes = JSON.parseObject(res, CommonRes.class);
		if(BaseRes.SUCCESS != commonRes.getErrcode()) {
			throw new RpcException("get LoginAccessToken error,res:" + res);
		}
		return commonRes;
	}
	
	
	public UserInfo getUserInfo(String accessToken, String openid) {
		String res = HttpUtil.get(MessageFormat.format(WxConstant.USERINFO_URL, accessToken, openid));
		com.nbs.jiaxiao.wx.vo.UserInfo userInfo = JSON.parseObject(res, UserInfo.class);
		if(BaseRes.SUCCESS != userInfo.getErrcode()) {
			throw new RpcException("get LoginAccessToken error,res:" + res);
		}
		return userInfo;
	}
	
	public String getJsApiToken() {
		return safeGet(RedisKey.LOCK_JSAPI_TOKEN, RedisKey.JSAPI_TOKEN, cacheKey -> {
			String res = HttpUtil.get(MessageFormat.format(WxConstant.JS_API_TOKEN_URL, getAccessToken()));
			CommonRes commonRes = JSON.parseObject(res, CommonRes.class);
			if(BaseRes.SUCCESS != commonRes.getErrcode()) {
				throw new RpcException("get LoginAccessToken error,res:" + res);
			}
			return new Object[] {commonRes.getTicket(), commonRes.getExpires_in() - 30};
		}) ;
	}
	
	
	
	private String safeGet(String lockKey, String cacheKey, Function<String, Object[]> fun) {
		try {
			String res = jedis.get(cacheKey);
			if(StringUtils.isBlank(res)) {
				try(Lock lock = JedisLock.lock(lockKey)){
					 res = jedis.get(cacheKey);
					if(StringUtils.isBlank(res)) {
						Object[] objs = fun.apply(cacheKey);
						res = (String) objs[0];
						int expireTime = (int) objs[1];
						if(expireTime > 1) {
							jedis.setex(cacheKey, expireTime, res);
						}
					}
				}
			}
			return res;
		} catch (IOException e) {
			throw new CheckToRuntimeException(e);
		}
	}
	
	
	public static void main(String[] args) {
		System.out.println(LocalDateTime.ofInstant(Instant.ofEpochMilli(new Date().getTime()), ZoneId.systemDefault()));
	}

}
