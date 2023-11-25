package com.example.demo.data;

import com.example.demo.model.entry.Entry;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface EntryRepository extends PagingAndSortingRepository<Entry, String> {
//    @Query("select e from Entry e where e.title like %:text")
    Page<Entry> findByTitleContaining(String text, Pageable pageable);

    @Query(value = "{ creator.name: ?0  }", fields = "{ creator.name: ?0}")
    Page<Entry> fullTextSearch(@Param("text") String text, Pageable pageable);
}
