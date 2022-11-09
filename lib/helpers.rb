use_helper Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Text
include Nanoc::Helpers::XMLSitemap

def slug_and_created_at(post)
  match = /([0-9]+)\-([0-9]+)\-([0-9]+)\-([^\/]+)/.match(post.identifier.without_ext)
  if match
    y, m, d, slug = match.captures

    [slug, "#{y}-#{m}-#{d}"]
  else
    [post.identifier.without_ext, ""]
  end
end

def get_pretty_date(date_field)
  attribute_to_time(date_field).strftime('%b %-d, %Y')
end

def sort_blog_posts(posts)
  posts.sort do |post_a, post_b|
    slug_a, created_at_a = slug_and_created_at(post_a)
    slug_b, created_at_b = slug_and_created_at(post_b)

    created_at_b <=> created_at_a
  end
end

def reading_time(content)
  words_per_minute = 150
  unit = 'minutes'
  text = strip_html(content)
  n = (text.scan(/\w+/).length / words_per_minute).to_i

  return "#{n} minutes" if n > 1

  "1 minute"
end


HOME_PAGE_DETAILS = [
  {
    :title => "Co-Founder & CTO at Kadalu Technologies",
    :url => "https://kadalu.tech",
    :image => "https://kadalu-tech.github.io/images/logo.svg",
    :summary => %{100% Open Source, distributed storage solution based on GlusterFS. Kadalu Storage provides a modern storage manager with ReST APIs. Kadalu Technologies provides Enterprise support for Kadalu Storage, Consultancy and Gluster feature development services. Visit <a href="https://kadalu.tech">kadalu.tech</a> for more details.}
  },
  {
    :title => "Maintainer of Kadalu Storage",
    :url => "https://github.com/kadalu",
    :image => "https://avatars.githubusercontent.com/u/48346407?s=50&v=4",
    :summary => %{100% Open Source, distributed storage solution based on GlusterFS. Kadalu Storage provides a modern storage manager with ReST APIs. Cloud hosted <a href="https://console.kadalu.tech">Console(UI)</a> lets you get started with Kadalu Storage within minutes.}
  },
  {
    :title => "Gluster Core Team member",
    :url => "https://gluster.org",
    :image => "https://www.gluster.org/wp-content/uploads/2016/03/gluster-ant.png",
    :summary => "Gluster is a free and open source software scalable network filesystem."
  },
  {
    :title => "Creator of Sanka",
    :url => "https://aravindavk.in/sanka",
    :image => "/images/sanka-v2.png",
    :summary => "Free and Open Source web application to convert from ASCII to Unicode and Unicode to ASCII."
  },
  {
    :title => "Creator of Chitra",
    :url => "https://aravindavk.in/chitra",
    :image => "https://aravindavk.in/chitra/static/logo.png",
    :summary => "Chitra is a 2D graphics library for Crystal programming language."
  }
]
