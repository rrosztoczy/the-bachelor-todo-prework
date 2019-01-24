def get_first_name_of_season_winner(data, season)
  #iterate through data hash to find the season we want
  first_name = []
  data.each do |season_number, contestant_data_array|
    if season == season_number
      #iterate through season data to find the winner
      contestant_data_array.each do |contestant_data|
          contestant_data.each do |data_key, data_value|
            #collect, format and return winner name
            if data_value == "Winner"
              name = contestant_data["name"].split(" ")
              first_name = name.shift
              return first_name
            end
          end
      end
    end
  end
end

def get_contestant_name(data, occupation)
  # code here
  contestant_name = ""
  data.each do |season_number, contestant_data_array|
    contestant_data_array.each do |contestant_data|
      contestant_data.each do |data_key, data_value|
        if data_value == occupation
          contestant_name = contestant_data["name"]
          return contestant_name
        end
      end
    end
  end      
end

def count_contestants_by_hometown(data, hometown)
  contestants_in_hometown = 0
  data.each do |season_number, contestant_data_array|
    contestant_data_array.each do |contestant_data|
      contestant_data.each do |data_key, data_value|
        if data_value == hometown
          contestants_in_hometown += 1
        end
      end
    end
  end      
  return contestants_in_hometown
end

def get_occupation(data, hometown)
  # code here
  occupation = ""
  data.each do |season_number, contestant_data_array|
    contestant_data_array.each do |contestant_data|
      contestant_data.each do |data_key, data_value|
        if data_value == hometown
          occupation = contestant_data["occupation"]
          return occupation
        end
      end
    end
  end      
end

def get_average_age_for_season(data, season)
  # code here
  contestant_ages = []
  average_age = 0
  #collect age strings in an array
  data.each do |season_number, contestant_data_array|
    if season == season_number
    contestant_data_array.each do |contestant_data|
      contestant_data.each do |data_key, data_value|
        if data_key == "age"
          contestant_ages.push(data_value)
        end
      end
    end
    end
  end
  #turn array elements into floats
  formatted_ages = contestant_ages.collect do |age|
    age = age.to_f
  end

  #average floats and return answer
  formatted_ages.each do |age|
    average_age += age
  end

  average_age = average_age / formatted_ages.length
  return average_age.round
end
