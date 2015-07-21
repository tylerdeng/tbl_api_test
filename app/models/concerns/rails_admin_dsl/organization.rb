module RailsAdminDSL::Organization
  extend ActiveSupport::Concern
  included do
    rails_admin do
      list do
        scopes [:include_addresses]
        def list_config(field_value, label_value, column_width_value)
          field field_value do
            label label_value if label_value.present?
            column_width column_width_value if column_width_value.present?
          end
        end
        def list_config_bindings_2(field_value, formatted_value_1, formatted_value_2)
          field field_value do
            if formatted_value_1.present? && formatted_value_2.present?
              formatted_value { "#{bindings[:object][formatted_value_1]} #{bindings[:object][formatted_value_2]}" }
            end
          end
        end
        def list_config_bindings_1(field_value, formatted_value_1)
          field field_value do
            formatted_value { bindings[:object].addresses[0][formatted_value_1] if bindings[:object].addresses.present? } if formatted_value_1.present?
          end
        end
        list_config(:id, 'ID', 40)
        list_config(:name, 'Business Name', 100)
        list_config(:contact_name, 'Contact Name', 100)
        list_config_bindings_2(:contact_name, :first_name, :last_name)
        list_config(:type, 'Type', 100)
        list_config(:city, 'City', 100)
        list_config(:state, 'State', 100)
        list_config_bindings_1(:city, :city)
        list_config_bindings_1(:state, :state)
        list_config(:expiration_date, 'Expiration Date', 100)
        list_config(:activated_date, 'Last Active', 100)
      end
      edit do
        def edit_config(field_value, label_value, hide_value, help_value)
          field field_value do
            label label_value if label_value.present?
            hide if hide_value.present?
            help false unless help_value.present?
          end
        end
        edit_config(:id, '', 'hide', 'help')
        edit_config(:type, 'Organization Type*', '', '')
        edit_config(:name, 'Organization Name*', '', '')
        edit_config(:web_address, 'Website', '', '')
        edit_config(:blog, '', '', '')
        field :established_when, :enum do
          show
          label 'Year Established'
          help false
          enum do
            year_array = 1980..Time.now.year
            year_time_stamp_array = []
            year_array.reverse_each do |f|
              year_time_stamp_array.push [f, (Time.parse "#{f}-1-1 00:00:00").to_i]
            end
            year_time_stamp_array.push ['Pre-1980', (Time.parse '1970-1-1 00:00:00').to_i]
          end
        end
        edit_config(:uuid, 'Uuid*', '', '')
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
