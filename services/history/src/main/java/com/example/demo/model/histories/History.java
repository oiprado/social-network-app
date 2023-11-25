package com.example.demo.model.histories;

import com.fasterxml.jackson.annotation.*;

@lombok.Data
public class History {
    @lombok.Getter
    @lombok.Setter
    private String url;
}
