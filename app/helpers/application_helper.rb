module ApplicationHelper

  def gravatar_for(runner, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(runner.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: runner.runnername, class: "gravatar")
  end

end
