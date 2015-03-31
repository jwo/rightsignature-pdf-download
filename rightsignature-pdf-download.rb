require 'bundler'
Bundler.require

require 'json'
require 'cgi'

token = ENV.fetch("API_KEY") { abort "ERROR: the API_KEY is required. run `export API_KEY=xxxx`" }
url = "https://rightsignature.com/api/documents.json"
Dir.mkdir 'docs' unless File.exists?('docs')

result = JSON.parse Http.with_headers("api-token" => token).get(url).to_s

(1..result["page"]["total_pages"]).to_a.each do |page_number|
  this_url = "#{url}?page=#{page_number}"
  result = JSON.parse Http.with_headers("api-token" => token).get(this_url).to_s

  result["page"]["documents"].each do |doc|
    guid = doc["guid"]
    File.open("docs/#{guid}.json", "wb") {|f| f << doc.to_json }
    email = doc["recipients"].find {|r| r["is_sender"] == false }["email"]
    pdf = CGI.unescape doc["signed_pdf_url"]
    `curl -o docs/#{guid}-#{email}.pdf "#{pdf}"`
  end


end
