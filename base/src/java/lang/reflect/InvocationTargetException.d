module java.lang.reflect.InvocationTargetException;

import java.lang.all;

class InvocationTargetException : Exception {
	Exception cause;
	this(Exception e = null, String msg = null) {
		super(msg);
		cause = e;
	}

	alias getTargetException = getCause;
	Exception getCause() {
		return cause;
	}
}
