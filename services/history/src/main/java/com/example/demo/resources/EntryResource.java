package com.example.demo.resources;

import com.example.demo.data.EntryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("entry")
public class EntryResource {
    @Autowired
    private EntryRepository entryRepository;

    @GetMapping
    ResponseEntity getAll(Pageable pageable) throws InterruptedException {
        Thread.sleep(3000);
        return ResponseEntity.ok(entryRepository.findAll(pageable));
    }

    @GetMapping
    @RequestMapping("search")
    ResponseEntity fullTextSearch(@RequestParam("text") String text, Pageable pageable) throws InterruptedException {
        Thread.sleep(3000);
        return ResponseEntity.ok(entryRepository.findByTitleContaining(text, pageable));
    }

}
