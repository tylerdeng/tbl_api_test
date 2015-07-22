module RailsAdminDSL::Address
  extend ActiveSupport::Concern
  included do
    rails_admin do
      edit do
        extend RailsAdminDSL::BaseFormatters
        text_field_config :type, label: 'Type *'
        text_field_config :phone_number, label: 'Phone'
        text_field_config :address_line1, label: 'Address Line1 *'
        text_field_config :address_line2
        text_field_config :city
        text_field_config :zipcode, label: 'Zip Code / Postal Code'
        text_field_config :state, label: 'State / Province'
        text_field_config :country_code, label: 'Country'
      end
    end
  end
end
