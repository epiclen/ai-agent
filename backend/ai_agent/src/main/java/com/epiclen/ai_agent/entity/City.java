
package com.epiclen.ai_agent.entity;

import lombok.Data;

/**
 * City entity
 */
@Data
public class City {
    /**
     * id
     * @Primary Key
     */
    private Integer id;

    /**
     * name
     */
    private String name;

    /**
     * state
     */
    private String state;

    /**
     * country
     */
    private String country;

}
