require 'bundler'
include 'CTARoute'
include 'Helpers'
include 'APIResponse'
Bundler.require()

error_messages = Hash.new
error_messages['404'] = 'The resource you are looking for does not exist.'
error_messages['no_api_key'] = 'You did not provide an API key'
error_messages['no_stop_id'] = 'You did not provide a Stop_ID. Here is a list of them: http://www.transitchicago.com/riding_cta/how_to_guides/bustrackerlookup_stoplists.aspx'

get '/' do

  response = APIResponse.new('404', error_messages['404'])
  response.create_response

end

# expect an API key + stop_id
get '/cta_api/' do

  cross_origin

  api_key = params[:api_key]
  stop_id = params[:stop_id]

  if api_key == null && stop_id == null
    response = APIResponse.new('403', error_messages['no_api_key'] + "\n" + error_messages['no_stop_id'])
  end

  if api_key == null
    response = APIResponse.new('403', error_messages['no_api_key'])
  end

  if stop_id == null
    response = APIResponse.new('400', error_messages['no_stop_id'])
  end

  if api_key && stop_id
    cta_route = CTARoute.new(stop_id, api_key)
    response = APIResponse.new('200', cta_route.route_info)
  end

end