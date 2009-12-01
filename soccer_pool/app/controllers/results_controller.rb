class ResultsController < ApplicationController
	
 def show_results
  
  #Query para sacar columna de user
  soccer_users = User.all(:select => "id,login,score",:conditions => "login <> 'admin'",:order =>"score desc")
  
	#Queries para sacar columnas de pools
	@pool_concluded = Pool.all(:select => "id,name",:conditions => "status = 'concluded'")
	
	@ren_user = Array.new
	
	soccer_users.each do |user|
		col_pool = Array.new
		sum = 0
		col_pool << user.login
		@pool_concluded.each do |pool|
			temp = Result.all(:conditions => ["user_id = :user_id and pool_id = :pool_id",{:user_id => user.id,:pool_id => pool.id}]).size
			col_pool << temp
			sum += temp
		end
		col_pool << sum
		@ren_user << col_pool
	end

 end

end
