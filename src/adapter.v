module vdapter

// adapter[T] T is the target type and value is its original value
// ex:
//
// dump(adapter[SecondStruct](PrimaryStruct {
// 	name: "André"
// 	age: 26
// }))
//
// Result:
// ```v
// 	SecondStruct {
// 		age: 26
// 	}
// ```
pub fn adapter[T](value &voidptr) T {
	mut result := &T{}
	$if T is $struct {
		result = &T(value)
	} $else $if T !is $map {
		result = &T(*value)
	}
	return *result
}

// adapter_wip[O, T]
// O is type of the source data;
// T is the target type and value is its original value;
// ex:
//
// dump(adapter[PrimaryStruct, SecondStruct](PrimaryStruct {
// 	name: "André"
// 	age: 26
// }))
//
// target:
// ```v
// 	SecondStruct {
// 		age: 26
// 	}
// ```
pub fn adapter_wip[O, T](origin O) T {
	$if O is $interface {
		return adapter_interface_to_struct[O, T](origin)
	} $else {
		return adapter_default[O, T](origin)
	}

	return T{}
}

fn adapter_interface_to_struct[O, T](origin O) T {
	mut target := T{}

	$for o_field in O.fields {
		$for t_field in T.fields {
			if o_field.name == t_field.name {
				$if t_field.typ is int {
					target.$(t_field.name) = *&int(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is i32 {
					target.$(t_field.name) = *&i32(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is i64 {
					target.$(t_field.name) = *&i64(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is i16 {
					target.$(t_field.name) = *&i16(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is i8 {
					target.$(t_field.name) = *&i8(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is u8 {
					target.$(t_field.name) = *&u8(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is u16 {
					target.$(t_field.name) = *&u16(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is u32 {
					target.$(t_field.name) = *&u32(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is u64 {
					target.$(t_field.name) = *&u64(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is isize {
					target.$(t_field.name) = *&isize(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is usize {
					target.$(t_field.name) = *&usize(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is int {
					target.$(t_field.name) = *&int(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is f32 {
					target.$(t_field.name) = *&f32(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is f64 {
					target.$(t_field.name) = *&f64(voidptr(origin.$(t_field.name)))
				} $else $if t_field.typ is string {
					target.$(t_field.name) = *&string(origin.$(t_field.name))
				} $else {
					target.$(t_field.name) = origin.$(t_field.name)
				}
			}
		}
	}

	return target
}

fn adapter_default[O, T](origin O) T {
	mut target := T{}

	$for o_field in O.fields {
		$for t_field in T.fields {
			if o_field.name == t_field.name {
				$if t_field.typ is $int {
					target.$(t_field.name) = origin.$(t_field.name)
				} $else $if t_field.typ is $float {
					target.$(t_field.name) = origin.$(t_field.name)
				} $else $if t_field.typ is string {
					target.$(t_field.name) = origin.$(t_field.name)
				} $else $if t_field.typ is $option {
					target.$(t_field.name) = origin.$(t_field.name)
				} $else {
					
					// target.$(t_field.name) = origin.$(t_field.name)
				}
			}
		}
	}

	return target
}