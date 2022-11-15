package com.bs.common.upload.controller;

import com.bs.common.config.MinIoClientConfig;
import com.bs.common.response.ResponseResult;
import com.bs.common.upload.po.Attach;
import com.bs.common.upload.service.AttachServiceImpl;
import com.bs.common.upload.util.MinioUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@RestController
@RequestMapping("/upload")
public class UploadController {
    @Autowired
    private MinioUtils minioUtils;
    @Autowired
    private AttachServiceImpl attachService;
    @Autowired
    private MinIoClientConfig minIoClientConfig;

    //传统的ajax请求头：content-type : application/json
    //文件上传 : content-type: multipart/form-data
    // Object Storage Service(OSS)对象存储服务，minio，阿里云，腾讯云
    @Transactional
    @PostMapping("/uploadFile")
    public ResponseResult uploadFile(MultipartFile file) throws IOException {
        //先保存到数据库再上传文件
        MultipartFile[] files = new MultipartFile[1];
        files[0] = file;
        List<Attach> attachList = minioUtils.upload(files);
//        System.out.println(attachList.toString());
        return new ResponseResult(attachList);
    }

/* 上传文件到本地磁盘
    @PostMapping("/uploadFile")
    public void uploadFile(MultipartFile file) throws IOException {
        FileOutputStream fos = null;
        InputStream inputStream = null;
        try {
            String contentType = file.getContentType();
            System.out.println(contentType);
            inputStream = file.getInputStream();
            fos = new FileOutputStream("uploadfile");
            byte[] bytes = new byte[8192];  //8192是io读写效率最高的缓冲大小
            int len = 0;
            // 读了多少，通过 inputstream.read方法的返回值来判断
            // 一次read要经过 用户态切换到内核，再从内核切换到用户态 (很耗时的过程)
            while((len = inputStream.read(bytes)) != -1) {
                fos.write(bytes, 0, len);
            }
        } finally {
            fos.flush();
            fos.close();
            inputStream.close();
        }
    }
 */

}
