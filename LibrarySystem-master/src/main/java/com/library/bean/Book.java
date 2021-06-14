package com.library.bean;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class Book implements Serializable {

    private long book_id;
    private String name;
    private String author;
    private String publish;
    private String ISBN;
    private String introduction;
    private String language;
    private BigDecimal price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pub_date;
    private Integer class_id;
    private Integer number;

//    public long getBookId() {
//        return book_id;
//    }
//
//    public void setBookId(long book_id) {
//        this.book_id = book_id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getAuthor() {
//        return author;
//    }
//
//    public void setAuthor(String author) {
//        this.author = author;
//    }
//
//    public String getPublish() {
//        return publish;
//    }
//
//    public void setPublish(String publish) {
//        this.publish = publish;
//    }
//
//    public String getIsbn() {
//        return ISBN;
//    }
//
//    public void setIsbn(String isbn) {
//        this.ISBN = isbn;
//    }
//
//    public String getIntroduction() {
//        return introduction;
//    }
//
//    public void setIntroduction(String introduction) {
//        this.introduction = introduction;
//    }
//
//    public String getLanguage() {
//        return language;
//    }
//
//    public void setLanguage(String language) {
//        this.language = language;
//    }
//
//    public BigDecimal getPrice() {
//        return price;
//    }
//
//    public void setPrice(BigDecimal price) {
//        this.price = price;
//    }
//
//    public Date getPubdate() {
//        return pub_date;
//    }
//
//    public void setPubdate(Date pub_date) {
//        this.pub_date = pub_date;
//    }
//
//    public int getClassId() {
//        return class_id;
//    }
//
//    public void setClassId(int class_id) {
//        this.class_id = class_id;
//    }
//
//    public int getNumber() {
//        return number;
//    }
//
//    public void setNumber(int number) {
//        this.number = number;
//    }
}
