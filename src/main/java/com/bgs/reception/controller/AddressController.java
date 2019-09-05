package com.bgs.reception.controller;


import com.bgs.reception.pojo.Address;
import com.bgs.reception.service.AddressService;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author MrPan
 * @since 2019-08-28
 */
@Controller
@RequestMapping("/address")
public class AddressController {


    @Resource
    private AddressService addressService;


    @RequestMapping("AllressAll")
    @ResponseBody
    public List<Address> AddressAll(){

    List<Address> list=addressService.list();

        return list;
    }


    @RequestMapping("AddAddress")
    @ResponseBody
    public Boolean AddAddress(Address address){

        boolean i=addressService.save(address);


        return i;
    }

    @RequestMapping("delete")
    @ResponseBody
    public Boolean delete(Integer id){

        Boolean i=addressService.removeById(id);

        return i;

    }

    @RequestMapping("upaddress")
    @ResponseBody
    public Boolean upaddress(Address address){

        Boolean i=addressService.saveOrUpdate(address);

        return i;

    }
}

