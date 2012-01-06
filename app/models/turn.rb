class Turn < ActiveRecord::Base
  belongs_to :client
  belongs_to :professional

   validate :client_id, :presence => true
   validate :professional_id, :presence => true

   def date
    "#{day.strftime('%d %B, %Y')} #{hour.strftime('%H:%M')}"
   end
end
