require 'rubygems'
require 'mechanize'

class Crawler
    
    def get_quotes(url,search_tag)

        agent = Mechanize.new
        page = agent.get(url)
        
        page.search('.quote').each do |element|
            tags = []
            element.search('.tags a').each do |el|
                tags << el.text
            end

            if tags.include?(search_tag)
                quote = Quote.create(
                    name: element.search('.text').text,
                    author: element.search('.author').text,
                    author_about: "#{url.delete_suffix('/')}#{element.at('a').values[0]}"
                )
                tags.each { |tag| quote.tags.create(name: tag) }
            end
        end
    end
    
end