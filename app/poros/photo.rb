class Photo
  attr_reader :data,
              :description,
              :url

  def initialize(data)
    @data = data
    @description = data[:description]
    @url = data[:urls][:small]
  end
end