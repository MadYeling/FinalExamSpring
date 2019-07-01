package com.yeling.beans;

public class UserBean {
    private int userid;
    private String username;
    private String truename;
    private String passwd;
    private String email;
    private String phone;
    private String address;
    private String postcode;
    private int grade;

    public UserBean() {
    }

    public UserBean(int userid, String username, String truename, String passwd,
                    String email, String phone, String address, String postcode, int grade) {
        this.userid = userid;
        this.username = username;
        this.truename = truename;
        this.passwd = passwd;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.postcode = postcode;
        this.grade = grade;
    }

    public int getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", truename='" + truename + '\'' +
                ", passwd='" + passwd + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", postcode='" + postcode + '\'' +
                ", grade=" + grade +
                '}';
    }
}
