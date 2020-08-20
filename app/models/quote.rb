class Quote
  include Mongoid::Document
  field :name, type: String
  field :author, type: String
  field :author_about, type: String

  has_many :tags, dependent: :destroy

  def quote
    self.name
  end

end
