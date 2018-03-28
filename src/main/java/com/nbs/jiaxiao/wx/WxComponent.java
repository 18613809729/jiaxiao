package com.nbs.jiaxiao.wx;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.MessageFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.common.DateUtils;
import com.nbs.jiaxiao.common.HttpUtil;
import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.exception.CheckToRuntimeException;
import com.nbs.jiaxiao.exception.RpcException;
import com.nbs.jiaxiao.wx.vo.BaseRes;
import com.nbs.jiaxiao.wx.vo.CommonRes;
import com.nbs.jiaxiao.wx.vo.UserInfo;

@Component
public class WxComponent {
	private static final Logger LOGGER = LoggerFactory.getLogger(WxComponent.class);
	@Value("${wx.token}")
	private String token;
	@Value("${wx.appID}")
	private String appID;
	@Value("${wx.appsecret}")
	private String appsecret;
	

	private volatile String accessToken;
	private volatile long expireTime = Long.MAX_VALUE;
 
	
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
		if(System.currentTimeMillis() < expireTime) {
			synchronized (this) {
				if(System.currentTimeMillis() < expireTime) {
					String resStr = HttpUtil.get(MessageFormat.format(WxConstant.ACCESS_TOKEN_URL, appID, appsecret));
					CommonRes commonRes = JSON.parseObject(resStr, CommonRes.class);
					if(BaseRes.SUCCESS != commonRes.getErrcode()) {
						throw new RpcException("get access_token error,res:" + resStr);
					}
					this.accessToken = commonRes.getAccess_token();
					//失效事件当前系统事件 + token有效时间 - 5min
					this.expireTime = System.currentTimeMillis() + commonRes.getExpires_in() * DateUtils.MILLIS_PER_SECOND  - 5 * DateUtils.MILLIS_PER_MINUTE;
					LOGGER.info("refesh access_token {} , expired at {}", accessToken, LocalDateTime.ofInstant(Instant.ofEpochMilli(expireTime), ZoneId.systemDefault()));
				}
			}
		}
		return accessToken;
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
	
	public static void main(String[] args) {
		System.out.println(LocalDateTime.ofInstant(Instant.ofEpochMilli(new Date().getTime()), ZoneId.systemDefault()));
	}

}