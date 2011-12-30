ActiveAdmin.register Client do

  filter :profile_first_name, :as => :string, :label => 'First Name'
  filter :profile_last_name,  :as => :string, :label => 'Last Name'
  filter :profile_address,    :as => :string, :label => 'Address'
  filter :profile_email,      :as => :string, :label => 'Email'

  index do
    column "First Name" do |client|
      client.profile.first_name
    end
    column "Last Name" do |client|
      client.profile.last_name
    end
    column "Address" do |client|
      client.profile.address
    end
    column "Phono" do |client|
      client.profile.phono
    end
    column "email" do |client|
      if client.profile.email
        link_to client.profile.email, "mailto:#{client.profile.email}"
      end
    end
    default_actions
  end

  form do |f|
    f.inputs "Personal Data" do
      f.fields_for :profile, f.object.profile || Profile.new do |p|
        p.inputs :first_name, :last_name, :address, :phono, :email
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
        client.profile.full_name
      end
      row 'Address' do
        client.profile.address
      end
      row 'Phono' do
        client.profile.phono
      end
      row 'E-mail' do
        link_to client.profile.email, "mailto:#{client.profile.email}" if client.profile.email
      end
      row 'Observation' do
        client.observation
      end
    end
  end

end
