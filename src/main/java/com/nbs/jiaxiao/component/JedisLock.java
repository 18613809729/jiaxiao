package com.nbs.jiaxiao.component;

import java.io.Closeable;
import java.io.IOException;
import java.util.Random;
import java.util.concurrent.TimeoutException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


/**
 * 使用redis实现的分布式锁
 * 
 * @author lifeng8
 * 
 */
@Component
public class JedisLock {
	private static final Logger LOGGER = LoggerFactory.getLogger(JedisLock.class);

	private static final long ONE_MILLI_NANOS = 1000000L;

	private static final long DEFAULT_WAIT_TIME = 10000;// 默认超时时间（毫秒）

	private static final int EXPIRE = 30;//

	private static Random r = new Random();

	private static Jedis jedis;

	private static boolean setnxAndExpire(String key, String value, int seconds) {
		long result = jedis.setnx(key, value);
		if (result == 1) {
			jedis.expire(key, seconds);
		} else if (jedis.ttl(key) < 0) {
			LOGGER.warn("expire key {} is persistence or none exist, will expire the key", key);
			jedis.expire(key, seconds);
		}
		return result == 1;
	}

	
	/**
	 * 循环获取分布式锁
	 * 
	 * @param key
	 * @param waitTime
	 * @return
	 */
	public static Lock lock(String key, long waitTime) {
		LOGGER.info("get lock {}", key);
		long startTime = System.nanoTime();
		long waitTimeNaNo = waitTime * ONE_MILLI_NANOS;
		String rand = String.valueOf(r.nextDouble());
		while (true) {
			if (setnxAndExpire(key, rand, EXPIRE)) {
				break;
			}
			try {
				Thread.sleep(100, r.nextInt(500));
				if (System.nanoTime() - startTime > waitTimeNaNo) {
					throw new TimeoutException("get lock " + key + " timeout");
				}
			} catch (TimeoutException e) {
				throw new RuntimeException(e);
			} catch (InterruptedException e) {
				throw new RuntimeException(e);
			}
		}
		return new Lock(key, rand);
	}

	/**
	 * 尝试获取锁，若锁已被占用，立即返回null
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Lock tryLock(String key) {
		return tryLock(key, EXPIRE);
	}

	/**
	 * 尝试获取锁，若锁已被占用，立即返回null
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public static Lock tryLock(String key, int expireTime) {
		LOGGER.info("try get lock {}", key);
		String rand = String.valueOf(r.nextInt());
		return setnxAndExpire(key, rand, expireTime) ? new Lock(key, rand) : null;
	}

	public static Lock lock(String key) {
		return lock(key, DEFAULT_WAIT_TIME);
	}
	
	

	public Jedis getJedis() {
		return jedis;
	}

	@Autowired
	public void setJedis(Jedis jedis) {
		JedisLock.jedis = jedis;
	}



	public static class Lock implements Closeable {
		private String key;
		private String rand;

		public Lock(String key, String rand) {
			this.key = key;
			this.rand = rand;
		}

		@Override
		public void close() throws IOException {
			LOGGER.info("release lock {}", key);
			try {
				String value = jedis.get(key);
				if (rand.equals(value)) {
					jedis.del(key);// 说明当前的锁是自己锁定的
				} else {
					LOGGER.warn("del the lock {key: {}, rand: {}} fail, redis value is {}", key, rand, value);
				}
			} catch (Exception e) {
				LOGGER.error("release lock error", e);
			}
		}

	}
}
