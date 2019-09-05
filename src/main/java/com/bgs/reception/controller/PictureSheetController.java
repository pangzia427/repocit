package com.bgs.reception.controller;


import com.bgs.reception.pojo.PictureSheet;
import com.bgs.reception.service.PictureSheetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MrPan
 * @since 2019-09-02
 */
@Controller
@RequestMapping("/pictureSheet")
public class PictureSheetController {

    @Autowired
    private PictureSheetService pictureSheetService;


    /*@RequestMapping("gallerySC")
    @ResponseBody
    public Boolean gallerySC(MultipartFile[] shenfen,PictureSheet pictureSheet){

    Boolean b=pictureSheetService.

    }*/
}

