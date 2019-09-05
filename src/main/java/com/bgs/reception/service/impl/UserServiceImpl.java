package com.bgs.reception.service.impl;

import com.bgs.reception.pojo.User;
import com.bgs.reception.mapper.UserMapper;
import com.bgs.reception.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author MrPan
 * @since 2019-08-28
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
