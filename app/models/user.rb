class User
    include Mongoid::Document
    field :email, type: String
    field :password, type: String
  
    def authenticate!(password)
      self.password.eql?(password)
    end
end