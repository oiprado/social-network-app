package com.example.demo.resources;

import com.example.demo.model.histories.HistoryResponse;
import com.example.demo.util.HistoryConverter;
import com.example.demo.util.ItineraryConverter;
import org.apache.commons.io.IOUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.IOException;

@RestController
@RequestMapping("/histories")
public class HistoryResource {
    @GetMapping
    HistoryResponse getHistories() throws IOException {
        FileInputStream fis = new FileInputStream("src/main/resources/histories.json");
        String jsonString  = IOUtils.toString(fis, "UTF-8");

        return HistoryConverter.fromJsonString(jsonString);
    }
}
