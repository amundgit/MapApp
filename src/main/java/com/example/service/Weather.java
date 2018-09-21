package com.example.service;

import org.springframework.stereotype.Component;


public class Weather {
    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getIconId() {
        return iconId;
    }

    public void setIconId(String iconId) {
        this.iconId = iconId;
    }

    private String temperature;
    private String iconId;

    public Weather(){}
    public  Weather(String temperature,String iconId){
        this.temperature=temperature;
        this.iconId=iconId;

    }

}
