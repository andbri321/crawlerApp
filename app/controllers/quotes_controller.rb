class QuotesController < ApplicationController
  before_action :set_quote, only: [:show]

  def show
    render json: @quote
  end

  def index
    @quotes = Quote.all

    render json: @quotes
  end

  private

  def set_quote
    @quote = Quote.where(name:params[:search_tag])
  end

end
