class Dollar < ApplicationRecord

  after_update :broadcast_to_currency_chanel

  validates :force_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :force_time, presence: true

  def self.instance
    Dollar.first || Dollar.create(force_time: DateTime.current)
  end

  def value
    if self.force_time > DateTime.current
      self.force_value
    else
      real_value
    end
  end

  def broadcast_to_currency_chanel
    ActionCable.server.broadcast 'root_page', { title: 'current_value', value: value }
  end

end
