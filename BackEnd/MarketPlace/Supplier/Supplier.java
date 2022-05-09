package com.example.marketplace.Supplier;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "suppliers")
public class Supplier {
    @GeneratedValue()
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "name")
    private String name;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Supplier that = (Supplier) o;

        if (id != that.id) return false;
        return Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
