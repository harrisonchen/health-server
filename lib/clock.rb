require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(1.day, 'Aggregating daily temperatures', :at => '00:00') { Temperature.aggregate_daily_temperatures }
every(7.day, 'Aggregating weekly temperatures', :at => '00:00') { Temperature.aggregate_weekly_temperatures }
