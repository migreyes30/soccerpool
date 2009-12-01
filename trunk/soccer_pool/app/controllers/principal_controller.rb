class PrincipalController < ApplicationController
  
 	INDEX_FOR_OPENED_POOL = 0
 	
  def main_layout
  	
  	@NO_OPENED_POOL = 0
  	pool_array = Pool.all(:conditions => "status = 'opened'")
  	
  	if !(pool_array.size == @NO_OPENED_POOL)
  		@pool_name = pool_array[INDEX_FOR_OPENED_POOL].name
  		@matches = pool_array[INDEX_FOR_OPENED_POOL].matches
  	else
  		@pool_name = %Q{
  			There isn't a opened pool in this moment!<br /><br />
  			Please, take look to the results
  		}
  		@matches = []
  	end

  end

end
