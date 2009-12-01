class ConcludePoolController < ApplicationController

  def winners
    pool_arr= Pool.find(:all, :conditions => "status = 'closed'") 
    @pool_name = pool_arr[0].name
    @pool_matches_arr = pool_arr[0].matches
  end

  def save
    @parametros = params
    @table_matches = Array.new
    @parametros.each_key do |key| 
        if  key.include?("result") 
          result = @parametros[key] 
          id = key[6..key.size-1].to_i 
          match = Match.find(:all, :conditions => "id = #{id}") [0]
          match.result = result
          match.save
          @pool_id = match.pool_id
          @table_matches << match
        end
    end
    pool = Pool.find(:all, :conditions => "id = #{@pool_id}")
    pool[0].status = 'concluded'
    pool[0].save
    generate_results(@pool_id)
  end
  
  def generate_results()
  
  end
end
