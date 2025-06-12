require "csv"
require "json"

ActiveRecord::Base.transaction do
  col = Country.find_or_create_by!(name: "Colombia", code: "COL")
  usa = Country.find_or_create_by!(name: "United States", code: "USA")

  palmira = col.cities.find_or_create_by!(name: "Palmira", code: "COQPI")
  bogota = col.cities.find_or_create_by!(name: "Bogotá", code: "COBOG")
  sogamoso = col.cities.find_or_create_by!(name: "Sogamoso", code: "COSOX")
  orlando = usa.cities.find_or_create_by!(name: "Orlando", code: "USORL")
  miami = usa.cities.find_or_create_by!(name: "Miami", code: "USMIA")
  new_york = usa.cities.find_or_create_by!(name: "New York", code: "USNYC")

  palmira.coverage_zones.find_or_create_by!(code: "co_palmira")
  bogota.coverage_zones.find_or_create_by!(code: "co_bogota")
  sogamoso.coverage_zones.find_or_create_by!(code: "co_sogamoso")
  orlando.coverage_zones.find_or_create_by!(code: "usa_orlando")
  miami.coverage_zones.find_or_create_by!(code: "usa_miami")
  new_york.coverage_zones.find_or_create_by!(code: "usa_new_york")

  admin = User.find_or_create_by!(email: "admin@quicknhandy.com") do |user|
    user.password = "Chechonito14."
    user.first_name = "Admin"
    user.last_name = "of QuickNHandy"
    user.time_zone = "America/New_York"
    user.zip_code = "33030"
    user.birthday = Date.parse("2001-01-14")
    user.phone_number = "3185824979"
    user.country_code = "+57"
  end

  admin.add_role(:admin) unless admin.has_role? :admin

  admin.addresses.find_or_create_by!(
    address: "Carrera 29 #24 - 73",
    tag: 0,
    lat: 3.448883,
    lon: -76.505069,
    description: "Casa esquinera amarilla",
    city: palmira
  )

  csv_categories_path = Rails.root.join('db/seeds/categories.csv')

  CSV.foreach(csv_categories_path, headers: true) do |row|
    Category.find_or_create_by!(id: row["id"].to_i) do |category|
      title = JSON.parse(row["title"] || "{}")
      description = JSON.parse(row["description"] || "{}")
      I18n.available_locales.each do |locale|
        I18n.with_locale(locale) do
          category.title = title[locale.to_s]
          category.description = description[locale.to_s]
        end
      end
      category.icon = row["icon"]
      category.price_hour_cents = row["price_hour_cents"].to_i
      category.ancestry = row["ancestry"] == "NULL" ? nil : row["ancestry"]
    end
  end

  csv_service_types_path = Rails.root.join('db/seeds/service_types.csv')

  CSV.foreach(csv_service_types_path, headers: true) do |row|
    ServiceType.find_or_create_by!(id: row["id"].to_i) do |service_type|
      title = JSON.parse(row["title"] || "{}")
      I18n.available_locales.each do |locale|
        I18n.with_locale(locale) { service_type.title = title[locale.to_s] }
      end
      service_type.category_id = row["category_id"].to_i
      service_type.request_count = row["request_count"].to_i
      service_type.subcategory_id = row["subcategory_id"].to_i
      service_type.banner_image = row["banner_image"]
      service_type.icon = row["icon_url"]
    end
  end
end
