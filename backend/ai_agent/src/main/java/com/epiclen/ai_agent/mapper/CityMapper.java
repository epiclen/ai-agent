
package com.epiclen.ai_agent.mapper;

import com.epiclen.ai_agent.entity.City;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface CityMapper {
    int insert(City record);
    int deleteByPrimaryKey(Integer id);
    int updateByPrimaryKey(City record);
    City selectByPrimaryKey(Integer id);
    List<City> selectAll();
}