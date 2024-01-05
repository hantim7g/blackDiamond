package com.marketing.hst;

import jakarta.persistence.*;

@Entity
@Table(name = "pdt_prop_val_table") 
public class PairDataDto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Assuming you want to have an ID for each PairDataDto

    @Column(name = "property")
    private String property;

    @Column(name = "value")
    private String value;

    // Constructors

    public PairDataDto() {
    }

    public PairDataDto(String property, String value) {
        this.property = property;
        this.value = value;
    }

    // Getters, setters, and other methods

    @Override
    public String toString() {
        return property + "  " + value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
