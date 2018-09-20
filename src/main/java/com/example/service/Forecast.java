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


    public String getUrl() {
        return url;
    }

    String url;
    String iconIdToday,iconIdTommorow;
    String temperaturToday,temperaturTommorow;
    String time;
    String startDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance());


    public String getTime(){
        return time;
    }


    public Forecast(){}
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
        setDataToday(array.getJSONObject(0));




        for(int i =0;i<array.length();i++){

            if(!array.getJSONObject(i).get("from").toString().contains(startDate)){
                setDataTomorrow(array.getJSONObject(i));
            }



        }




    }

    private void setDataTomorrow(JSONObject forecast){

    }
    private  void setDataToday(JSONObject forecast){

    }

}
