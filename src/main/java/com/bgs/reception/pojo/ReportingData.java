package com.bgs.reception.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
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
public class ReportingData implements Serializable {

private static final long serialVersionUID=1L;

    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 实际上报桌数
     */
    @TableField("actualTableCount")
    private Integer actualTableCount;

    /**
     * 新客户人数
     */
    @TableField("newCustomers")
    private Integer newCustomers;

    /**
     * 老客户人数
     */
    @TableField("oldCustomers")
    private Integer oldCustomers;

    /**
     * 意向客户人数
     */
    @TableField("intentionalCustomers")
    private Integer intentionalCustomers;

    /**
     * 保费
     */
    private Double premium;

    /**
     * 活动时间
     */
    @JsonFormat(pattern="yyyy-MM-dd  HH:mm:ss" ,  timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @TableField("activityTime")
    private Date activityTime;

    private int forecastid;

    public int getForecastid() {
        return forecastid;
    }

    public void setForecastid(int forecastid) {
        this.forecastid = forecastid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getActualTableCount() {
        return actualTableCount;
    }

    public void setActualTableCount(Integer actualTableCount) {
        this.actualTableCount = actualTableCount;
    }

    public Integer getNewCustomers() {
        return newCustomers;
    }

    public void setNewCustomers(Integer newCustomers) {
        this.newCustomers = newCustomers;
    }

    public Integer getOldCustomers() {
        return oldCustomers;
    }

    public void setOldCustomers(Integer oldCustomers) {
        this.oldCustomers = oldCustomers;
    }

    public Integer getIntentionalCustomers() {
        return intentionalCustomers;
    }

    public void setIntentionalCustomers(Integer intentionalCustomers) {
        this.intentionalCustomers = intentionalCustomers;
    }

    public Double getPremium() {
        return premium;
    }

    public void setPremium(Double premium) {
        this.premium = premium;
    }

    public Date getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(Date activityTime) {
        this.activityTime = activityTime;
    }

    @Override
    public String toString() {
        return "ReportingData{" +
        "id=" + id +
        ", actualTableCount=" + actualTableCount +
        ", newCustomers=" + newCustomers +
        ", oldCustomers=" + oldCustomers +
        ", intentionalCustomers=" + intentionalCustomers +
        ", premium=" + premium +
        ", activityTime=" + activityTime +
        "}";
    }
}
