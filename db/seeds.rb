10.times do |n|
  Post.create!(
    name: "test#{n}",
    rule_id: 2,
    room_number: 10000 + n,
    text: "Test Contents",
    password: 1111
  )
end