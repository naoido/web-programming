package com.naoido.webpro.dao;

import com.naoido.webpro.model.Result;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.stream.Collectors;

public class ResultDao {
    public static final ResultDao INSTANCE = new ResultDao();
    private static final String REDIS_HOST = System.getenv("REDIS_HOST");
    private static final int REDIS_PORT = 6379;
    private static final String REDIS_KEY = "fortune_history";
    private static final int HISTORY_SIZE = 9; // 10個を保存したい!!

    private ResultDao() {}

    public List<Result> getResults() {
        try (Jedis jedis = new Jedis(REDIS_HOST, REDIS_PORT)) {
            return jedis.lrange(REDIS_KEY, 0, -1).stream().map(Result::new).collect(Collectors.toList());
        }
    }

    public boolean saveResult(String username, String title, String result) {
        try (Jedis jedis = new Jedis(REDIS_HOST, REDIS_PORT)) {
            jedis.lpush(REDIS_KEY, username + "," + title + "," + result);
            jedis.ltrim(REDIS_KEY, 0, HISTORY_SIZE);

            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
