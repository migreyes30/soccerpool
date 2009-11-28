class OpenPoolController < ApplicationController
  
  def input
  end
  
  def draw
    @number = params[:number].to_i
    create_matches
  end
  
  def create_matches
    @matches_array = Array.new(@number)
    @matches_array.each_index do |i| 
       @matches_array[i]= Match.new()
    end
  end

  def save
     @number = params[:number].to_i
    create_matches
  end
  end
end
