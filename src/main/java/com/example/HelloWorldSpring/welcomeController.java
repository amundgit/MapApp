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
            String locationName=geocoding.getName();
            Weather today = forecast.getToday();
            Weather tomorrow = forecast.getTomorrow();
            String date = forecast.getStartDate().toString();
            String url = forecast.getUrl();
            model.addAttribute("date",date);
            model.addAttribute("temp1",today.getTemperature());
            model.addAttribute("temp2",tomorrow.getTemperature());
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
