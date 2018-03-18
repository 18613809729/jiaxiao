package com.nbs.jiaoxiao.wx;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.buf.HexUtils;

import com.nbs.jiaoxiao.exception.CheckToRuntimeException;

public class WxUtils {

	public static boolean checkSign(String token, String signature, String timestamp, String nonce) {
		try {
			String[] strs = new String[] { token, timestamp, nonce };
			Arrays.sort(strs);
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(StringUtils.join(strs).toString().getBytes());
			return HexUtils.toHexString(digest).toUpperCase().equals(signature.toUpperCase());
		} catch (NoSuchAlgorithmException e) {
			throw new CheckToRuntimeException(e);
		}
	}

}
