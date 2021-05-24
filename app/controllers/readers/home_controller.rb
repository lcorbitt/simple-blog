module Readers
  class HomeController < ReadersController
    def index
      @pagy, @posts = pagy(Post.published.most_recently_published, items: 9)
    end
  end
end
