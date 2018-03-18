package com.nbs.jiaoxiao.wx;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.nbs.jiaoxiao.common.XbsUtils;
import com.nbs.jiaoxiao.exception.CheckToRuntimeException;

@Component
public class WxComponent {
	@Value("${wx.token}")
	private String token;
	@Value("${wx.appID}")
	private String appID;
	@Value("${wx.appsecret}")
	private String appsecret;

	private volatile String accessToken;
	private volatile long expireTime;
 
	
	public boolean checkSign(String signature, String timestamp, String nonce) {
		try {
			String[] strs = new String[] { token, timestamp, nonce };
			Arrays.sort(strs);
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(StringUtils.join(strs).toString().getBytes());
			return XbsUtils.toHex(digest).equals(signature.toLowerCase());
		} catch (NoSuchAlgorithmException e) {
			throw new CheckToRuntimeException(e);
		}
	}
	
	public String getAccessToken() {
		if(System.currentTimeMillis() < expireTime) {
			
		}
		return null;
	}

}
