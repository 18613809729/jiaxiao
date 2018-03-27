package com.nbs.jiaoxiao.common;

import java.io.StringWriter;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaoxiao.exception.CheckToRuntimeException;
import com.nbs.jiaoxiao.wx.vo.XStreamCDATA;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;
import com.thoughtworks.xstream.io.xml.Dom4JDriver;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import com.thoughtworks.xstream.io.xml.XppDriver;

/**
 * xstream 工具类，使用全局xstream，避免创建大对象xstream，此类是线程安全的
 * 
 * @author lifeng8
 * 
 */
public class XStreamUtil {
	private static final Logger log = LoggerFactory.getLogger(XStreamUtil.class);
	private XStream xStream; 
	private Set<Class<?>> annotatedTypes = new HashSet<Class<?>>();
	private static volatile XStreamUtil instance;

	private XStreamUtil(){
		xStream = new XStream(new DomDriver());
		xStream.ignoreUnknownElements();
	}
	
	public static XStreamUtil getInstance() {
		if (instance == null) {
			synchronized (XStreamUtil.class) {
				if (instance == null) {
					instance = new XStreamUtil();
				}
			}
		}
		return instance;
	}

	public void processAnnotations(Class<?> type) {
		if (!annotatedTypes.contains(type)) {
			processAnnotationsSync(type);
		}
	}

	private synchronized void processAnnotationsSync(Class<?> type) {
		if (!annotatedTypes.contains(type)) {
			log.info("XStreamUtil processAnnotations {} ........", type.getSimpleName());
			xStream.processAnnotations(type);
			annotatedTypes.add(type);
		}
	}

	/**
	 * 序列化对象t成xml
	 * 
	 * @param t
	 * @return
	 */
	public <T> String serialize(T t) {
		return serialize(t, null);
	}

	/**
	 * 序列化对象t成xml，head为xml头部声明
	 * 
	 * @param t
	 * @param head
	 * @return
	 */
	public <T> String serialize(T t, String head) {
		log.info("XStreamUtil start serialize t:{}, head:{}", JSON.toJSONString(t), head);
		processAnnotations(t.getClass());
		StringWriter writer = new StringWriter();
		if (head != null && !"".equals(head)) {
			writer.append(head);
		}
		xStream.toXML(t, writer);
		String xml = writer.toString();
		log.info("XStreamUtil serialize result:\n{}", xml);
		return xml;
	}

	/**
	 * 从xml反序列化对象
	 * 
	 * @param cls
	 *            对象类型
	 * @param xml
	 * @return
	 */
	public <T> T deserialize(Class<T> cls, String xml) {
		try {
			return deserialize(xml, cls.newInstance());
		} catch (InstantiationException e) {
			throw new CheckToRuntimeException(e);
		} catch (IllegalAccessException e) {
			throw new CheckToRuntimeException(e);
		}
	}
	
	/**
	 * 从xml反序列化对象
	 * 
	 * @param cls
	 *            对象类型
	 * @param xml
	 * @return
	 */
	public <T> T deserialize(String xml, T t) {
		Class<? extends Object> cls = t.getClass();
		log.info("XStreamUtil start deserialize clazz:{}, xml\n:{}", cls.getSimpleName(), xml);
		processAnnotations(cls);
		xStream.fromXML(xml, t);
		log.info("XStreamUtil deserialize result:{}", JSON.toJSONString(t));
		return t;
	}
	
	@SuppressWarnings("unchecked")
	public static String toWxXML(Object obj) {
		StringBuilder sb = new StringBuilder();
		XStreamAlias alias = obj.getClass().getAnnotation(XStreamAlias.class);
		String rootName =  alias.value();
		sb.append("<").append(rootName).append(">");
		Field[] fields = obj.getClass().getDeclaredFields();
		for (Field field : fields) {
			field.setAccessible(true);
			Object val = null;
			try {
				val = field.get(obj);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				throw new CheckToRuntimeException(e);
			}
			if(val == null || (val instanceof String && StringUtils.isBlank((CharSequence) val))) {
				continue;
			}
			if(val instanceof List && CollectionUtils.isEmpty((Collection<?>) val)) {
				continue;
			}
			
			String fieldName = field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1);
			XStreamCDATA[] cdatas = field.getAnnotationsByType(XStreamCDATA.class);
			sb.append("\n").append("  <").append(fieldName).append(">");
			if(val instanceof List) {
				List<Object> lst = (List<Object>) val;
				for (Object item : lst) {
					sb.append("\n").append(toWxXML(item)).append("\n");
				}
			} else {
				if(cdatas != null && cdatas.length > 0) {
					sb.append("<![CDATA[").append(val).append("]]>");
				} else {
					sb.append(val);
				}
			}
			sb.append("</").append(fieldName).append(">");
		}
		sb.append("\n</").append(rootName).append(">");
		return sb.toString();
	}
}