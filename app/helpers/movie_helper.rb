# frozen_string_literal: true

module MovieHelper
  def movie_iframe(movie)
    content_tag(
      :iframe,
      nil,
      src: video_embed(movie.url),
      width: '100%',
      height: 315,
      title: movie.title,
      frameborder: '0',
      allow: 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture',
      allowfullscreen: ''
    )
  end

  private

  def video_embed(video_url)
    regex_id = %r{(?:youtube(?:-nocookie)?\.com/(?:[^/\n\s]+/\S+/|(?:v|e(?:mbed)?)/|\S*?[?&]v=)|youtu\.be/|vimeo\.com/)([a-zA-Z0-9_-]{8,11})}
    match_id = regex_id.match(video_url)
    video_id = ''
    video_id = match_id[1] if match_id && !match_id[1].blank?

    regex_prov = /(youtube|youtu\.be|vimeo)/
    match_prov = regex_prov.match(video_url)
    video_prov = ''
    if match_prov && !match_prov[1].blank?
      video_prov = case match_prov[1]
                   when 'youtube', 'youtu.be'
                     :youtube
                   when 'vimeo'
                     :vimeo
                   end
    end

    case video_prov
    when :youtube
      "//www.youtube.com/embed/#{video_id}"
    when :vimeo
      "//player.vimeo.com/video/#{video_id}"
    end
  end
end
