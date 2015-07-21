def validate_list(data, of: nil, count: nil)
  expect(data).to be_a_kind_of(Array)
  expect(data.count).to eq(count) unless count.nil?
  unless of.nil?
    validate_item = "validate_#{of.singularize.downcase.tr(' ', '_')}".to_sym
    data.each { |item| send(validate_item, item) }
  end
end

def validate_album(data)
  expect(data['story']).to be_a_kind_of(String)
  expect(data['story']).to_not be_empty
end
