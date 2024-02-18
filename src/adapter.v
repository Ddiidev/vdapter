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
