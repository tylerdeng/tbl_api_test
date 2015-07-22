module RailsAdminDSL::OrganizationEdit
  def organization_edit
    edit do
      extend RailsAdminDSL::BaseFormatters
      field :id do
        hide
      end
      text_field_config :type, label: 'Organization Type *'
      text_field_config :name, label: 'Business Name *'
      text_field_config :web_address, label:  'Website'
      text_field_config :blog, label: 'Blog'
      enum_drop_down_config :established_when, label: 'Year Established', method: :established_years
      text_field_config :uuid, label: 'uuid *'
      group :addresses do
        label 'Contact Information'
        extend RailsAdminDSL::BaseFormatters
        text_field_config :first_name, label: 'First Name *'
        text_field_config :last_name, label: 'Last Name *'
        text_field_config :email, label: 'Email Address *'
        text_field_config :addresses, label: 'Addresses Information'
      end
    end
  end
end
