package com.sibo.api.utils;

import cn.hutool.core.text.StrFormatter;
import org.apache.commons.lang3.StringUtils;

/**
 * https://github.com/JoanZapata/string-format
 */
public class MyFileUtils {

    public static String getRandomFileNameByFileName(String filename) {
        if (StringUtils.isBlank(filename))
            return System.currentTimeMillis() + "";

        //-------------------
        int commaIndex = filename.lastIndexOf(".");
        String extensionName = filename.substring(commaIndex + 1);
        String filenameExcludeExtensionName = filename.substring(0, commaIndex);
        String newFilename = StrFormatter.format(
                "{}_{}.{}", filenameExcludeExtensionName, System.currentTimeMillis(), extensionName);

        return newFilename;
    }

}
