module UsersHelper
	def link_url(text)
    	text.gsub(/\A(http(s)?:\/\/)?(www\.)?(.*)/,"http\\2://\\4")
	end
end
