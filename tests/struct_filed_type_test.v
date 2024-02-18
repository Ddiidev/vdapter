module tests

import vdapter { adapter }

pub struct UserComplete {
	name string
	age  MinAny
}

pub struct UserSimple {
	name string
	age  MinAnySimple
}

type MinAny = f32 | int
type MinAnySimple = f32 | int

pub fn test_one2one_age_int() {
	user_complete := UserComplete{'André', 26}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.name == user_complete.name

	if user_simple.age is int && user_complete.age is int {
		assert user_simple.age == user_complete.age
	} else {
		assert false
	}
}

pub fn test_one2one_age_f32() {
	user_complete := UserComplete{'André', f32(26.4)}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.name == user_complete.name
	if user_simple.age is f32 && user_complete.age is f32 {
		assert user_simple.age == user_complete.age
	} else {
		assert false
	}
}
