class OpenPoolController < ApplicationController
  
  def input
  
  	@NO_OPENED_POOL = 0
  	pool_array = Pool.all(:conditions => "status = 'opened' or status = 'closed'")
  	
  	if !(pool_array.size == @NO_OPENED_POOL)
  		@already_opened_pool = %Q{
  			The current pool: #{pool_array[0].name} isn't concluded!<br /><br />
  			#{pool_array[0].name} status: #{pool_array[0].status}<br /><br />
				Please, conclude it to open another.
  		}
  	end
  	
  end
  
  def draw
    @number = params[:number].to_i
  end

  def save
    @pool_name = params[:pool_name]
    @parametros = params
    
    pool = Pool.create(:name=> @pool_name, :status=> 'opened')
    
    @parametros.each_key do |key| 
        if  key.include?("local") 
          local = @parametros[key] 
          visitor = @parametros["visitor#{key[5..key.size-1]}"] 
          match = Match.create(:pool_id => pool.id, :local => local, :visitor => visitor )
        end
    end
  end
  
end
