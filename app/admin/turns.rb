ActiveAdmin.register Turn do

  filter :client
  filter :professional
  filter :day

  index do
    column 'Client' do |turn|
      turn.client.full_name
    end
    column 'Professional' do |turn|
      turn.professional.full_name
    end
    column 'Date' do |turn|
      turn.date
    end
  end

  form do |f|
    f.inputs "Turns Details" do
      f.input :client_id, :as => :select, :collection => Client.all.map{|x| [x.full_name, x.id]}
      f.input :professional_id, :as => :select, :collection => Professional.all.map{|x| [x.full_name, x.id]}
      f.input :day, :as => :datepicker
      f.input :hour, :as => :time
      f.buttons
    end
  end

  show do
    attributes_table do
      row 'Client' do
        turn.client.full_name
      end
      row 'Professional' do
        turn.professional.full_name
      end
      row 'Day' do
        turn.day.strftime('%d %B, %Y')
      end
      row 'Hour' do
        turn.hour.strftime('%H:%M')
      end
    end
  end

end
