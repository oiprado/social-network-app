package com.example.demo.model.entry;

import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;
import java.util.List;

@lombok.Data
@ToString
@Document(collection = "entries")
public class Entry {
    @lombok.Getter
    @lombok.Setter
    @Id
    private String id;
    @lombok.Getter
    @lombok.Setter
    private String thumbnailUrl;
    @lombok.Getter
    @lombok.Setter
    private String title;
    @lombok.Getter
    @lombok.Setter
    private String text;
    @lombok.Getter
    @lombok.Setter
    private List<String> keywords;
    @lombok.Getter
    @lombok.Setter
    private Creator creator;
    @lombok.Getter
    @lombok.Setter
    private long commentCount;
    @lombok.Getter
    @lombok.Setter
    private List<Object> comment;
    @lombok.Getter
    @lombok.Setter
    private Date dateCreated;
    @lombok.Getter
    @lombok.Setter
    private Date dateModified;
    @lombok.Getter
    @lombok.Setter
    private Date datePublished;

}
