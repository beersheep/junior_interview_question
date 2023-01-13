class Campaign
  attr_reader :start_date, :end_date, :discount_ratio

  def initialize(**attrs)
    attrs.each do |(k, v)|
      self.send(:"#{k}=", v)
    end
  end

  def self.running_campaigns(time)
    campaigns.select do |campaign|
      time >= campaign.start_date && time < campaign.end_date
    end
  end

  private_class_method :new

  private

  attr_writer :start_date, :end_date, :discount_ratio

  def self.campaigns
    [
      new(start_date: Time.new(2023, 1, 1), end_date: Time.new(2023, 1, 9), discount_ratio: 15),
      new(start_date: Time.new(2023, 1, 5), end_date: Time.new(2023, 1, 15), discount_ratio: 20),
      new(start_date: Time.new(2023, 1, 31), end_date: Time.new(2023, 2, 1), discount_ratio: 35),
    ]
  end
end
