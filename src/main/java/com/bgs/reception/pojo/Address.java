package com.bgs.reception.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author MrPan
 * @since 2019-08-28
 */
public class Address implements Serializable {

private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String name;

    /**
     * 级别
     */
    private Integer level;

    /**
     * 父节点
     */
    private Integer pid;

    private int open;

    public int Open() {
        return open;
    }

    public void setOpen(int open) {
        this.open = open;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "Address{" +
        "id=" + id +
        ", name=" + name +
        ", level=" + level +
        ", pid=" + pid +
        "}";
    }
}
