class CTARoute

  def initialize(stop_id, api_key)

    @stop_id = stop_id
    @api_key = api_key
    @route_info

  end

  def get_route_info

    helper = Helpers.new

    @route_info = HTTParty.get('http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?stpid=' + @stop_id + '&key=' + @api_key)

  end

  def route_info

    helper = Helpers.new

    helper.parse_xml_to_hash(@route_info)

  end

end