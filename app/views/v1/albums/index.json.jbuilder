json.albums @albums do |album|
  json.story album.story

  json.organizations album.organizations do |organization|
    json.name organization.name
  end

  json.publications album.publications do |publication|
    json.name publication.name
  end

  json.subjects album.subjects do |subject|
    json.name subject.name
  end

  json.media album.media do |media|
    json.url = media.url
  end

  if album.try(:event)
    json.event do
      json.type album.event.type
    end
  end
end

json.previous_page @previous_page
json.next_page @next_page
json.total_pages @total_pages
json.total @total_entries

