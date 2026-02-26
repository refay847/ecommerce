class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  # stale_when_importmap_changes

  # Tell Devise to use the main layout
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "application"  # <- uses your normal layout
    else
      "application"
    end
  end
end
