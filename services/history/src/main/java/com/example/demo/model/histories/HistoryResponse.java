package com.example.demo.model.histories;

import com.fasterxml.jackson.annotation.*;
import java.util.List;

@lombok.Data
public class HistoryResponse {
    @lombok.Getter
    @lombok.Setter
    private List<History> data;
}
