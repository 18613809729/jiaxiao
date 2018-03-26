package com.nbs.jiaoxiao.common;

import java.io.StringWriter;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaoxiao.exception.CheckToRuntimeException;
import com.thoughtworks.xstream.XStream;
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
}