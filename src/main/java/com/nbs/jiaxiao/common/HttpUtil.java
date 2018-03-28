package com.nbs.jiaxiao.common;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.net.ssl.SSLContext;

import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustAllStrategy;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nbs.jiaxiao.exception.CheckToRuntimeException;


public class HttpUtil {
	private static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);
	public static final Charset GBK  = Charset.forName("GBK");
	public static final Charset UTF_8 = Charset.forName("UTF-8");
	public static final ContentType GBK_XML = ContentType.create("application/xml", GBK);
	public static final ContentType UTF8_XML = ContentType.create("application/xml", UTF_8);
	public static final ContentType GBK_JSON = ContentType.create("application/json", GBK);
	public static final ContentType UTF8_JSON = ContentType.create("application/json", UTF_8);
	
	private static volatile CloseableHttpClient httpClient;
	
	private static CloseableHttpClient createSslClient() throws NoSuchAlgorithmException, KeyStoreException, KeyManagementException {
		SSLContext sslContext = SSLContexts.custom().loadTrustMaterial(null, new TrustAllStrategy()).build();
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext, new String[]{"SSLv2Hello", "SSLv3", "TLSv1", "TLSv1.2"}, null, NoopHostnameVerifier.INSTANCE);
		RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(5000).setSocketTimeout(5000).setConnectTimeout(5000).build();
		return HttpClients.custom().setSSLSocketFactory(sslsf).setDefaultRequestConfig(requestConfig).setMaxConnTotal(200).setMaxConnPerRoute(10).build();
	}

	private static CloseableHttpClient getHttpClient() throws KeyManagementException, NoSuchAlgorithmException, KeyStoreException {
		if (httpClient == null) {
			synchronized (HttpUtil.class) {
				if (httpClient == null) {
					httpClient = createSslClient();
				}
			}
		}
		return httpClient;
	}

	private static void closeResponse(CloseableHttpResponse response) {
		if (response != null) {
			try {
				response.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static String post(String url, String data, ContentType contentType, int ... socketTimeout){
		return post(url, new StringEntity(data, contentType), socketTimeout);
	}
	

	public static String post(String url, List<? extends NameValuePair> parameters, Charset charset, int ... socketTimeout){
		return post(url, new UrlEncodedFormEntity(parameters, charset), socketTimeout);
	}
	
    
    public static <A, B> B postXmlEntity(String url, A req, Class<B> resClass, Charset charset, int ... socketTimeout) {
    	XStreamUtil xStreamUtil = XStreamUtil.getInstance();
		String resXml = post(url, xStreamUtil.serialize(req), ContentType.create("application/xml", charset), socketTimeout);
		return xStreamUtil.deserialize(resClass, resXml);
    }

	public static String post(String url, HttpEntity entity, int ... socketTimeout) {
		CloseableHttpResponse response = null;
		try {
			HttpPost post = new HttpPost(url);
			if(socketTimeout.length > 0) {
				post.setConfig(RequestConfig.custom().setSocketTimeout(socketTimeout[0]).build());
			}
			post.setEntity(entity);
			response = getHttpClient().execute(post);
			if (HttpStatus.SC_OK != response.getStatusLine().getStatusCode()) {
				throw new HttpException("post error, url:" + url + ",status:" + response.getStatusLine().getStatusCode());
			}
			String result = EntityUtils.toString(response.getEntity());
			logger.info("post url {} result:{}", url, result);
			return result;
		} catch (Exception e) {
			throw new CheckToRuntimeException(e);
		} finally {
			closeResponse(response);
		}
	}
	
	public static String get(String url){
		CloseableHttpResponse response = null;
		try {
			logger.info("get url {}", url);
			HttpGet get = new HttpGet(url);
			response = getHttpClient().execute(get);
			if (HttpStatus.SC_OK != response.getStatusLine().getStatusCode()) {
				throw new HttpException("get error, url:" + url + ",status:" + response.getStatusLine().getStatusCode());
			}
			String res = EntityUtils.toString(response.getEntity());
			logger.info("get url {} res {}", url, res);
			return res;
		} catch (Exception e) {
			throw new CheckToRuntimeException(e);
		} finally {
			closeResponse(response);
		}
	}
	
	public static byte[] getImg(String url){
		CloseableHttpResponse response = null;
		try {
			logger.info("get url {}", url);
			HttpGet get = new HttpGet(url);
			response = getHttpClient().execute(get);
			if (HttpStatus.SC_OK != response.getStatusLine().getStatusCode()) {
				throw new HttpException("get error, url:" + url + ",status:" + response.getStatusLine().getStatusCode());
			}
			byte[] res = EntityUtils.toByteArray(response.getEntity());
			logger.info("get url {} length {}", url, res.length);
			return res;
		} catch (Exception e) {
			throw new CheckToRuntimeException(e);
		} finally {
			closeResponse(response);
		}
	}
	
}