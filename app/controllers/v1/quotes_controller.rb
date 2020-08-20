

module V1
  class QuotesController < ApplicationController
    before_action :set_quotes, only: [:show]

    def show
      render json: @quotes
    end

    private

    def set_quotes
      if Tag.where(name:params[:search_tag]).empty?
        crawler = Crawler.new
        crawler.get_quotes('http://quotes.toscrape.com/',params[:search_tag])
      end

      quote_ids = Tag.where(name:params[:search_tag]).pluck(:quote_id)
      @quotes = Quote.where(:id.in => quote_ids )
    end

  end
end