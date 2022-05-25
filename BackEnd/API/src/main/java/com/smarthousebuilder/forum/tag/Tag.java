package com.smarthousebuilder.forum.tag;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tag")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Tag {
    @Id
    @Column(name = "id_post")
    protected int id;
    @Column(name = "review")
    @JsonProperty("rewiewFlag")
    protected int reviewFlag;
    @Column(name = "question")
    @JsonProperty("questionFlag")
    protected int questionFlag;
    @Column(name = "setup")
    @JsonProperty("setupFlag")
    protected int setupFlag;
    @Column(name = "hardware")
    @JsonProperty("hardwareFlag")
    protected int hardwareFlag;
    @Column(name = "software")
    @JsonProperty("softwareFlag")
    protected int softwareFlag;

    public Tag(int id, int reviewFlag, int questionFlag, int setupFlag, int hardwareFlag, int softwareFlag) {
        this.id = id;
        this.reviewFlag = reviewFlag;
        this.questionFlag = questionFlag;
        this.setupFlag = setupFlag;
        this.hardwareFlag = hardwareFlag;
        this.softwareFlag = softwareFlag;
    }
    public Tag(){}

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
                ", reviewFlag=" + reviewFlag +
                ", questionFlag=" + questionFlag +
                ", setupFlag=" + setupFlag +
                ", hardwareFlag=" + hardwareFlag +
                ", softwareFlag=" + softwareFlag +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRewiewFlag() {
        return reviewFlag;
    }

    public void setRewiewFlag(int rewiewFlag) {
        this.reviewFlag = rewiewFlag;
    }

    public int getQuestionFlag() {
        return questionFlag;
    }

    public void setQuestionFlag(int questionFlag) {
        this.questionFlag = questionFlag;
    }

    public int getSetupFlag() {
        return setupFlag;
    }

    public void setSetupFlag(int setupFlag) {
        this.setupFlag = setupFlag;
    }

    public int getHardwareFlag() {
        return hardwareFlag;
    }

    public void setHardwareFlag(int hardwareFlag) {
        this.hardwareFlag = hardwareFlag;
    }

    public int getSoftwareFlag() {
        return softwareFlag;
    }

    public void setSoftwareFlag(int softwareFlag) {
        this.softwareFlag = softwareFlag;
    }
}
