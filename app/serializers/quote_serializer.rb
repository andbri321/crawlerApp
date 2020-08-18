class QuoteSerializer < ActiveModel::Serializer
  attributes :name,:author,:author_about

  has_many :tags

  def tags
    Tag.where(quote_id:object.id).pluck(:name)
  end

end