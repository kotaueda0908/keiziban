class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
  end
 has_many :comments, :dependent => :destroy
end
