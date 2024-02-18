module tests

import vdapter { adapter }

pub struct NamesComplete {
	names []string
}

pub struct UserComplete {
	NamesComplete
	age  int
	size int
}

pub struct NamesSimple {
	names []string
}

pub struct UserSimple {
	NamesSimple
	age int
}

// Not recomended
pub fn test_one2one() {
	user_complete := UserComplete{
		names: ['André', 'Luiz']
		age: 26
		size: 90
	}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.names.len == user_complete.names.len
	for name in user_complete.names {
		assert user_simple.names.contains(name), 'not contain name: ${name} in user_simple.names'
	}
	assert user_simple.age == user_complete.age
}
