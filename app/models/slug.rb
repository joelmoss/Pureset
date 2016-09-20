class Slug < ApplicationRecord
  belongs_to :sluggable, polymorphic: true
end
