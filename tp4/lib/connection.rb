require 'net/http'
#
class Connection

  def initialize(url)
    @url = url
    @uri = URI(url)
  end

  def test(username, password)
    req = Net::HTTP::Get.new(@uri)
    req.basic_auth(username, password)
    res = Net::HTTP.start(@uri.hostname, @uri.port) {|http| http.request(req)}
    case res
    when Net::HTTPSuccess
      true
    else
      false
    end
  end

end
