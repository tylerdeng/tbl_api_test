Given(/^the system knows about the following albums:$/) do |albums|
  albums.hashes.each do |album|
    FactoryGirl.create(:album, story: album['story'])
  end
end

When(/^the client requests a list of (.*?)s?$/) do |type|
  get("/v1/#{type.pluralize.downcase.tr(' ', '-')}")
end

Then(/^the response is a list containing (#{CAPTURE_INT}) (.*?)s?$/) do |count, type|
  data = JSON.parse(last_response.body)
  validate_list(data["#{type.pluralize.downcase.tr(' ', '-')}"], of: type, count: count)
end

Then(/^(#{CAPTURE_INT}) (?:.*?) ha(?:s|ve) the following attributes:$/) do |count, table|
  expected_item = table.hashes.each_with_object({}) do |row, hash|
    name = row['attribute']
    value = row['value']
    type = row['type']
    hash[name.tr(' ', '_').camelize(:lower)] = value.to_type(type.constantize)
  end
  data = JSON.parse(last_response.body)
  matched_items = data["#{table.pluralize.downcase.tr(' ', '-')}"].select { |item| item == expected_item }
  expect(matched_items.count).to eq(count)
end

Then(/^(#{CAPTURE_INT}) (.*?) (?:contains|includes) the following attributes:$/) do |count, obj_name, table|
  expected_item = table.hashes.each_with_object({}) do |row, hash|
    name = row['attribute']
    value = row['value']
    type = row['type']
    hash[name.tr(' ', '_').camelize(:lower)] = value.to_type(type.constantize)
  end
  data = JSON.parse(last_response.body)
  matched_items = []
  expected_item.keys.each do |key|
    matched_items << data["#{obj_name.pluralize.downcase.tr(' ', '-')}"].select { |item| item[key] == expected_item[key] }
  end
  expect(matched_items.count).to eq(count)
end
