class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(_id, publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    publish_date < date.today - 10.year
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    else
      puts 'This item cannot be archived'
    end
  end
end
