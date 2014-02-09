class Scraper 
	def self.scrape
		data = 
			HTTParty.get(
				'http://www.brainyquote.com/quotes/authors/c/confucius.html')


		response_body =
			data.response.body 

		doc = Nokogiri::HTML(
			#insert content here
			response_body
		)


		quotes = []
		doc.css('.bqQuoteLink a').each do |link|
			quotes << link.content
		end


		quotes.sample
		# Ghetto Version
		#element = rand(quotes.count - 1)
		#quotes [element]
	end
end
