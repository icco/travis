###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page "/index.html", :layout => false

# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :middleman_simple_thumbnailer

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # https://github.com/plasticine/middleman-imageoptim
  activate :imageoptim do |options|
    options.pngout = false
    options.svgo = false
  end

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

case ENV['TARGET'].to_s.downcase
when 'hostgator'
  activate :deploy do |deploy|
    deploy.method   = :rsync
    deploy.host     = 'welchfamilyweb.com'
    deploy.path     = '/home4/dlnwelch/public_html/traviscwelch.com'
    deploy.build_before = true
  end
else
  activate :deploy do |deploy|
    deploy.method = :git
    deploy.branch = "gh-pages"
    deploy.build_before = true
  end
end
