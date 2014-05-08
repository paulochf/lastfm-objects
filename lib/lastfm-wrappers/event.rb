class Event
    extend FluidModel
    hash_initialized :id, :title, :artists, :venue,
        :start_date, :start_time, :description,
        :images, :attendance, :reviews,
        :tags, :url, :website, :tickets,
        :cancelled

end
