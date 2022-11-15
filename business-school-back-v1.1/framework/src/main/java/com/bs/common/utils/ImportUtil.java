package com.bs.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ImportUtil {

    /**
     * 获取敏感词到List集合中
     * @param dir
     * @return
     * @throws IOException
     */
    public static List<String> importSensitive(File dir) throws IOException {
        if (dir.exists() && dir.isDirectory()) {  //判断是否存在，并且是目录
            FileReader fr = null;
            BufferedReader br = null;
            List<String> words = new ArrayList();
            File[] files = dir.listFiles();
            char[] chars = new char[1024];
            for (File file : files) {
                fr = new FileReader(file);
                br = new BufferedReader(fr);
                int len = 0;
                while (true) {
//                    String word = String.valueOf(chars, 0, len);  //offset从什么位置读取，度len个长度
                    String word = br.readLine();
                    if (word == null) {
                        break;
                    }
                    words.add(word);
                }
            }
            return words;
        }
        return null;
    }

    public static void main(String[] args) throws IOException {
        List<String> words = importSensitive(new File("E:\\idea-workspace-classes\\business-school-back-v1.1\\framework\\target\\classes\\sensitives"));
        System.out.println(words);
    }
}
