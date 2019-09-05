package com.bgs.reception.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.bgs.reception.pojo.ForecastData;
import com.bgs.reception.service.ForecastDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
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
@RequestMapping("/forecastData")
public class ForecastDataController {

    @Autowired
    private ForecastDataService forecastDataService;


    @RequestMapping("addforecastData")
    @ResponseBody
    public Boolean addforecastData(ForecastData forecastData){

        Date entryTime =new Date();

        forecastData.setEntryTime(entryTime);

        forecastData.setStatus(0);

        Boolean b=forecastDataService.save(forecastData);

        return b;
    }

    @RequestMapping("AllForecastData")
    @ResponseBody
    public List<ForecastData> AllForecastData(){

        /*List<ForecastData> list=forecastDataService.list();*/

        QueryWrapper<ForecastData> queryWrapper=new QueryWrapper<>();

        queryWrapper.lambda().eq(ForecastData::getStatus,0);

        List<ForecastData> ForList=forecastDataService.list(queryWrapper);


        return ForList;

    }

    @RequestMapping("UpForecastData")
    @ResponseBody
    public Boolean UpForecastData(ForecastData forecastData){

        Boolean b=forecastDataService.removeById(forecastData);

        return b;

    }

}

