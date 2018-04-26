#include <am.h>
#include <amdev.h>
#include <zmfio.h>

_KbdReg readkb() {
	int what = 1;
	while (_device(what) && _device(what)->id != _DEV_INPUT)
			what++;
	//printf("what == %d\n", what);
	_Device *keyboard = _device(what);
	_KbdReg kbreg;

	keyboard->read(_DEVREG_INPUT_KBD, &kbreg, sizeof(kbreg));
	return kbreg;
}
