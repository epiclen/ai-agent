
package com.epiclen.ai_agent.mapper;

import com.epiclen.ai_agent.entity.News;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface NewsMapper {
    int insert(News record);
    int deleteByPrimaryKey(Integer newsId);
    int updateByPrimaryKey(News record);
    News selectByPrimaryKey(Integer newsId);
    List<News> selectAll(Integer start,Integer end);
}