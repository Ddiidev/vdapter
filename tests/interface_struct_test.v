module tests

import vdapter { adapter_wip }

pub struct UserComplete {
	name string
	age  int
}

pub interface IUserSimple {
	name string
	age  int
}

pub fn test_one2one_age_int() {
	user_complete := UserComplete{"André", 26}
	user_simple := adapter_wip[IUserSimple, UserComplete](user_complete)

	assert user_simple.name == user_complete.name
	assert user_simple.age == user_complete.age
}