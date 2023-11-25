package com.example.demo.model.organization;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@lombok.Data
@Document(collection = "organizations")
public class Organization {
    @lombok.Getter
    @lombok.Setter
    @Id
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
