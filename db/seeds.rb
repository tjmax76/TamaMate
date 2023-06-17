10.times do |n|
  Post.create!(
    name: "test#{n}",
    rule_id: 2,
    room_number: 10000 + n,
    text: "Test Contents",
    password: 1111
  )
  Post.create!(
    name: "test#{n}",
    rule_id: 3,
    room_number: 10000 + n,
    text: "Test Contents",
    password: 1111
  )
  Post.create!(
    name: "test#{n}",
    rule_id: 4,
    room_number: 10000 + n,
    text: "Test Contents",
    password: 1111
  )
  Post.create!(
    name: "test#{n}",
    rule_id: 5,
    room_number: 10000 + n,
    text: "Test Contents",
    password: 1111
  )
end