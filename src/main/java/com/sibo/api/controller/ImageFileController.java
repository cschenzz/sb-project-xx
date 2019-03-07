package com.sibo.api.controller;

import cn.hutool.core.text.StrFormatter;
import com.sibo.framework.config.SbConfig;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-10-11 16:18:21
 */
@Controller
@RequestMapping("/app/html")
public class ImageFileController {


    /**
     * 根据头像文件名查看头像
     * http://localhost:9999/app/html/img/aaa_1533264881538.jpg
     */
    @GetMapping("/img/{filename}")
    public void showImg(@PathVariable("filename") String fileName, HttpServletResponse response) throws Exception {

        //-------------------

        String fileFolder = StrFormatter.format("{}/avatar/", SbConfig.getPatientAvatarPath());
        System.out.println("folder=" + fileFolder);
        //-------------------

        try (
                //jdk7新特性，可以直接写到try()括号里面，java会自动关闭
                InputStream inputStream = new FileInputStream(new File(fileFolder, fileName));
                OutputStream outputStream = response.getOutputStream()
        ) {
            //指明为下载
            response.setContentType("application/x-download");
            response.addHeader("Content-Disposition", "attachment;fileName=" + fileName);   // 设置文件名

            //把输入流copy到输出流
            IOUtils.copy(inputStream, outputStream);
            outputStream.flush();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //-------------------------------

    }


}
