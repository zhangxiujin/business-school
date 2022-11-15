package com.bs.reward;

import com.bs.reward.po.Reward;

import java.util.HashMap;
import java.util.Map;

public class HashMapTest {
    public static void main(String[] args) {
//        Map<Object, String> map = new HashMap<Object, String>();
//        Reward reward = new Reward();
//        reward.setRewardId(1L);
//        Reward reward2 = new Reward();
//        reward2.setRewardId(1L);
//        map.put(reward, "reward01");
//        map.put(reward2, "reward01");
//        System.out.println(map.size());
        Map<String, String> map = new HashMap<>(1);
        map.put("key1", "value1");
    }
}
