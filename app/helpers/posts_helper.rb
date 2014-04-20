module PostsHelper

	def addCategory
		
	end

	def time_ago( postTime )
		distance_of_time_in_words(Time.now, postTime)
	end
end
