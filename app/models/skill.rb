class Skill < ApplicationRecord
  
   validates_presences_of :title, :percent_utilized
end
