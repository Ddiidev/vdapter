module tests

import vdapter { adapter }

pub struct UserComplete {
	names []string
	age   int
	size  int
}

pub struct UserSimple {
	names []string
	age   int
}

// Not recomended
pub fn test_one2one() {
	user_complete := UserComplete{['André', 'Luiz'], 26, 90}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.names.len == user_complete.names.len
	for name in user_complete.names {
		assert user_simple.names.contains(name), 'not contain name: ${name} in user_simple.names'
	}
	assert user_simple.age == user_complete.age
}
