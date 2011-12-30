ActiveAdmin.register Professional do

  filter :profile_dni,        :as => :string, :label => "ID/DNI"
  filter :profile_first_name, :as => :string, :label => 'First Name'
  filter :profile_last_name,  :as => :string, :label => 'Last Name'
  filter :profile_email,      :as => :string, :label => 'Email'

  index do
    column "ID/DNI" do |professional|
      professional.profile.dni
    end
    column "First Name" do |professional|
      professional.profile.first_name
    end
    column "Last Name" do |professional|
      professional.profile.last_name
    end
    column "email" do |professional|
      if professional.profile.email
        link_to professional.profile.email, "mailto:#{professional.profile.email}"
      end
    end
    default_actions
  end

  form do |f|
    f.inputs "Personal Data" do
      f.fields_for :profile, f.object.profile || Profile.new do |p|
        p.inputs :dni, :first_name, :last_name, :address, :phono, :mobile_phono, :email
      end
    end
    f.inputs "More" do
      f.input :observation
    end
    f.buttons
  end

  show do
    attributes_table do
      row 'Full Name' do
        professional.profile.full_name
      end
      row "ID/DNI" do
        professional.profile.dni
      end
      row 'Address' do
        professional.profile.address
      end
      row 'Phono' do
        professional.profile.phono
      end
      row 'Mobile Phono' do
        professional.profile.mobile_phono
      end
      row 'E-mail' do
        link_to professional.profile.email, "mailto:#{professional.profile.email}" if professional.profile.email
      end
      row 'Observation' do
        professional.observation
      end
    end
  end

end
