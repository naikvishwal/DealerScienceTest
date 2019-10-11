require "watir"
require_relative "../../Pages/PageController"

# INIT Browser
$browser = Watir::Browser.new :chrome
$browser.window.resize_to(1920, 1080)
