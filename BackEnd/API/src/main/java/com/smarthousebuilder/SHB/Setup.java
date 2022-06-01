package com.smarthousebuilder.SHB;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;

@Entity
public class Setup {
    @GeneratedValue
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "user_id")
    private Integer userId;
    @Basic
    @Column(name = "components")
    private String components;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getComponents() {
        return components;
    }

    public void setComponents(String components) {
        this.components = components;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Setup setup = (Setup) o;

        if (id != setup.id) return false;
        if (name != null ? !name.equals(setup.name) : setup.name != null) return false;
        if (userId != null ? !userId.equals(setup.userId) : setup.userId != null) return false;
        if (components != null ? !components.equals(setup.components) : setup.components != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (components != null ? components.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Setup{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", userId=" + userId +
                ", components='" + components + '\'' +
                '}';
    }
}
