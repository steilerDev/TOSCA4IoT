package de.tosca4iot.smarthome.Weather_Sensor;

import java.io.IOException;
import de.tosca4iot.smarthome.Weather_Sensor.ConfigLoader.ConfigReader;
import de.tosca4iot.smarthome.Weather_Sensor.Dashboard.GUI;
import de.tosca4iot.smarthome.Weather_Sensor.Subscriber.DataSubscriber;

public class Start{
	public static DataSubscriber theSubscriber;
	
	
	public static void main(String[] args) {
		GUI theDashboard = new GUI();
		theDashboard.setVisible(true);
		ConfigReader configReader = new ConfigReader("config.properties");
		try {
			theSubscriber = new DataSubscriber(theDashboard, configReader.getPropValues("basestation_ip"),
					configReader.getPropValues("message_broker_port"), configReader.getPropValues("topic"));
		} catch (IOException e) {
			e.printStackTrace();
			theSubscriber = new DataSubscriber(theDashboard, "localhost",
					"1883", "localhost/weather/#");
		}
		Thread t = new Thread(theSubscriber);
		t.start();
	}
}
