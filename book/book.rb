require_relative '../item'
require 'json'

class Book < Item
    attr_accessor :label, :publisher, :cover_state

    def initialize(publisher, cover_state, publish_date)
        super(publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        super || cover_state == "bad"
    end

    def to_json(*_args)
        {
            "publish_date" => @publish_date,
            "publisher" => @publisher,
            "cover_state" => @cover_state
        }.to_json(*_args)
    end
end
