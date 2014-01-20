module ApplicationHelper

	def full_title(page_title)
		base_title = "Consumer App"
		if page_title.empty?
			base_title
		else
			base_title + " | " + page_title
		end
	end

	 def is_active?(link_path)
	  if current_page?(link_path)
	    "active"
	  else
	    ""
	  end
	 end

end
