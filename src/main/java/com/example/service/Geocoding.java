package com.example.service;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class Geocoding {

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLattitude() {
        return lattitude;
    }

    public void setLattitude(String lattitude) {
        this.lattitude = lattitude;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String longitude= "no value";
    private String lattitude= "no value";
    private String name = "no value";


    public Geocoding(){}
    public Geocoding(String land,String fylke,String sted) throws IOException, JSONException {
        String url = " https://nominatim.openstreetmap.org/search?q="+sted+","+fylke+","+land+"&format=json";
        URLConnection connection = new URL(url).openConnection();
        connection.connect();
        BufferedReader buffer = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line;
        StringBuffer sb = new StringBuffer();

        while ((line=buffer.readLine())!=null) {
            sb.append(line);
        }

        //System.out.println(sb.toString());

        JSONArray results = new JSONArray(sb.toString());


            JSONObject mostRelevent = (JSONObject) results.get(0);
            longitude = mostRelevent.getString("lon");
            lattitude = mostRelevent.getString("lat");
            name = mostRelevent.getString("display_name");

    }
    public void setLocation(String location) throws IOException, JSONException {
        String url = " https://nominatim.openstreetmap.org/search?q="+location+"&format=json";
        URLConnection connection = new URL(url).openConnection();
        connection.connect();
        BufferedReader buffer = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line;
        StringBuffer sb = new StringBuffer();

        while ((line=buffer.readLine())!=null) {
            sb.append(line);
        }

        //System.out.println(sb.toString());

        JSONArray results = new JSONArray(sb.toString());


        JSONObject mostRelevent = (JSONObject) results.get(0);
        longitude = mostRelevent.getString("lon");
        lattitude = mostRelevent.getString("lat");
        name = mostRelevent.getString("display_name");
    }
    public Geocoding(String land) throws IOException, JSONException {
        String url = " https://nominatim.openstreetmap.org/search?q="+land+"&format=json";
        URLConnection connection = new URL(url).openConnection();
        connection.connect();
        BufferedReader buffer = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        String line;
        StringBuffer sb = new StringBuffer();

        while ((line=buffer.readLine())!=null) {
            sb.append(line);
        }

        //System.out.println(sb.toString());

        JSONArray results = new JSONArray(sb.toString());


        JSONObject mostRelevent = (JSONObject) results.get(0);
        longitude = mostRelevent.getString("lon");
        lattitude = mostRelevent.getString("lat");
        name = mostRelevent.getString("display_name");

    }

    public void print() {
        System.out.println(name);
        System.out.println("Longitude: "+longitude);
        System.out.println("Latitude: "+lattitude);
    }

}
