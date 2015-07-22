module RailsAdminDSL::OrganizationList
  def organization_list
    list do
      extend RailsAdminDSL::BaseFormatters
      scopes [:include_associations]

      string_config :id, label: 'ID', width: 40
      string_config :name, label: 'Business Name'
      string_config :contact_name, label: 'Contact Name'
      string_config :type, label: 'Organization Type'
      string_config :city, label: 'City'
      string_config :state, label: 'State'
      string_config :expiration_date, label: 'Expiration Date', width: 80
      date_config :last_active, label: 'Last  Active', width: 40
    end
  end
end
