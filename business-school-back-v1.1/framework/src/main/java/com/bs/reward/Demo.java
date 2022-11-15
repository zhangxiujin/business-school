package com.bs.reward;

/**
 * 递归
 */
public class Demo {
    public static void main(String[] args) {
        Demo demo = new Demo();
        demo.invoke(10); //java.lang.StackOverflowError
    }

    public void invoke(int number) {
        if (number == 0) {
            return;
        }
        -- number;
        invoke(number);
    }
}
