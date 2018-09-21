package com.example.HelloWorldSpring;

import com.example.service.Forecast;
import com.example.service.Geocoding;
import com.example.service.Weather;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping(value = "/")
public class welcomeController {

    Geocoding geocoding = new Geocoding();

    Forecast forecast = new Forecast();


    @RequestMapping(value = "/",method=RequestMethod.GET)
    public String welcome(Model model) throws IOException {
        List<String> longList = new ArrayList<>();
        List<String> latList = new ArrayList<>();
        List<String> iconList = new ArrayList<>();
        String [] cities = {"Oslo","Bergen","Trondheim","Stavanger","Tromsø"};
        for(int i=0;i<cities.length;i++){
            geocoding.setLocation(cities[i]);
            forecast.setLocation(geocoding.getLongitude(),geocoding.getLattitude());
            longList.add(geocoding.getLongitude());
            latList.add(geocoding.getLattitude());
            iconList.add(forecast.getToday().getIconId());

        }
        model.addAttribute("longitude",longList);
        model.addAttribute("latitude",latList);
        model.addAttribute("iconId",iconList);

        return "welcome";
    }
    @RequestMapping(value = "/",method= RequestMethod.POST)
    public String welcomeNew(@ModelAttribute("city")String city,Model model){

        try {

            geocoding.setLocation(city);
            forecast.setLocation(geocoding.getLongitude(),geocoding.getLattitude());
            String locationName=geocoding.getName();
            String lon = geocoding.getLongitude();
            String lat = geocoding.getLattitude();
            Weather today = forecast.getToday();
            Weather tomorrow = forecast.getTomorrow();
            String date = forecast.getStartDate().toString();
            String url = forecast.getUrl();
            model.addAttribute("date",date);
            model.addAttribute("temp1",today.getTemperature());
            model.addAttribute("temp2",tomorrow.getTemperature());
            model.addAttribute("symbolId1",today.getIconId());
            model.addAttribute("symbolId2",tomorrow.getIconId());
            model.addAttribute("lon",lon);
            model.addAttribute("lat",lat);
            model.addAttribute("locationName",locationName);
            model.addAttribute("url",url);


        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "welcome";
    }
}
