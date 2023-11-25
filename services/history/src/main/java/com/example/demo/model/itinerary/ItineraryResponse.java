package com.example.demo.model.itinerary;

import java.util.List;

@lombok.Data
public class ItineraryResponse {
    @lombok.Getter
    @lombok.Setter
    private List<Itinerary> itineraries;
}
