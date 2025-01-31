package com.naoido.webpro.model;

public class Result {
    private final String username;
    private final String title;
    private final String result;

    public Result(String line) {
        String[] split = line.split(",");
        if (split.length != 3) {
            throw new IllegalArgumentException("文字列が正しくなさそうw");
        }
        this.username = split[0];
        this.title = split[1];
        this.result = split[2];
    }

    public String getUsername() {
        return username;
    }

    public String getTitle() {
        return title;
    }

    public String getResult() {
        return result;
    }
}
