package com.yeling.beans;

public class GoodsBean {
    private int goodsId;
    private String goodsName;
    private String goodsIntro;
    private String goodsPrice;
    private int goodsNum;
    private String publisher;
    private String photo;
    private String goodstype;

    public GoodsBean(int goodsId, String goodsName, String goodsIntro, String goodsPrice,
                     int goodsNum, String publisher, String photo, String goodstype) {
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.goodsIntro = goodsIntro;
        this.goodsPrice = goodsPrice;
        this.goodsNum = goodsNum;
        this.publisher = publisher;
        this.photo = photo;
        this.goodstype = goodstype;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsIntro() {
        return goodsIntro;
    }

    public void setGoodsIntro(String goodsIntro) {
        this.goodsIntro = goodsIntro;
    }

    public String getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(String goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public int getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(int goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getGoodstype() {
        return goodstype;
    }

    public void setGoodstype(String goodstype) {
        this.goodstype = goodstype;
    }
}
