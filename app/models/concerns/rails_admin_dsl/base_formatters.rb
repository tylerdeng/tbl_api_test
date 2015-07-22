module RailsAdminDSL::BaseFormatters
  def string_config(attr, options  = {})
    settings = { width: 100,
                 label: '' }
    settings.merge! options
    field attr do
      label settings[:label]
      column_width settings[:width]
    end
  end

  def date_config(attr, options = {})
    settings = { width: 100,
                 label: '' }
    settings.merge! options
    field attr, :date do
      label settings[:label]
      column_width settings[:width]
      strftime_format '%m/%d/%y'
    end
  end

  def text_field_config(attr, options = {})
    settings = { help: false,
                 label: '' }
    settings.merge! options
    field attr do
      label settings[:label]
      help settings[:help]
    end
  end

  def enum_drop_down_config(attr, options = {})
    settings = { help: false,
                 label: '' }
    settings.merge! options
    field attr, :enum  do
      show
      label settings[:label]
      help settings[:help]
      enum_method do
        settings[:method]
        :established_years
      end
    end
  end
end
