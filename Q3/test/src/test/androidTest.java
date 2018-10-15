package test;

import org.openqa.selenium.remote.DesiredCapabilities;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.MobileElement;
import io.appium.java_client.android.AndroidDriver;

import java.net.URL;


public class androidTest {
	private static AppiumDriver driver;
	
	public static void main(String[] args) throws Exception{
		DesiredCapabilities capabilities = new DesiredCapabilities();
		capabilities.setCapability("deviceName", "Nexus5-1");
		capabilities.setCapability("platformVersion", "6.0");
		capabilities.setCapability("platformName", "Android");
		capabilities.setCapability("app", "/Users/visalakshi/Downloads/209.apk");
		capabilities.setCapability("noRest", "True");
		driver = new AndroidDriver (new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
		
		MobileElement el1 = (MobileElement) driver.findElementById("tv.hooq.android:id/accountLogin");
		el1.click();
		MobileElement el2 = (MobileElement) driver.findElementById("tv.hooq.android:id/emailInput");
		el2.click();
		el2.sendKeys("test@test.com");
		MobileElement el3 = (MobileElement) driver.findElementById("tv.hooq.android:id/emailDone");
		el3.click();
		MobileElement el4 = (MobileElement) driver.findElementById("tv.hooq.android:id/btnUp");
		el4.click();
		MobileElement el5 = (MobileElement) driver.findElementById("tv.hooq.android:id/accountLogin");
		el5.click();
		MobileElement el6 = (MobileElement) driver.findElementById("tv.hooq.android:id/emailInput");
		el6.click();
		el6.sendKeys("random");
		MobileElement el7 = (MobileElement) driver.findElementById("tv.hooq.android:id/emailDone");
		el7.click();
		
		driver.quit();
	}

}
