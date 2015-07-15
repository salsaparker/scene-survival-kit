module PlaylistsHelper

  def embed_yt_url(url)
    # YouTube iframes expect urls in this format: https://www.youtube.com/embed/youtube_id
    # adapted from http://stackoverflow.com/questions/6556559/youtube-api-extract-video-id:
    player_match = url.to_s.match(/youtube.com.*(?:\/|v=)([^&$]+)/)
    yt_uid = player_match[1]
    yt_url = 'https://www.youtube.com/embed/' + yt_uid
    # binding.pry
  end
 
  def embed_sc_url(url)
    url.to_s.match(/soundcloud.com.*(?:\/|v=)/)
    sc_playlist = url
    sc_url = 'https://w.soundcloud.com/player/?url=' + sc_playlist
    # binding.pry
  end
end