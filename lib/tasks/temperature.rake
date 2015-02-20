namespace :temperature do
  desc "TODO"
  task fake_it: :environment do
  	random = Random.new

  	print "Creating fake temperatures "

  	(0..3000).each do |i|
  		Temperature.create(fahrenheit: random.rand(80..105))
  		print "."
  	end
  end
end
