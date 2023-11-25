package com.example.demo.model.itinerary;

import com.fasterxml.jackson.annotation.*;

@lombok.Data
public class Route {
    @lombok.Getter
    @lombok.Setter
    private double latitude;
    @lombok.Getter
    @lombok.Setter
    private double longitude;
}
