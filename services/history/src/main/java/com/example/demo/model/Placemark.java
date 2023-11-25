package com.example.demo.model;

import com.fasterxml.jackson.annotation.*;

public class Placemark {
    private String name;
    private String student;
    private Route[] coordinates;

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("student")
    public String getStudent() { return student; }
    @JsonProperty("student")
    public void setStudent(String value) { this.student = value; }

    @JsonProperty("coordinates")
    public Route[] getCoordinates() { return coordinates; }
    @JsonProperty("coordinates")
    public void setCoordinates(Route[] value) { this.coordinates = value; }
}