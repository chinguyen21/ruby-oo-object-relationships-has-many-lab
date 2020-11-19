class Author
  attr_accessor :name

  @@all_authors = []
  def initialize(name)
    @name = name
    self.class.all_authors << self
  end

  def self.all_authors
    @@all_authors
  end

  def posts
    Post.all.select {|post| post.author == self}
  end

  def add_post(post)
    post.author = self
  end

  def add_post_by_title(title)
    new_post = Post.new(title)
    new_post.author = self
  end

  def self.post_count
    total = 0
    self.all_authors.each do |author|
      total += author.posts.length
    end
    total
  end
end
