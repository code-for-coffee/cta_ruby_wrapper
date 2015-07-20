class APIResponse

  def initialize(status_code, data)

    @data = data
    @status_code = status_code
    @response_object = nil

  end

  def create_response

    @response_object = Hash.new
    @response_object[:status_code] = @status_code
    @response_object[:data] = @data

    @response_object.to_json

  end

end