package com.bs;

import java.sql.Driver;

public class InnerClass {

    static {
        System.out.println("static" + InnerClass.num);
    }
    //类加载 -> 初始化
    private static Integer num = 10;
    private Integer age = 22;
    //静态代码块

    public InnerClass() {
        System.out.println("构造器");
    }
    // 代码块
    {
        System.out.println("non static");
    }


    public static void main(String[] args) {
        StaticInnerClass.method();
        StaticInnerClass.method();
        new InnerClass().new InnerClass1().m1();
        new StaticInnerClass().method2();
        int[][] arr = new int[1][2]; //{{1,2}}
        int[] a = arr[0];



    }
    //成员内部类
    class InnerClass1 {
        public void m1() {

        }
    }

    //静态内部类
    static class StaticInnerClass {
        public static void method() {}  //类的方法
        public void method2() {}
    }

    public void run() {
        //局部内部类
        class LocalInnerClass {

        }

        //匿名局部内部类
        new MyInterface(){
            @Override
            public void invoke() {

            }
        };

        new Runnable() {
            @Override
            public void run() {

            }
        };
    }

    //接口
    interface MyInterface {
        void invoke();
    }
}

class C1 {

}


