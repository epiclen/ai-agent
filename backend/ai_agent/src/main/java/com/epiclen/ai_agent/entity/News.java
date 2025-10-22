
package com.epiclen.ai_agent.entity;

import lombok.Data;
import java.util.Date;

/**
 * News entity
 */
@Data
public class News {
    /**
     * news_id
     * @Primary Key
     */
    private Integer newsId;

    /**
     * title
     */
    private String title;

    /**
     * content
     */
    private String content;

    /**
     * author
     */
    private String author;

    /**
     * category
     */
    private String category;

    /**
     * publish_date
     */
    private Date publishDate;

    /**
     * last_update
     */
    private Date lastUpdate;

    /**
     * status
     */
    private String status;

    /**
     * views
     */
    private Integer views;

    /**
     * image_url
     */
    private String imageUrl;

}
