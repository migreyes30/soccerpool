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
    generate_results(@pool_id, @table_matches)
  end
  
  def generate_results(pool_id,table_matches)
    users_arr = User.all
    table_matches.each do |match|
        match_id = match.id
        users_arr.each do |user|
            user_id = user.id
            picks = Pick.find(:all, :conditions => ["user_id = ? and match_id = ? " , user_id, match_id]) 
            if (picks.size > 0 )
                if (match.result == picks[0].pick)
                  score = 1 
                  result = Result.create(:user_id =>user_id, :pool_id =>pool_id, :match_id =>match_id, :score => score)
                end
            end
        end
    end
  end


end  

