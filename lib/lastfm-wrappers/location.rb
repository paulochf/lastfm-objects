class Location
    extend FluidModel
    hash_initialized :city, :country, :street, :postalcode,
        :geopoint, :timezone
end
