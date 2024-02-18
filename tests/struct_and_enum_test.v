module tests

import vdapter { adapter }

pub struct UserComplete {
	email string
	pass  string
	typ   Types
}

pub struct UserSimple {
	email string
	pass  string
	typ   OtherTypes
}

pub enum Types {
	typ_1
	typ_2
	typ_3
}

pub enum OtherTypes {
	typ_1
	typ_2
	typ_3
}

pub fn test_one2one() {
	user_complete := UserComplete{
		email: 'any@any.com'
		pass: 'password_secret'
		typ: .typ_1
	}
	user_simple := adapter[UserSimple](user_complete)

	assert user_simple.email == user_complete.email
	assert user_simple.pass == user_complete.pass
	assert user_simple.typ == .typ_1 && user_complete.typ == .typ_1
}
