package com.example.service;



import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Forecast {
    public String getRain() {
        return rain;
    }

    public String getUrl() {
        return url;
    }

    String url;
    String rain ;
    String temperatur="no value";
    String time="noValue";
    String startTime ;


    public String getTime(){
        return time;
    }
    public String getTemperatur(){
        return temperatur;
    }

    public Forecast(){}
    public Forecast(String longitude,String latitude) throws IOException, JSONException, ParseException {
        url = "https://api.met.no/weatherapi/locationforecast/1.9/?lat="+latitude+"&lon="+longitude;
        URLConnection connection = new URL(url).openConnection();
        connection.connect();
        BufferedReader buffer = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line;
        StringBuffer sb = new StringBuffer();

        while ((line=buffer.readLine())!=null) {
            sb.append(line);
        }

        //SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


        JSONObject forecast = XML.toJSONObject(sb.toString());
        forecast=(JSONObject)forecast.get("weatherdata");
        forecast=(JSONObject)forecast.get("product");
        JSONArray array = forecast.getJSONArray("time");
        forecast = array.getJSONObject(0);

        time=forecast.getString("from");
        forecast=(JSONObject)forecast.get("location");
        forecast=(JSONObject)forecast.get("temperature");
        temperatur=forecast.getString("value");



    }
    public void setLocation(String longitude,String latitude) throws IOException, JSONException {
        url = "https://api.met.no/weatherapi/locationforecast/1.9/?lat="+latitude+"&lon="+longitude;
        URLConnection connection = new URL(url).openConnection();
        connection.connect();
        BufferedReader buffer = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line;
        StringBuffer sb = new StringBuffer();

        while ((line=buffer.readLine())!=null) {
            sb.append(line);
        }


        //SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        //SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


        JSONObject forecast = XML.toJSONObject(sb.toString());
        JSONObject forecastRain = new JSONObject();
        forecast=(JSONObject)forecast.get("weatherdata");
        forecast=(JSONObject)forecast.get("product");
        JSONArray array = forecast.getJSONArray("time");
        forecast = array.getJSONObject(0);


        String tempStartTime,tempEndTime;
        JSONObject tempForecast;
        startTime = forecast.get("from").toString();

        for(int i =0;i<array.length();i++){



            tempForecast = array.getJSONObject(i);
            tempStartTime = tempForecast.get("from").toString();
            tempEndTime = tempForecast.get("to").toString();

            

        }


        rain = forecastRain.get("value").toString();
//        temperatur = forecast.get("value").toString();
        time = startTime;
    }

}
