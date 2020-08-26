class Quote
  include Mongoid::Document

  paginates_per 5
  
  field :name, type: String
  field :author, type: String
  field :author_about, type: String

  has_many :tags, dependent: :destroy

  validates :name, presence: true

  def quote
    "#{self.name}"
  end

end
