json.owl(@images) do |image|
  json.item render partial: 'carousel_image', locals: { image: image }
end
