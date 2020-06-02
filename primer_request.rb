


require "uri"
require "net/http"
require "json"

def request(address)
    url = URI(address)
    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Get.new(url)
    request["Cookie"] = "__cfduid=d7f86134963a1e2a362c6740fbf0e4d171590364505"
    response = http.request(request)
    JSON.parse response.read_body 
end

body = request("http://jsonplaceholder.typicode.com/posts")

body.each do |post|
    puts post["title"]
end