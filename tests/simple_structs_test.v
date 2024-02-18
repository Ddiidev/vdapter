module tests

import vdapter { adapter }

pub struct UserComplete {
	name string
	age  i16
	size i16
}

pub struct UserSimple {
	name string
	age  i16
}

pub fn test_one2one() {
	user_complete := UserComplete{'André', 26, 90}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.name == user_complete.name
	assert user_simple.age == user_complete.age
}
