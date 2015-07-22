module RailsAdminDSL::Organization
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        extend  RailsAdminDSL::BaseFormatters
        scopes [:include_associations]

        string_config :id, label: 'ID', width: 40
        string_config :name, label: 'Business Name'
        string_config :contact_name, label: 'Contact Name'
        string_config :type, label: 'Organization Type*'
        string_config :city, label: 'City'
        string_config :state, label: 'State'
        string_config :expiration_date, label: 'Expiration Date', width: 80
        date_config :last_active, label: 'Last  Active', width: 40
      end
      edit do
        extend  RailsAdminDSL::BaseFormatters
        field :id do
          hide
        end
        text_field_config :type ,label: 'Organization Type'
        text_field_config :name , label: 'Business Name'
        text_field_config :web_address,label:  'Website'
        text_field_config :blog, label: 'Blog'
        enum_drop_down_config :established_when, label: 'Year Established', method: :established_years
        text_field_config :uuid, label: 'uuid*'
     end
      update do
        field :id do
          show
          label 'Organization Id'
          read_only true
          help false
        end
        field :type do
          read_only true
        end
      end
    end
  end
end
