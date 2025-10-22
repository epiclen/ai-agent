package com.epiclen.ai_agent.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.epiclen.ai_agent.entity.City;
import com.epiclen.ai_agent.mapper.CityMapper;

@RequestMapping("/cities")
@RestController
public class CityRestController {

    private final CityMapper cityMapper;

    public CityRestController(CityMapper cityMapper) {
        this.cityMapper = cityMapper;
    }

    @GetMapping("{state}")
    List<City> getCity(@PathVariable("state") String state) {
        return cityMapper.selectAll();
    }

}