namespace :temperature do
  desc "TODO"
  task fake_it: :environment do
  	random = Random.new

  	print "Creating mock temperatures "

  	(0..20).each do |i|
  		Temperature.create(fahrenheit: random.rand(80..105))
  		print "."
  		sleep(1.0/2.0)
  	end
  end
end
