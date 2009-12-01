class PickController < ApplicationController
	
  def make_pick
    pool_arr= Pool.find(:all, :conditions => "status = 'opened'") 
    @pool_name = pool_arr[0].name
    @pool_matches_arr = pool_arr[0].matches
  end

  def save
    @parametros = params
    @table_saved_picks = Array.new
    @parametros.each_key do |key| 
        if  key.include?("result") 
          pick_result = @parametros[key] 
          match_id = key[6..key.size-1].to_i 
          user_id = User.all(:select => "id", :conditions => ["login = :login", {:login => session["type_user"].to_s}])[0].id
          pick_for_current_match = Pick.find(:all, :conditions => ["user_id = ? and match_id = ?", user_id , match_id])
          if (pick_for_current_match.size > 0 )
            pick_for_current_match[0].pick = pick_result
            pick_for_current_match[0].save
          else
            pick = Pick.create(:user_id => user_id , :match_id =>match_id , :pick =>pick_result)
          end
          match = Match.find(:all, :conditions => ["id = ?", match_id]) [0]
          temp_match = Array.new
          temp_match  << match.local
          temp_match << match.visitor
          temp_match << pick_result
          @table_saved_picks <<temp_match 
        end
    end
  end
end