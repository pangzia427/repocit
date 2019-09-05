package com.bgs.reception.controller;


import com.bgs.reception.pojo.ForecastData;
import com.bgs.reception.pojo.ReportingData;
import com.bgs.reception.service.ForecastDataService;
import com.bgs.reception.service.ReportingDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MrPan
 * @since 2019-09-02
 */
@Controller
@RequestMapping("/reportingData")
public class ReportingDataController {

    @Autowired
    private ReportingDataService reportingDataService;

    @Autowired
    private ForecastDataService forecastDataService;

    @RequestMapping("AddReportingData")
    @ResponseBody
    public Boolean AddReportingData(ReportingData reportingData){

        Boolean a=reportingDataService.save(reportingData);

        if(a){
            ForecastData forecastData=new ForecastData();

            forecastData.setId(reportingData.getForecastid());

            forecastData.setStatus(1);

            forecastDataService.updateById(forecastData);

        }

        return a;

    }


}

