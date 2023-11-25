package com.example.demo.model.entry;

@lombok.Data
public class Creator {
    @lombok.Getter
    @lombok.Setter
    private String id;
    @lombok.Getter
    @lombok.Setter
    private String name;
    @lombok.Getter
    @lombok.Setter
    private String image;
    @lombok.Getter
    @lombok.Setter
    private String about;
    @lombok.Getter
    @lombok.Setter
    private Location location;
}
