module tests

import vdapter { adapter }

pub struct UserComplete {
	email  string
	pass   string
	people PeopleComplete
}

pub struct UserSimple {
	email  string
	pass   string
	people PeopleComplete
}

pub struct PeopleComplete {
	name string
	age  i16
	size i16
}

pub fn test_one2one() {
	user_complete := UserComplete{
		email: 'any@any.com'
		pass: 'password_secret'
		people: PeopleComplete{'André', 26, 90}
	}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.email == user_complete.email
	assert user_simple.pass == user_complete.pass
	assert user_simple.people.name == user_complete.people.name
	assert user_simple.people.age == user_complete.people.age
	assert user_simple.people.size == user_complete.people.size
}
