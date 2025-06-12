json.extract! address, :id, :lat, :lon, :address, :tag, :description
json.tag Address.tags[address.tag]
