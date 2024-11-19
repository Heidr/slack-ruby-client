# frozen_string_literal: true
require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new

client.auth_test

client.chat_postMessage(channel: '#general', text: 'Hello World', as_user: true)

# https://api.slack.com/messaging/files#uploading_files
file_path = 'examples/hi_web/hi.gif'
upload_details = client.files_getUploadURLExternal(
  filename: File.basename(file_path),
  length: File.size(file_path)
)

client.files_postUploadURL(
  upload_url: upload_details.upload_url,
  file: Faraday::Multipart::FilePart.new(file_path, 'image/gif'),
)

client.files_completeUploadExternal(
  files: [
    {
      id: upload_details.file_id,
      title: File.basename(file_path)
    }
  ].to_json,
  channel_id: ENV['SLACK_CHANNEL'],
)
