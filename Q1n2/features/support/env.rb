require 'watir'
require 'page-object'
require "page-object/page_factory"
World(PageObject::PageFactory)
require 'cucumber'
require 'rubygems'
require 'headless'
require 'yaml'
require './features/pages/Site.rb'

chromedriver_path = './chromedriver'
Selenium::WebDriver::Chrome.driver_path = chromedriver_path

def browser_name
    (ENV['BROWSER'] ||= 'chrome').downcase.to_sym
end

browser = Watir::Browser.new browser_name
$site = Site.new(browser)
$project_file_path= Dir.pwd
$config = YAML.load_file($project_file_path+"/features/support/config.yml")

def assert_it (message, &block)
    begin
        if (block.call)
            puts "Assertion PASSED for #{message}"
        else
            puts "Assertion FAILED for #{message}"
            fail('Test Failure on assertion')
        end
    rescue => e
        puts "Assertion FAILED for #{message} with exception '#{e}'"
        fail('Test Failure on assertion')
    end
end

Before do
    @browser = browser
end

Before do |_scenario|
    @browser.cookies.clear
end

After do |_scenario|
  if _scenario.failed?
        Dir::mkdir('screenshots') if not File.directory?('screenshots')
        screenshot = "./screenshots/FAILED_#{_scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
        browser.screenshot.save screenshot
        embed screenshot, 'image/png'

        browser.close

        #clear the @site variable after each scenario
        $site = nil
  end
end

# Close the browser after all scenarios completed
at_exit do
    browser.close
    $site = nil
end






