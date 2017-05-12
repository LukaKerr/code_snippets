module ApplicationHelper
	class HTMLwithPygments < Redcarpet::Render::HTML
		def block_code(code, language)
			Pygments.highlight(code, lexer: language)
		end
	end

	def markdown(text)
		renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true,
		}
		Redcarpet::Markdown.new(renderer, options).render(text).html_safe
	end

	def random_image
	  images = ["/assets/pictures/1.png", "/assets/pictures/2.png", "/assets/pictures/3.png", "/assets/pictures/4.png", "/assets/pictures/5.png", 
	  	"/assets/pictures/6.png", "/assets/pictures/7.png", "/assets/pictures/8.png", "/assets/pictures/9.png"]
	  images[rand(images.size)]
	end
end
