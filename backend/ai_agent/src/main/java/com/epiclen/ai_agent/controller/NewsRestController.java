package com.epiclen.ai_agent.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.epiclen.ai_agent.entity.News;
import com.epiclen.ai_agent.mapper.NewsMapper;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/news")
public class NewsRestController {

    private final NewsMapper newsMapper;

    public NewsRestController(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }

    @GetMapping("{id}")
    public News getNews(@PathVariable("id") Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

    @GetMapping("")
    public List<News> getAllNews(@RequestParam Integer start, @RequestParam Integer end) {
        return newsMapper.selectAll(start, end);
    }

    @PostMapping("")
    public int createNews(@RequestBody News news) {
        return newsMapper.insert(news);
    }

    @PutMapping("{id}")
    public int putMethodName(@PathVariable Integer id, @RequestBody News news) {
        return newsMapper.updateByPrimaryKey(news);
    }

    @DeleteMapping("{id}")
    public int deleteNews(@PathVariable Integer id) {
        return newsMapper.deleteByPrimaryKey(id);
    }

}
