package com.nbs.jiaxiao.common;

import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import com.nbs.jiaxiao.exception.CheckToRuntimeException;


/**
 * DES 加解密
 * @author lifeng8
 *
 */
public class DESUtils {
	private static final String ALGORITHM = "DES";
	private static final String CIPHER = "DES/CBC/PKCS5Padding"; //"DES/ECB/PKCS5Padding";
	private static byte[] iv = { 89, 116, 48, 116, 67, 4, 66, 120 };

	/**
	 * 生成des密钥
	 * @return
	 */
	public static String generateKey() {
		try {
			KeyGenerator kg = KeyGenerator.getInstance(ALGORITHM);
			kg.init(new SecureRandom());
			SecretKey secretKey = kg.generateKey();
			return Base64.getEncoder().encodeToString(secretKey.getEncoded());
		} catch (NoSuchAlgorithmException e) {
			throw new CheckToRuntimeException(e);
		}
	}

	private static SecretKey toKey(byte[] key) {
		try {
			DESKeySpec dks = new DESKeySpec(key);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(ALGORITHM);
			return keyFactory.generateSecret(dks);
		} catch (GeneralSecurityException e) {
			throw new CheckToRuntimeException(e);
		}
	}

	private static byte[] doFinal(int mode, byte[] data, byte[] key) {
		try {
			Cipher cipher = Cipher.getInstance(CIPHER);
			if (CIPHER.contains("/CBC/")) {
				cipher.init(mode, toKey(key), new IvParameterSpec(iv));
			} else {
				cipher.init(mode, toKey(key));
			}
			return cipher.doFinal(data);
		} catch (GeneralSecurityException e) {
			throw new CheckToRuntimeException(e);
		}
	}

	public static byte[] encrypt(byte[] data, byte[] key) {
		return doFinal(Cipher.ENCRYPT_MODE, data, key);
	}

	public static String encrypt(String data, String key) {
		return Base64.getEncoder().encodeToString(encrypt(data.getBytes(), Base64.getDecoder().decode(key)));
	}

	public static byte[] decrypt(byte[] data, byte[] key) {
		return doFinal(Cipher.DECRYPT_MODE, data, key);
	}

	public static String decrypt(String data, String key) {
		return new String(decrypt(Base64.getDecoder().decode(data), Base64.getDecoder().decode(key)));
	}

	public static void main(String[] args) {
		String clearText  = "89.09";
		String key = generateKey();
		String cipherText =  encrypt(clearText, key);
		System.out.println("密钥:" + key);
		System.out.println("密文:" + cipherText);
		System.out.println("明文:" + decrypt(cipherText, key));
	}
}
