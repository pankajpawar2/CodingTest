# A Ruby gem to get API data
require 'httparty'

# API call to get data
festival_data = HTTParty.get('http://eacodingtest.digital.energyaustralia.com.au/api/v1/festivals')
recordlabel = []

begin
festival_data.each do |data|
  band_data = data["bands"]
  band_data.each do |bdata|
    recordlabel << bdata["recordLabel"]
  end
end
rescue 
  puts "Something went wrong. Please try again."
end

# Storing unique Record Labels in the array and sorting the array alphabetically
recordlabel = recordlabel.compact.reject(&:empty?).uniq.sort

recordlabel.each do |label|
  band = []
  puts "####################################################"
  puts label 
  
    festival_data.each do |data|
      data["bands"].each do |dband|
        if dband["recordLabel"] == label
          band << dband["name"]
        end
      end
    end

    band = band.sort
    band.each do |dband|
      festival = []
      puts "    #{dband}"
      festival_data.each do |fdata|
        fdata["bands"].each do |band|
          if band["name"] == dband
            festival << fdata["name"]
          end
        end
      end

    festival = festival.sort
    festival.each do |fdata|
      puts "        #{fdata}"
    end
  end

end




  






