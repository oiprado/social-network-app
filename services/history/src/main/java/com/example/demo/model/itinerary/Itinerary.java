package com.example.demo.model.itinerary;

import java.util.List;
import java.util.UUID;

@lombok.Data
public class Itinerary {
    @lombok.Getter
    @lombok.Setter
    private UUID guid;
    @lombok.Getter
    @lombok.Setter
    private String name;
    @lombok.Getter
    @lombok.Setter
    private String description;
    @lombok.Getter
    @lombok.Setter
    private List<Route> route;
    @lombok.Getter
    @lombok.Setter
    private List<Placemark> placemark;
}
