class OpenPoolController < ApplicationController
  
  def input
  end
  
  def draw
    @number = params[:number].to_i
   # create_matches
  end
  
  def create_matches
    @matches_array = Array.new(@number)
    @matches_array.each_index do |i| 
       @matches_array[i]= Match.new()
    end
  end

  def save
    @pool_name = params[:pool_name]
    @parametros = params
    
    pool = Pool.create(:name=> @pool_name, :status=> 'open')
    
    @parametros.each_key do |key| 
        if  key.include?("local") 
          local = @parametros[key] 
          visitor = @parametros["visitor#{key[5..key.size-1]}"] 
          match = Match.create(:pool_id => pool.id, :local => local, :visitor => visitor )
        end
    end
  end

  
end
