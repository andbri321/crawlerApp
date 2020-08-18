class QuotesController < ApplicationController
  before_action :set_quote, only: [:show]

  def show
    render json: @quotes
  end

  private

  def set_quote
    quote_ids = Tag.where(name:params[:search_tag]).pluck(:quote_id)
    @quotes = Quote.where(:id.in => quote_ids )
  end

end