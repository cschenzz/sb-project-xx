package com.sibo.api.controller;

import cn.hutool.core.text.StrFormatter;
import com.sibo.api.utils.MyFileUtils;
import com.sibo.framework.config.SbConfig;
import com.sibo.framework.web.entity.R;
import org.apache.commons.io.IOUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-10-11 16:18:21
 */
@RestController
@RequestMapping("/api/file")
public class FileController {

    // @Autowired
    // private SbConfig sbConfig;

    @RequestMapping(value = "/uploadAvatar", method = RequestMethod.POST)
    public R uploadProject(@RequestParam(value = "file", required = false) MultipartFile file) throws Exception {

        if (file == null || StringUtils.isEmpty(file.getOriginalFilename())) {
            return R.error("文件为null或者非法文件");
        }
        //-------------------

        String saveFolder = StrFormatter.format("{}avatar/", SbConfig.getPatientAvatarPath());

        String saveFileName = saveUploadFile(file, saveFolder);
        return R.ok().data(saveFileName);
    }

    private String saveUploadFile(MultipartFile file, String saveFolder) throws IOException {
        //-------------------

        String saveFileName = MyFileUtils.getRandomFileNameByFileName(file.getOriginalFilename());


        System.out.println("folder=" + saveFolder);

        Path saveFolderPath = Paths.get(saveFolder);
        File saveFolderPathFile = saveFolderPath.toFile();
        // 不存在则创建一个目录
        if (!saveFolderPathFile.exists()) {
            saveFolderPathFile.mkdirs();
        }

        //--------------------保存文件操作-------------------------------
        //得到原始文件的输入流
        InputStream in = file.getInputStream();

        //得到新文件的输出流
        FileOutputStream out = new FileOutputStream(saveFolder + saveFileName);

        //将OutputStream复制到InputStream大文件(超过2GB),这个方法已经使用了缓存,所以不再需要缓存 如果文件大小超过2GB,则返回-1
        IOUtils.copy(in, out);

        in.close(); //close errors are handled
        out.close();
        return saveFileName;
        //--------------------------------------------------------------
    }

}
