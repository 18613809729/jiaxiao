package com.nbs.jiaoxiao.wx;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import com.nbs.jiaoxiao.common.DateUtils;
import com.nbs.jiaoxiao.common.HttpUtil;
import com.nbs.jiaoxiao.common.NbsUtils;
import com.nbs.jiaoxiao.exception.CheckToRuntimeException;
import com.nbs.jiaoxiao.exception.RpcException;
import com.nbs.jiaoxiao.wx.vo.AccessTokenRes;

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
					String res = HttpUtil.get("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appID + "&secret=" + appsecret);
					AccessTokenRes accessTokenRes = JSON.parseObject(res, AccessTokenRes.class);
					if(AccessTokenRes.SUCCESS != accessTokenRes.getErrcode()) {
						throw new RpcException("get access_token error,res:" + res);
					}
					this.accessToken = accessTokenRes.getAccess_token();
					//失效事件当前系统事件 + token有效时间 - 5min
					this.expireTime = System.currentTimeMillis() + accessTokenRes.getExpires_in() * DateUtils.MILLIS_PER_SECOND  - 5 * DateUtils.MILLIS_PER_MINUTE;
					LOGGER.info("refesh access_token {} , expired at {}", accessToken, LocalDateTime.ofInstant(Instant.ofEpochMilli(expireTime), ZoneId.systemDefault()));
				}
			}
		}
		return accessToken;
	}
	
	public static void main(String[] args) {
		System.out.println(LocalDateTime.ofInstant(Instant.ofEpochMilli(new Date().getTime()), ZoneId.systemDefault()));
	}

}
