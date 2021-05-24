require 'faker'

if Rails.env.development?
  p 'SEEDING DATABASE'

  Author.destroy_all
  Post.destroy_all
  Element.destroy_all

  Author.create!(name: 'Lukas Corbitt', email: 'movalley5@gmail.com', password: '123456')
  Author.create!(name: 'Admin', email: 'admin@test.com', password: '123456')

  5.times do 
    author = Author.new(name: Faker::Book.author, password: '123456')

    author.email = Faker::Internet.email
    author.save!
  end

  25.times do 
    author_ids = Author.all.map(&:id)
    post = Post.new(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph_by_chars(number: 55),
      author_id: author_ids.sample,
      published_at: Time.now,
      published: true
    )

    post.hero_image.attach(
      io: File.open('nasa.jpg'),
      filename: 'nasa.jpg',
      content_type: 'image/jpeg'
    )

    post.save!

    5.times do
      Element.create!(post_id: post.id,
        element_type: 'paragraph',
        content: Faker::Lorem.paragraph(sentence_count: 5)
      )
    end
  end

  p "Created #{Author.all.size} Authors"
  p "Created #{Post.all.size} Posts"
  p "Created #{Element.all.size} Elements"
end