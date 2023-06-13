
new_jersey = State.create(statename: "New Jersey", townname: "Woodland")
new_york = State.create(statename: "New York", townname: "Ithaca")
pennsylvania = State.create(statename: "Pennsylvania", townname: "Batsto")

Hike.create(name: "Franklin Parker Preserve", length: "5.3", difficulty_level: "1",estimated_time: "1.34", state_id: new_jersey.id)
Hike.create(name: "Shu Swamp Preserve", length: "1.3", difficulty_level: "1",estimated_time: "1", state_id: new_york.id)
Hike.create(name: "Batsto", length: "7.6", difficulty_level: "2",estimated_time: "3.38", state_id: pennsylvania.id)