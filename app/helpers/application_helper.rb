module ApplicationHelper
	include PostsHelper

	def full_title(title)
		base_title = 'Simple blog application'

		if title.empty?
			base_title
		else
			"#{base_title} | #{title}"
		end
	end
end
