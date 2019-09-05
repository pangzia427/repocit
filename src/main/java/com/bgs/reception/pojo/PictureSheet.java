package com.bgs.reception.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author MrPan
 * @since 2019-09-02
 */
public class PictureSheet implements Serializable {

private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 上传时间
     */
    @TableField("createTime")
    private LocalDateTime createTime;

    /**
     * 图片name
     */
    private String albumName;

    /**
     * 实际上报表单的ID外键
     */
    private Integer activityid;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public Integer getActivityid() {
        return activityid;
    }

    public void setActivityid(Integer activityid) {
        this.activityid = activityid;
    }

    @Override
    public String toString() {
        return "PictureSheet{" +
        "id=" + id +
        ", createTime=" + createTime +
        ", albumName=" + albumName +
        ", activityid=" + activityid +
        "}";
    }
}
