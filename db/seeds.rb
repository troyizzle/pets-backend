# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
[
  {
    attrs: {
      name: 'corgi'
    },
    backstory: {
      body: 'Killer pup here to save the day'
    },
    images: [
      { name: 'regular', filename: 'corgi.png' },
      { name: 'tricolor', filename: 'corgi_tricolor.png' },
      { name: 'hungry', filename: 'corgi_hungry.png', trait: 1 }
    ]
  },
  {
    attrs: {
      name: 'rat'
    },
    backstory: {
      body: 'Coureous rat out lookin for adventure'
    },
    images: [
      { name: 'rat', filename: 'rat.png' }
    ]
  },
  {
    attrs: {
      name: 'cat'
    },
    backstory: {
      body: 'cat'
    },
    images: [
      { name: 'cat', filename: 'cat.png' }
    ]
  },
  {
    attrs: {
      name: 'bear'
    },
    backstory: {
      body: 'dat bear'
    },
    images: [
      { name: 'bear', filename: 'bear.png' }
    ]
  },
  {
    attrs: {
      name: 'chicken'
    },
    backstory: {
      body: 'little chicken'
    },
    images: [
      { name: 'chicken', filename: 'chicken.png' }
    ]
  },
  {
    attrs: {
      name: 'shark'
    },
    backstory: {
      body: 'killer baby shark'
    },
    images: [
      { name: 'shark', filename: 'shark.png' }
    ]
  },
  {
    attrs: {
      name: 'snake'
    },
    backstory: {
      body: 'snake'
    },
    images: [
      { name: 'shark', filename: 'snake.png' }
    ]
  },
  {
    attrs: {
      name: 'pig'
    },
    backstory: {
      body: 'pig'
    },
    images: [
      { name: 'pig', filename: 'pig.png' }
    ]
  },
  {
    attrs: {
      name: 'lion'
    },
    backstory: {
      body: 'lion'
    },
    images: [
      { name: 'lion', filename: 'lion.png' }
    ]
  },
  {
    attrs: {
      name: 'spider'
    },
    backstory: {
      body: 'spider'
    },
    images: [
      { name: 'spider', filename: 'spider.png' }
    ]
  },
  {
    attrs: {
      name: 'rabbit'
    },
    backstory: {
      body: 'rabbit'
    },
    images: [
      { name: 'rabbit', filename: 'rabbit.png' }
    ]
  },
  {
    attrs: {
      name: 'duck'
    },
    backstory: {
      body: 'duck'
    },
    images: [
      { name: 'duck', filename: 'rabbit.png' }
    ]
  },
  {
    attrs: {
      name: 'deer'
    },
    backstory: {
      body: 'deer'
    },
    images: [
      { name: 'deer', filename: 'deer.png' }
    ]
  },
  {
    attrs: {
      name: 'cow'
    },
    backstory: {
      body: 'cow'
    },
    images: [
      { name: 'cow', filename: 'cow.png' }
    ]
  }
].each do |data|
  pet = Pet.create(data[:attrs])
  data[:images].each do |image|
    Pets::Image.create(pet: pet, trait: image[:trait] || 0).picture.attach(
      io: File.open(Rails.root.join('public', 'images', image[:filename])),
      filename: image[:name]
    )
  end

  Pets::Backstory.create(data[:backstory].merge(pet_id: pet.id))
end

[
  {
    attrs: {
      question: 'Where does your Pet like to live?'
    },
    answers: [
      'In the moon',
      'On the rift',
      'Florida'
    ]
  },
  {
    attrs: {
      question: 'What does your Pet like doing?'
    },
    answers: [
      'Trading crypto',
      'Watching scary movies',
      'Cleaning up the roads'
    ]
  }
].each do |data|
  question = ::Pets::Background::Question.create(data[:attrs])
  data[:answers].each do |answer|
    ::Pets::Background::Answer.create(answer: answer, question_id: question.id)
  end
end

# Pets::Food

[
  {
    attrs: {
      weight: 1,
      value: 1,
      rarity: 1,
      hunger: 1
    },
    image: {
      filename: 'apple.png'
    }
  }
].each do |data|
  food = ::Pets::Food.find_or_create_by(data[:attrs])
  food.image.attach(
    io: File.open(Rails.root.join('public', 'images', data[:image][:filename])),
    filename: data[:image][:filename]
  )
end
