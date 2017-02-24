class Portfolio < ApplicationRecord
   validates_presences_of :title, :body, :main_image, :thumb_image
end
