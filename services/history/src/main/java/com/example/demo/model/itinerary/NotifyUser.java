package com.example.demo.model.itinerary;

import com.fasterxml.jackson.annotation.*;
import java.util.UUID;

@lombok.Data
public class NotifyUser {
    @lombok.Getter
    @lombok.Setter
    private UUID guid;
    @lombok.Getter
    @lombok.Setter
    private String user;
}
