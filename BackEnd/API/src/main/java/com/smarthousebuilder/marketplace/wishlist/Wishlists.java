package com.smarthousebuilder.marketplace.wishlist;


import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "wishlists")
public class Wishlists {
    @GeneratedValue
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "user_id")
    private Integer userId;
    @Basic
    @Column(name = "create_date")
    private Date createDate;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Wishlists wishlists = (Wishlists) o;

        if (id != wishlists.id) return false;
        if (userId != null ? !userId.equals(wishlists.userId) : wishlists.userId != null) return false;
        if (createDate != null ? !createDate.equals(wishlists.createDate) : wishlists.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        return result;
    }
}
