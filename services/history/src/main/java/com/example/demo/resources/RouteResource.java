package com.example.demo.resources;

import com.example.demo.model.itinerary.ItineraryResponse;
import com.example.demo.util.ItineraryConverter;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.FileInputStream;
import java.io.IOException;

@RestController
@RequestMapping("/route")
public class RouteResource {

    @GetMapping(value = "/{user}/{routeId}")
    public ItineraryResponse getRouteById(@PathVariable("user") String user, @PathVariable("routeId") String routeId) throws IOException {

        FileInputStream fis = new FileInputStream("src/main/resources/itinerary.json");
        String jsonString  = IOUtils.toString(fis, "UTF-8");



        System.out.println(jsonString);

        return ItineraryConverter.fromJsonString(jsonString);
    }

}
