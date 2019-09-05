package com.bgs.reception.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author MrPan
 * @since 2019-09-02
 */
public class ForecastData implements Serializable {

private static final long serialVersionUID=1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 计划名称
     */
    @TableField("planName")
    private String planName;

    /**
     * 计划召开桌数
     */
    @TableField("planNumberTables")
    private Integer planNumberTables;

    /**
     * 开始时间
     */
    @JsonFormat(pattern="yyyy-MM-dd  HH:mm:ss" ,  timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @TableField("startTime")
    private Date startTime;

    /**
     * 结束时间
     */
    @JsonFormat(pattern="yyyy-MM-dd  HH:mm:ss" ,  timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @TableField("endTime")
    private Date endTime;

    /**
     * 没时间是‘0’，实际上报改为‘1’
     */
    private int status;

    /**
     * 录入时间
     */
    @JsonFormat(pattern="yyyy-MM-dd  HH:mm:ss" ,  timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @TableField("entryTime")
    private Date entryTime;


    private int userid;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public Integer getPlanNumberTables() {
        return planNumberTables;
    }

    public void setPlanNumberTables(Integer planNumberTables) {
        this.planNumberTables = planNumberTables;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    @Override
    public String toString() {
        return "ForecastData{" +
        "id=" + id +
        ", planName=" + planName +
        ", planNumberTables=" + planNumberTables +
        ", startTime=" + startTime +
        ", endTime=" + endTime +
        ", status=" + status +
        ", entryTime=" + entryTime +
        "}";
    }
}
