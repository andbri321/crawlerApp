class QuoteSerializer < ActiveModel::Serializer
  attributes :name,:author,:author_about

  has_many :tags do
    link(:related) { contact_tags_url(object.id) }
  end
  
end
