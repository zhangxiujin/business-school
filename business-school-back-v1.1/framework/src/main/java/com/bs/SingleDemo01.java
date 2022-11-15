package com.bs;

import com.bs.reward.po.Reward;

/**
 * 单例模式，整个项目执行过程中，只能创建一个对象
 */
public class SingleDemo01 {

    private volatile int num = 1;

    public static Reward getReward() {
        return InnerClass.reward;
    }

    public void monitor() {
        new Thread(() -> {
            while (true) {
                if(num <= 0) {
                    System.out.println("num <= 0");
                    break;
                }
            }
            System.out.println("监听停止");
        }).start();
    }

    public void update() throws InterruptedException {
        while(true) {
            num--;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        SingleDemo01 single = new SingleDemo01();
        single.monitor();
        Thread.sleep(1000);
        single.update();
    }

    static class InnerClass {
        private static transient Reward reward;

        static {
            try {
                reward = initBean();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }

        public static Reward initBean()
                throws ClassNotFoundException, InstantiationException, IllegalAccessException {
            System.out.println("initbean");
            if (reward == null) {
                Class<?> aClass = Class.forName("com.bs.reward.po.Reward");
                Object o = aClass.newInstance();
                return (Reward) o;
            }
            return reward;
        }
    }

}
