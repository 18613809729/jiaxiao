package com.nbs.jiaxiao.common;

import java.text.MessageFormat;
import java.util.Collection;
import java.util.List;

import com.nbs.jiaxiao.exception.NotFoundException;

public class NbsUtils {
	
	public static String toHex(byte[] bytes) {
		final String HEX = "0123456789abcdef";
		StringBuilder sb = new StringBuilder(bytes.length * 2);
		for (byte b : bytes) {
			// 取出这个字节的高4位，然后与0x0f与运算，得到一个0-15之间的数据，通过HEX.charAt(0-15)即为16进制数
			sb.append(HEX.charAt((b >> 4) & 0x0f));
			// 取出这个字节的低位，与0x0f与运算，得到一个0-15之间的数据，通过HEX.charAt(0-15)即为16进制数
			sb.append(HEX.charAt(b & 0x0f));
		}

		return sb.toString();
	}
	
	public static void assertNotNull(Object obj, String msg, Object ... args) {
		if(obj == null) {
			throw new NotFoundException(MessageFormat.format(msg, args));
		}
	}
	
	public static void assertExist(int count, String msg, Object ... args) {
		if(count == 0) {
			throw new NotFoundException(MessageFormat.format(msg, args));
		}
	}
	
	
	public static void assertNotEmpty(Collection<? extends Object> collection, String msg, Object ... args) {
		if(collection == null || collection.size() == 0) {
			throw new NotFoundException(MessageFormat.format(msg, args));
		}
	}
	
	public static <T> T getFirst(List<T> lst) {
		return lst != null && lst.size() > 0 ? lst.get(0) : null;
	}
	
}
