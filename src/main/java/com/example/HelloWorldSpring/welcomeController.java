package com.example.HelloWorldSpring;

import com.example.service.Forecast;
import com.example.service.Geocoding;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
@RequestMapping(value = "/")
public class welcomeController {

    Geocoding geocoding = new Geocoding();
    Forecast forecast = new Forecast();


    @RequestMapping(value = "/",method=RequestMethod.GET)
    public String welcome(Model model){
        model.addAttribute("welcomeMsg","Heissan");

        return "welcome";
    }
    @RequestMapping(value = "/",method= RequestMethod.POST)
    public String welcomeNew(@ModelAttribute("city")String city,Model model){

        try {
            String welcome = "Welcome page";
            model.addAttribute("welcome",welcome);
            geocoding.setLocation(city);
            forecast.setLocation(geocoding.getLongitude(),geocoding.getLattitude());
            String time = forecast.getTime();
            String rain = forecast.getRain();
            String temp = forecast.getTemperatur();
            String geo = forecast.getUrl();
            model.addAttribute("time",time);
            model.addAttribute("temperature",temp);
            model.addAttribute("locationName",geo);
            model.addAttribute("rain",rain);

        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "welcome";
    }
}
