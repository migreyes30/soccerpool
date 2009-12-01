class ClosePoolController < ApplicationController
  
  def close		
  		
 		@NO_OPENED_POOL = 0  	
  	pool_array = Pool.all(:conditions => "status = 'opened'")
  	
  	if pool_array.size == @NO_OPENED_POOL
  	
  		@NO_CLOSED_POOL = 0
  		close_pool = Pool.all(:conditions => "status = 'closed'")
  		
  		if close_pool.size == @NO_CLOSED_POOL
 		 		@unclose_pool = %Q{
 		 			You can't close the current pool!<br /><br />
  				All the pools are concluded!<br /><br />
					You can open a pool in the \"Open a Pool\" section.
  			}
  		else
 		 		@unclose_pool = %Q{
  				The current pool: #{close_pool[0].name} is closed!<br /><br />
  				#{close_pool[0].name} status: #{close_pool[0].status}<br /><br />
					Please, conclude it to calculate the results!
  			}
  		end

  	else
  		#codigo cuando se cierra
  	end
  	
  end

end
