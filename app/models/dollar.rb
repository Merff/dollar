class Dollar < ApplicationRecord

  after_update :broadcast_to_currency_chanel

  validates :force_value, presence: true, numericality: { greater_than: 0 }
  validates :force_time, presence: true

  def self.instance
    Dollar.first || Dollar.create
  end

  def value
    if self.force_time && (self.force_time > DateTime.current)
      self.force_value
    else
      real_value
    end
  end

  private

  def broadcast_to_currency_chanel
    ActionCable.server.broadcast 'root_page', { title: 'current_value', value: value }
  end

end
