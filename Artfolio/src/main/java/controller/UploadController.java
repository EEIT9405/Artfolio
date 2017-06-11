package controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

    
    @RequestMapping(value = "/Upload/saveupload.controller", method = RequestMethod.POST)
    public String upload(
    @RequestParam(value = "file", required = false) MultipartFile file,
    HttpServletRequest request, ModelMap model) {
        //建立你要儲存的檔案的路徑
        String path = request.getSession().getServletContext().getRealPath("lupload");
        //獲取該檔案的檔案名
        String fileName = file.getOriginalFilename();

        File targetFile = new File(path, fileName);
        if (!targetFile.exists()) {
            targetFile.mkdirs();
        }
        // 儲存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //將該檔案的路徑給客戶端，讓其可以請求該圖片
        model.addAttribute("fileUrl", request.getContextPath() + "/lupload/"+ fileName);
        return "UploadIndex";
    }
}