class Log < ApplicationRecord
	before_save :generate_timestamp

  def generate_timestamp
    self.timestamp_field = DateTime.now
  end
end
