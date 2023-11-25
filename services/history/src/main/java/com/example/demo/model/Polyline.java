package com.example.demo.model;

import com.fasterxml.jackson.annotation.JsonProperty;


public class Polyline {
    private Route[] routes;
    private Placemark[] placemark;

    @JsonProperty("routes")
    public Route[] getRoutes() { return routes; }
    @JsonProperty("routes")
    public void setRoutes(Route[] value) { this.routes = value; }

    @JsonProperty("placemark")
    public Placemark[] getPlacemark() { return placemark; }
    @JsonProperty("placemark")
    public void setPlacemark(Placemark[] value) { this.placemark = value; }
}
