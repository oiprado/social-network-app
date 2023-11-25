package com.example.demo.model.itinerary;

import com.fasterxml.jackson.annotation.*;
import java.util.List;
import java.util.UUID;

@lombok.Data
public class Placemark {
    @lombok.Getter
    @lombok.Setter
    private UUID guid;
    @lombok.Getter
    @lombok.Setter
    private String name;
    @lombok.Getter
    @lombok.Setter
    private String user;
    @lombok.Getter
    @lombok.Setter
    private List<Route> mark;
    @lombok.Getter
    @lombok.Setter
    private List<NotifyUser> notifyUser;
}
