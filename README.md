
# vdapter

vdapter is a very simple adapter that adapts one structure to another data structure.


## Install
```bash
  v install vdapter
```
## Usage/Examples

```v
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

fn main() {
	user_complete := UserComplete{'André', 26, 90}
	user_simple := adapter[UserSimple](user_complete)

    dump(user_simple)
}
```

Result:
```
[code.v:26] user_simple: UserSimple{
    name: 'André'
    age: 26
}
```

## Functionalities

- [X]  Struct to struct
- [X]  Struct embeded to struct
- [X]  Struct with fields alias or sumtypes
- [ ]  Interface to struct
- [ ]  Struct to interface  
- [ ]  Struct to map


## License

[MIT](https://choosealicense.com/licenses/mit/)

