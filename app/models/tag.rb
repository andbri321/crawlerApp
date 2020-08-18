class Tag
  include Mongoid::Document
  field :name, type: String

  belongs_to :quote
end
