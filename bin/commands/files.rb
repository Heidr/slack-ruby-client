# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

desc 'Files methods.'
command 'files' do |g|
  g.desc 'Finishes an upload started with files.getUploadURLExternal'
  g.long_desc %( Finishes an upload started with files.getUploadURLExternal )
  g.command 'completeUploadExternal' do |c|
    c.flag 'files', desc: 'Array of file ids and their corresponding (optional) titles.'
    c.flag 'channel_id', desc: 'Channel ID where the file will be shared. If not specified the file will be private.'
    c.flag 'initial_comment', desc: 'The message text introducing the file in specified channels.'
    c.flag 'thread_ts', desc: "Provide another message's ts value to upload this file as a reply. Never use a reply's ts value; use its parent instead."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_completeUploadExternal(options))
    end
  end

  g.desc 'Deletes a file.'
  g.long_desc %( Deletes a file. )
  g.command 'delete' do |c|
    c.flag 'file', desc: 'ID of file to delete.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_delete(options))
    end
  end

  g.desc 'Change the properties of a file (undocumented)'
  g.long_desc %( Change the properties of a file )
  g.command 'edit' do |c|
    c.flag 'file', desc: 'ID of the file to be edited'
    c.flag 'title', desc: 'New title of the file'
    c.flag 'filetype', desc: 'New filetype of the file. See https://api.slack.com/types/file#file_types for a list of all supported types.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_edit(options))
    end
  end

  g.desc 'Gets a URL for an edge external upload'
  g.long_desc %( Gets a URL for an edge external upload )
  g.command 'getUploadURLExternal' do |c|
    c.flag 'filename', desc: 'Name of the file being uploaded.'
    c.flag 'length', desc: 'Size in bytes of the file being uploaded.'
    c.flag 'alt_txt', desc: 'Description of image for screen-reader.'
    c.flag 'snippet_type', desc: 'Syntax type of the snippet being uploaded.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_getUploadURLExternal(options))
    end
  end

  g.desc 'Gets information about a file.'
  g.long_desc %( Gets information about a file. )
  g.command 'info' do |c|
    c.flag 'file', desc: 'Specify a file by providing its ID.'
    c.flag 'cursor', desc: "Parameter for pagination. File comments are paginated for a single file. Set cursor equal to the next_cursor attribute returned by the previous request's response_metadata. This parameter is optional, but pagination is mandatory: the default value simply fetches the first 'page' of the collection of comments. See pagination for more details."
    c.flag 'limit', desc: "The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached."
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_info(options))
    end
  end

  g.desc 'List for a team, in a channel, or from a user with applied filters.'
  g.long_desc %( List for a team, in a channel, or from a user with applied filters. )
  g.command 'list' do |c|
    c.flag 'channel', desc: 'Filter files appearing in a specific channel, indicated by its ID.'
    c.flag 'files', desc: '.'
    c.flag 'show_files_hidden_by_limit', desc: 'Show truncated file info for files hidden due to being too old, and the team who owns the file being over the file limit.'
    c.flag 'team_id', desc: 'encoded team id to list files in, required if org token is used.'
    c.flag 'ts_from', desc: 'Filter files created after this timestamp (inclusive).'
    c.flag 'ts_to', desc: 'Filter files created before this timestamp (inclusive).'
    c.flag 'types', desc: 'Filter files by type (see below). You can pass multiple values in the types argument, like types=spaces,snippets.The default value is all, which does not filter the list.'
    c.flag 'user', desc: 'Filter files created by a single user.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_list(options))
    end
  end

  g.desc 'Revokes public/external sharing access for a file'
  g.long_desc %( Revokes public/external sharing access for a file )
  g.command 'revokePublicURL' do |c|
    c.flag 'file', desc: 'File to revoke.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_revokePublicURL(options))
    end
  end

  g.desc 'Share an existing file in a channel (undocumented)'
  g.long_desc %( Share an existing file in a channel )
  g.command 'share' do |c|
    c.flag 'file', desc: 'ID of the file to be shared'
    c.flag 'channel', desc: 'Channel to share the file in. Works with both public (channel ID) and private channels (group ID).'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_share(options))
    end
  end

  g.desc 'Enables a file for public/external sharing.'
  g.long_desc %( Enables a file for public/external sharing. )
  g.command 'sharedPublicURL' do |c|
    c.flag 'file', desc: 'File to share.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_sharedPublicURL(options))
    end
  end

  g.desc 'Uploads or creates a file.'
  g.long_desc %( Uploads or creates a file. )
  g.command 'upload' do |c|
    c.flag 'channels', desc: 'Comma-separated list of channel names or IDs where the file will be shared.'
    c.flag 'content', desc: 'File contents via a POST variable. If omitting this parameter, you must provide a file.'
    c.flag 'file', desc: 'File contents via multipart/form-data. If omitting this parameter, you must submit content.'
    c.flag 'filename', desc: 'Filename of file.'
    c.flag 'filetype', desc: 'A file type identifier.'
    c.flag 'initial_comment', desc: 'The message text introducing the file in specified channels.'
    c.flag 'thread_ts', desc: "Provide another message's ts value to upload this file as a reply. Never use a reply's ts value; use its parent instead."
    c.flag 'title', desc: 'Title of file.'
    c.action do |_global_options, options, _args|
      puts JSON.dump($client.files_upload(options))
    end
  end
end
